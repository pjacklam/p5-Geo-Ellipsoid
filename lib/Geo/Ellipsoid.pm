#	Geo::Ellipsoid
#
#	This package implements an Ellipsoid class to perform
#	geometrical calculations on the surface of an ellipsoid.
#
#	This is a Perl conversion of existing Fortran code (see
#	ACKNOWLEDGEMENTS) and the author of this class makes no 
#	claims of originality. Nor can he even vouch for the 
#	results of the calculations, although they do seem to 
#	work for him and have been tested against other methods.

package Geo::Ellipsoid;

use warnings;
use strict;

use Math::Trig;
use Carp;

=head1 NAME

Geo::Ellipsoid - Calculate positions, distances, and bearings on
the surface of an ellipsoid.

=head1 VERSION

Version 0.902, released November 4, 2005.

=cut

our $VERSION = '0.902';
our $DEBUG = 0;

=head1 SYNOPSIS

  use Geo::Ellipsoid;
  $geo = Geo::Ellipsoid->new(ellipsoid=>'NAD27', units=>'degrees');
  @origin = ( 37.619002, -122.374843 );    # SFO
  @dest = ( 33.942536, -118.408074 );      # LAX
  ( $range, $bearing ) = $geo->to( @origin, @dest );
  ($lat,$lon) = $geo->at( @origin, 45.0, 2000 );
  ( $x, $y ) = $geo->displacement( @origin, $lat, $lon );
  @pos = $geo->location( $lat, $lon, $x, $y );

=head1 DESCRIPTION

Geo::Ellipsoid performs geometrical calculations on the surface of 
an ellipsoid. An ellipsoid is a three-dimension object formed from 
the rotation of an ellipse about one of its axes. The approximate 
shape of the earth is an ellipsoid, so Geo::Ellipsoid can accurately
calculate distance and bearing between two widely-separated locations 
on the earth's surface.

The shape of an ellipsoid is defined by the lengths of its
semi-major and semi-minor axes. The shape may also be specifed by
the flattening ratio C<f> as:

    f = ( semi-major - semi-minor ) / semi-major
    
which, since f is a small number, is normally given as the reciprocal 
of the flattening C<1/f>.

The shape of the earth has been surveyed and estimated differently
at different times over the years. The two most common sets of values
used to describe the size and shape of the earth in the United States
are 'NAD27', dating from 1927, and 'WGS84', from 1984. United States
Geological Survey topographical maps, for example, use one or the
other of these values, and commonly-available Global Positioning
System (GPS) units can be set to use one or the other.
See L<"DEFINED ELLIPSOIDS"> below for the ellipsoid survey values
that may be selected for use by Geo::Ellipsoid.

=over

=cut

# class data and constants
our $degrees_per_radian = 180/pi;
our $eps = 1.0e-23;
our $max_loop_count = 20;
our $twopi = 2 * pi;
our $halfpi = pi/2;
our %defaults = ( ellipsoid => 'WGS84', units => 'radians' );

# set of ellipsoids that can be used.
# values are 
#  1) a = semi-major (equatorial) radius of Ellipsoid 
#  2) 1/f = reciprocal of flattening (f), the ratio of the semi-minor 
#     (polar) radius to the semi-major (equatorial) axis, or
#     polar radius = equatorial radius * ( 1 - f )

our %ellipsoids = (
    'WGS84'              => [ 6378137.0,   298.257223563   ],
    'AIRY'               => [ 6377563.396, 299.3249646     ],
    'AIRY-MODIFIED'      => [ 6377340.189, 299.3249646     ],
    'AUSTRALIAN'         => [ 6378160.0,   298.25          ],
    'BESSEL-1841'        => [ 6377397.155, 299.1528128     ],
    'CLARKE-1880'        => [ 6378249.145, 293.465         ],
    'EVEREST-1830'       => [ 6377276.345, 300.8017        ],
    'EVEREST-MODIFIED'   => [ 6377304.063, 300.8017        ],
    'FISHER-1960'        => [ 6378166.0,   298.3           ],
    'FISHER-1968'        => [ 6378150.0,   298.3           ],
    'GRS80'              => [ 6378137.0,   298.25722210088 ],
    'HOUGH-1956'         => [ 6378270.0,   297.0           ],
    'HAYFORD'            => [ 6378388.0,   297.0           ],
    'IAU76'              => [ 6378140.0,   298.257         ],
    'KRASSOVSKY-1938'    => [ 6378245.0,   298.3           ],
    'NAD27'              => [ 6378206.4,   294.9786982138  ],
    'NWL-9D'             => [ 6378145.0,   298.25          ],
    'SOUTHAMERICAN-1969' => [ 6378160.0,   298.25          ],
    'SOVIET-1985'        => [ 6378136.0,   298.257         ],
    'WGS72'              => [ 6378135.0,   298.26          ],
);

=head1 CONSTRUCTOR

=head2 new

The new() constructor may be called with a hash list to set the value of the
ellipsoid to be used and the value of the units to be used for angles. 
The initial default constructor is equivalent to the following:

    my $geo = Geo::Ellipsoid->new( 
      ellipsoid => 'WGS84', 
      units => 'radians' 
    );
    
The constructor arguments may be of any case and, with the exception of
the ellipsoid value, abbreviated to their first three characters. 
Thus, ( UNI => 'DEG', ell => 'NAD27' ) is valid. 

=cut

sub new
{
  my( $class, %args ) = @_;
  my $self = {%defaults};
  foreach my $key ( keys %args ) {
    if( $key =~ /^ell/i ) {
      $self->{ellipsoid} = uc $args{$key};
    }elsif( $key =~ /^uni/i ) {
      $self->{units} = $args{$key};
    }
  }
  set_units($self,$self->{units});
  set_ellipsoid($self,$self->{ellipsoid});
  print "Ellipsoid(units=>$self->{units},ellipsoid=>$self->{ellipsoid})\n" 
    if $DEBUG;
  bless $self,$class;
  return $self;
}

=head1 METHODS

=head2 set_units

Set the units used by the Geo::Ellipsoid object. The units may also be
set in the constructor of the object. The allowable values are 'degrees'
or 'radians'. The default is 'radians'. The units value is not case
sensitive and may be abbreviated to 3 letters. An invalid value will
be accepted as 'radians'.

    $geo->set_units('degrees');

=cut

sub set_units
{
  my $self = shift;
  my $units = shift;
  if( $units =~ /deg/i ) {
    $units = 'degrees';
  }elsif( $units =~ /rad/i ) {
    $units = 'radians';
  }else{
    croak("Invalid units specifier '$units' - please use either " .
      "degrees or radians (the default)") unless $units =~ /rad/i;
  }
  $self->{units} = $units;
}

=head2 set_ellipsoid

Set the ellipsoid to be used by the Geo::Ellipsoid object. See 
L<"DEFINED ELLIPSOIDS"> below for the allowable values. The value
may also be set by the constructor. The default value is 'WGS84'.

    $geo->set_ellipsoid('NAD27');

=cut

sub set_ellipsoid
{
  my $self = shift;
  my $ellipsoid = uc shift || $defaults{ellipsoid};
  print "  set ellipsoid to $ellipsoid\n" if $DEBUG;
  unless( exists $ellipsoids{$ellipsoid} ) {
    croak("Ellipsoid $ellipsoid does not exist - please use " .
      "set_custom_ellipsoid to use an ellipsoid not in valid set");
  }
  $self->{ellipsoid} = $ellipsoid;
  my( $major, $recip ) = @{$ellipsoids{$ellipsoid}};
  $self->{equatorial} = $major;
  if( $recip == 0 ) {
    carp("Infinite flattening specified by ellipsoid -- assuming a sphere");
    $self->{polar} = $self->{equatorial};
    $self->{flattening} = 0;
    $self->{eccentricity} = 0;
  }else{
    $self->{flattening} = ( 1.0 / $ellipsoids{$ellipsoid}[1]);
    $self->{polar} = $self->{equatorial} * ( 1.0  - $self->{flattening} );
    $self->{eccentricity} = sqrt( 2.0 * $self->{flattening} - 
      ( $self->{flattening} * $self->{flattening} ) );
  }
}

=head2 set_custom_ellipsoid

Sets the ellipsoid parameters to the specified ( major semiaxis and
reciprocal flattening.

    $geo->set_custom_ellipsoid( 'sphere', 6378137, 0 );
    
=cut

sub set_custom_ellipsoid
{
  my $self = shift;
  my( $name, $major, $recip ) = @_;
  $name = uc $name;
  $recip = 0 unless defined $recip;
  if( $major ) {
    $ellipsoids{$name} = [ $major, $recip ];
  }else{  
    croak("set_custom_ellipsoid called without semi-major radius parameter");
  }
  set_ellipsoid($self,$name);
}

=head2 set_defaults

Sets the defaults for the new method. Call with a hash similar to new.

    $Geo::Ellipsoid->set_defaults( 
      units => 'degrees', 
      ellipsoid => 'GRS80 
    );

=cut

sub set_defaults
{
  my $self = shift;
  my %args = @_;
  foreach my $key ( keys %args ) {
    if( $key =~ /^ell/i ) {
      $defaults{ellipsoid} = uc $args{$key};
    }elsif( $key =~ /^uni/i ) {
      $defaults{units} = $args{$key};
    }
  }
  print "Defaults set to ($defaults{ellipsoid},$defaults{units}\n"
    if $DEBUG;
}

=head2 scales

Returns a list consisting of the meters per angle of latitude 
and longitude (degrees or radians) at the specified latitude. 
These values may be used for fast approximations of distance
calculations in the vicinity of some location.

    ( $lat_scale, $lon_scale ) = $geo->scales($lat0);
    $x = $lon_scale * ($lon - $lon0); 
    $y = $lat_scale * ($lat - $lat0); 

=cut

sub scales
{
  my $self = shift;
  my $units = $self->{units};
  my $lat = $_[0];
  $lat /= $degrees_per_radian if( $units eq 'degrees' );

  my $aa = $self->{equatorial};
  my $bb = $self->{polar};
  my $a2 = $aa*$aa;
  my $b2 = $bb*$bb;
  my $d1 = $aa * cos($lat);
  my $d2 = $bb * sin($lat);
  my $d3 = $d1*$d1 + $d2*$d2;
  my $d4 = sqrt($d3);
  my $n1 = $aa * $bb;
  my $latscl = ( $n1 * $n1 ) / ( $d3 * $d4 );
  my $lonscl = ( $aa * $d1 ) / ( $d4 );
  
  if( $DEBUG ) {
    print "lat=$lat, aa=$aa, bb=$bb\nd1=$d1, d2=$d2, d3=$d3, d4=$d4\n";
    print "latscl=$latscl, lonscl=$lonscl\n";
  }

  if( $self->{units} eq 'degrees' ) {
    $latscl /= $degrees_per_radian;
    $lonscl /= $degrees_per_radian;
  }
  return ( $latscl, $lonscl );
}

=head2 range

Returns the range in meters between two specified locations given
as latitude, longitude pairs.

    my $dist = $geo->range( $lat1, $lon1, $lat2, $lon2 );
    my $dist = $geo->range( @origin, @destination );

=cut
    
#	range
#
#	Calculate range (distance) between two coordinates
#
sub range
{
  my $self = shift;
  my $units = $self->{units};  
  my @args = (@_);
  @args = map {
    $_ = deg2rad($_) if $units eq 'degrees';
    $_ += $twopi if $_ < 0; 
    $_ 
  } @args;

  my($range,$bearing) = _inverse($self,@args);
  print "inverse(@_[1..4]) returns($range,$bearing)\n" if $DEBUG;
  return $range;
}

=head2 bearing

Returns the bearing in degrees or radians from the first location to
the second. Zero bearing is true north.

    my $bearing = $geo->bearing( $lat1, $lon1, $lat2, $lon2 );

=cut

#	bearing
#
#	Calculate bearing from one coordinate to another
#
sub bearing
{
  my $self = shift;
  my $units = $self->{units};  
  my @args = (@_);
  @args = map {
    $_ = deg2rad($_) if $units eq 'degrees';
    $_ += $twopi if $_ < 0; 
    $_ 
  } @args;
  my($range,$bearing) = _inverse($self,@args);
  print "inverse(@args) returns($range,$bearing)\n" if $DEBUG;
  return ( $units eq 'radians' ? $bearing : ( $bearing * $degrees_per_radian));
}


=head2 at

Returns the list (latitude,longitude) in degrees or radians that is a
specified range and bearing from a given location.

    my( $lat2, $lon2 ) = $geo->at( $lat1, $lon1, $range, $bearing );

=cut

#	at
#
#	Calculate the location of a point at a given range and
#	bearing from another location.
#
sub at
{
  my $self = shift;
  my $units = $self->{units};
  my( $lat, $lon, $r, $az ) = @_;
  if( $units eq 'degrees' ) {
    $lat /= $degrees_per_radian;
    $lon /= $degrees_per_radian;
    $az /= $degrees_per_radian;
  }
  my( $lat2, $lon2 ) = _forward($self,$lat,$lon,$r,$az);
  if( $units eq 'degrees' ) {
    $lat2 *= $degrees_per_radian;
    $lon2 *= $degrees_per_radian;
  }
  return ( $lat2, $lon2 );  
}


=head2 to

In list context, returns (range, bearing) between two specified locations.
In scalar context, returns just the range.

    my( $dist, $theta ) = $geo->to( $lat1, $lon1, $lat2, $lon2 );
    my $dist = $geo->to( $lat1, $lon1, $lat2, $lon2 );

=cut

#	to
#
#	Calculate range and bearing from one location to another
#	Return the list ( range, bearing ) if called in list context.
#	Return the scalar range if called in scalar context.
#
sub to
{
  my $self = shift;
  my $units = $self->{units};  
  my @args = (@_);
  print "to($units,@args)\n" if $DEBUG;
  @args = map {
    $_ = deg2rad($_) if $units eq 'degrees';
    $_ += $twopi if $_ < 0; 
    $_ 
  } @args;
  my($range,$bearing) = _inverse($self,@args);
  print "to: inverse(@args) returns($range,$bearing)\n" if $DEBUG;
  $bearing *= $degrees_per_radian if $units eq 'degrees';
  if( wantarray() ) {
    return ( $range, $bearing );
  }else{
    return $range;
  }
}

=head2 displacement

Returns the (x,y) displacement in meters between the two specified locations.

    my( $x, $y ) = $geo->displacement( $lat1, $lon1, $lat2, $lon2 );
    
NOTE: The x and y displacements are only approximations and only valid
between two locations that are fairly near to each other. Beyond 10 kilometers
or more, the concept of X and Y on a curved surface loses its meaning.

=cut

#	displacement
#
#	Calculate the X,Y displacement between two locations
#
sub displacement
{
  my $self = shift;
  my $units = $self->{units};  
  my @args = (@_);
  @args = map {
    $_ = deg2rad($_) if $units eq 'degrees';
    $_ += $twopi if $_ < 0; 
    $_ 
  } @args;
  print "call _inverse(@args)\n" if $DEBUG;
  my( $range, $bearing ) = _inverse($self,@args);
  print "disp: _inverse(@args) returns ($range,$bearing)\n" if $DEBUG;
  my $x = $range * sin($bearing);
  my $y = $range * cos($bearing);
  return ($x,$y);
}

=head2 location

Returns the list (latitude,longitude) of a location at a given (x,y)
displacement from a given location.

	my @loc = $geo->location( $lat, $lon, $x, $y );

=cut

#	location
#
#	Calculate the location of a point at a given displacement
#	from another point
#
sub location
{
  my $self = shift;
  my $units = $self->{units};
  my($lat,$lon,$x,$y) = @_;
  #my( $lat, $lon ) = map {
  #  $_ = deg2rad($_) if $units eq 'degrees';
  #  $_ += $twopi if $_ < 0; 
  #  $_
  #} @args[0,1];
  #my( $x, $y ) = @args[2,3];
  my $range = sqrt( $x*$x+ $y*$y );
  my $bearing = atan2($x,$y);
  $bearing *= $degrees_per_radian if $units eq 'degrees';
  print "location($lat,$lon,$x,$y,$range,$bearing)\n" if $DEBUG;
  return $self->at($lat,$lon,$range,$bearing);
}

########################################################################
#
#      internal functions
#
#	inverse
#
#	Calculate the displacement from origin to destination.
#	The input to this subroutine is 
#	  ( latitude-1, longitude-1, latitude-2, longitude-2 ) in radians.
#
#	Return the results as the list (range,bearing) with range in meters
#	and bearing in radians.

sub _inverse()
{
  my $self = shift;
  my( $lat1, $lon1, $lat2, $lon2 ) = (@_);
  print "_inverse($lat1,$lon1,$lat2,$lon2)\n" if $DEBUG;
  
  my $a = $self->{equatorial};
  my $f = $self->{flattening};
  
  my $r = 1.0 - $f;
  my $tu1 = $r * sin($lat1) / cos($lat1);
  my $tu2 = $r * sin($lat2) / cos($lat2);
  my $cu1 = 1.0 / ( sqrt(($tu1*$tu1) + 1.0) );
  my $su1 = $cu1 * $tu1;
  my $cu2 = 1.0 / ( sqrt( ($tu2*$tu2) + 1.0 ));
  my $s = $cu1 * $cu2;
  my $baz = $s * $tu2;
  my $faz = $baz * $tu1;
  my $dlon = $lon2 - $lon1;
  
  if( $DEBUG ) {
    printf "lat1=%.8f, lon1=%.8f\n", $lat1, $lon1; 
    printf "lat2=%.8f, lon2=%.8f\n", $lat2, $lon2;
    printf "r=%.8f, tu1=%.8f, tu2=%.8f\n", $r, $tu1, $tu2;
    printf "faz=%.8f, dlon=%.8f\n", $faz, $dlon;
  }
  
  my $x = $dlon;
  my $cnt = 0;
  print "enter loop:\n" if $DEBUG;
  my( $c2a, $c, $cx, $cy, $cz, $d, $del, $e, $sx, $sy, $y );
  do {
    printf "  x=%.8f\n", $x if $DEBUG;
    $sx = sin($x);
    $cx = cos($x);
    $tu1 = $cu2*$sx;
    $tu2 = $baz - ($su1*$cu2*$cx);
  
    printf "    sx=%.8f, cx=%.8f, tu1=%.8f, tu2=%.8f\n", 
      $sx, $cx, $tu1, $tu2 if $DEBUG;
  
    $sy = sqrt( $tu1*$tu1 + $tu2*$tu2 );
    $cy = $s*$cx + $faz;
    $y = atan2($sy,$cy);
    my $sa;
    if( $sy == 0.0 ) {
      $sa = 1.0;
    }else{
      $sa = ($s*$sx) / $sy;
    }
  
    printf "    sy=%.8f, cy=%.8f, y=%.8f, sa=%.8f\n", $sy, $cy, $y, $sa
      if $DEBUG;
  
    $c2a = 1.0 - ($sa*$sa);
    $cz = $faz + $faz;
    if( $c2a > 0.0 ) {
      $cz = ((-$cz)/$c2a) + $cy;
    }
    $e = ( 2.0 * $cz * $cz ) - 1.0;
    $c = ( ((( (-3.0 * $c2a) + 4.0)*$f) + 4.0) * $c2a * $f )/16.0;
    $d = $x;
    $x = ( ($e * $cy * $c + $cz) * $sy * $c + $y) * $sa;
    $x = ( 1.0 - $c ) * $x * $f + $dlon;
    $del = $d - $x;
  
    if( $DEBUG ) {
      printf "    c2a=%.8f, cz=%.8f\n", $c2a, $cz;
      printf "    e=%.8f, d=%.8f\n", $e, $d;
      printf "    (d-x)=%.8g\n", $del;
    }
  
  }while( (abs($del) > $eps) && ( ++$cnt <= $max_loop_count ) );
  
  $faz = atan2($tu1,$tu2);
  $baz = atan2($cu1*$sx,($baz*$cx - $su1*$cu2)) + pi;
  $x = sqrt( ((1.0/($r*$r)) -1.0 ) * $c2a+1.0 ) + 1.0;
  $x = ($x-2.0)/$x;
  $c = 1.0 - $x;
  $c = (($x*$x)/4.0 + 1.0)/$c;
  $d = ((0.375*$x*$x) - 1.0)*$x;
  $x = $e*$cy;
  
  if( $DEBUG ) {
    printf "e=%.8f, cy=%.8f, x=%.8f\n", $e, $cy, $x;
    printf "sy=%.8f, c=%.8f, d=%.8f\n", $sy, $c, $d;
    printf "cz=%.8f, a=%.8f, r=%.8f\n", $cz, $a, $r;
  }
  
  $s = 1.0 - $e - $e;
  $s = (((((((( $sy * $sy * 4.0 ) - 3.0) * $s * $cz * $d/6.0) - $x) * 
    $d /4.0) + $cz) * $sy * $d) + $y ) * $c * $a * $r;
  
  printf "s=%.8f\n", $s if $DEBUG;
  
  # adjust azimuth to (0,360)
  $faz += $twopi if $faz < 0;

  # return result
  my @disp = ( $s, $faz );
  print "disp = (@disp)\n" if $DEBUG;
  return @disp;
}

sub _forward
{
  my $self = shift;
  my( $lat1, $lon1, $range, $bearing ) = @_;

  if( $DEBUG ) {
    printf "_forward(lat1=%.8f,lon1=%.8f,range=%.8f,bearing=%.8f)\n",
      $lat1, $lon1, $range, $bearing;
  }

  my $eps = 0.5e-13;

  my $a = $self->{equatorial};
  my $f = $self->{flattening};
  my $r = 1.0 - $f;

  my $tu = $r * sin($lat1) / cos($lat1);
  my $faz = $bearing;
  my $s = $range;
  my $sf = sin($faz);
  my $cf = cos($faz);

  my $baz = 0.0;
  $baz = 2.0 * atan2($tu,$cf) if( $cf != 0.0 );
  
  my $cu = 1.0 / sqrt(1.0 + $tu*$tu);
  my $su = $tu * $cu;
  my $sa = $cu * $sf;
  my $c2a = 1.0 - ($sa*$sa);
  my $x = 1.0 + sqrt( (((1.0/($r*$r)) - 1.0 )*$c2a) +1.0);
  $x = ($x-2.0)/$x;
  my $c = 1.0 - $x;
  $c = ((($x*$x)/4.0) + 1.0)/$c;
  my $d = $x * ((0.375*$x*$x)-1.0);
  $tu = (($s/$r)/$a)/$c;
  my $y = $tu;

  if( $DEBUG ) {
    printf "r=%.8f, tu=%.8f, faz=%.8f\n", $r, $tu, $faz;
    printf "baz=%.8f, sf=%.8f, cf=%.8f\n", $baz, $sf, $cf;
    printf "cu=%.8f, su=%.8f, sa=%.8f\n", $cu, $su, $sa; 
    printf "x=%.8f, c=%.8f, y=%.8f\n", $x, $c, $y;
  }

  my( $cy, $cz, $e, $sy );
  do {
    $sy = sin($y);
    $cy = cos($y);
    $cz = cos($baz+$y);
    $e = (2.0*$cz*$cz)-1.0;
    $c = $y;
    $x = $e * $cy;
    $y = (2.0 * $e) - 1.0;
    $y = ((((((((($sy*$sy*4.0)-3.0)*$y*$cz*$d)/6.0)+$x)*$d)/4.0)-$cz)*$sy*$d) +
      $tu;
    } while( abs($y-$c) > $eps );

  $baz = ($cu*$cy*$cf) - ($su*$sy);
  $c = $r*sqrt(($sa*$sa) + ($baz*$baz));
  $d = $su*$cy + $cu*$sy*$cf;
  my $lat2 = atan2($d,$c);
  $c = $cu*$cy - $su*$sy*$cf;
  $x = atan2($sy*$sf,$c);
  $c = (((((-3.0*$c2a)+4.0)*$f)+4.0)*$c2a*$f)/16.0;
  $d = (((($e*$cy*$c) + $cz)*$sy*$c)+$y)*$sa;
  my $lon2 = $lon1 + $x - (1.0-$c)*$d*$f;
  #$baz = atan2($sa,$baz) + pi;

  # return result
  return ($lat2,$lon2);

}

=head1 DEFINED ELLIPSOIDS

The following ellipsoids are defined in Geo::Ellipsoid, with the 
semi-major axis in meters and the reciprocal flattening as shown.
The default ellipsoid is WGS84.

    Ellipsoid        Semi-Major Axis (m.)     1/Flattening
    ---------        -------------------     ---------------
    WGS84                6378137.0           298.257223563
    NAD27                6378206.4           294.9786982138
    AIRY                 6377563.396         299.3249646
    AIRY-MODIFIED        6377340.189         299.3249646
    AUSTRALIAN           6378160.0           298.25
    BESSEL-1841          6377397.155         299.1528128
    CLARKE-1880          6378249.145         293.465
    EVEREST-1830         6377276.345         290.8017
    EVEREST-MODIFIED     6377304.063         290.8017
    FISHER-1960          6378166.0           298.3
    FISHER-1968          6378150.0           298.3
    HOUGH-1956           6378270.0           297.0
    HAYFORD              6378388.0           297.0
    IAU76                6378140.0           298.257
    KRASSOVSKY-1938      6378245.0           298.3
    NWL-9D               6378145.0           298.25
    SOUTHAMERICAN-1969   6378160.0           298.25
    SOVIET-1985          6378136.0           298.257
    WGS72                6378135.0           298.26
    GRS80                6378137.0           298.25722210088


=head1 LIMITATIONS

The methods should not be used on points which are too near the poles
(above or below 89 degrees), and should not be used on points which
are antipodal, i.e., exactly on opposite sides of the geoid. The
methods will not return valid results in these cases.

=head1 ACKNOWLEDGEMENTS

The conversion algorithms used here are Perl translations of Fortran
routines written by LCDR S<L. Pfeifer> NGS Rockville MD that implement
S<T. Vincenty's> Modified Rainsford's method with Helmert's elliptical
terms as published in "Direct and Inverse Solutions of Ellipsoid on
the Ellipsoid with Application of Nested Equations", S<T. Vincenty,>
Survey Review, April 1975.

The Fortran source code files inverse.for and forward.for
may be obtained from

    ftp://ftp.ngs.noaa.gov/pub/pcsoft/for_inv.3d/source/

=head1 AUTHOR

Jim Gibson, C<< <Jim@Gibson.org> >>

=head1 BUGS

This version cannot handle points that are too near to the poles, for
some of the methods, or points which are anti-podal, that is on 
opposite sides of the earth. In this case, the iterative algorithms
will not converge, a warning message will be emitted, and undefined
values will be returned.

Please report any bugs or feature requests to
C<bug-geo-ellipsoid@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Geo-Ellipsoid>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 COPYRIGHT & LICENSE

Copyright 2005 Jim Gibson, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Geo::Ellipsoid
