#!/usr/local/bin/perl
# Test Geo::Ellipsoid defaults
use Test::More tests => 192;
use Test::Number::Delta relative => 1e-6;
use Geo::Ellipsoid;
use blib;
use strict;
use warnings;

my $e1 = Geo::Ellipsoid->new();
is( $e1->{ellipsoid}, 'WGS84' );
is( $e1->{units}, 'radians' );
is( $e1->{distance_units}, 'meter' );
cmp_ok( $e1->{longitude_symmetric}, '==', 0 );
cmp_ok( $e1->{latitude_symmetric}, '==', 1 );
cmp_ok( $e1->{bearing_symmetric}, '==', 0 );
$e1->set_defaults(
  ellipsoid => 'NAD27',
  units => 'degrees',
  distance_unit => 'kilometer',
  longitude_symmetric => 1,
  bearing_symmetric => 1
);
my $e2 = Geo::Ellipsoid->new();
is( $e2->{ellipsoid}, 'NAD27' );
is( $e2->{units}, 'degrees' );
is( $e2->{distance_units}, 'kilometer' );
cmp_ok( $e2->{longitude_symmetric}, '==', 1 );
cmp_ok( $e2->{latitude_symmetric}, '==', 1 );
cmp_ok( $e2->{bearing_symmetric}, '==', 1 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'EVEREST-1830');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'EVEREST-1830' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e3 = Geo::Ellipsoid->new();
isnt($e3, undef);
isa_ok($e3, 'Geo::Ellipsoid');
is( $e3->{ellipsoid}, 'EVEREST-1830' );
is( $e3->{units}, 'degrees' );
delta_ok( $e3->{equatorial}, 6377276.345 );
delta_ok( $e3->{polar}, 6356075.41314024 );
delta_ok( $e3->{flattening}, 0.00332444929666288 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'HOUGH-1956');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'HOUGH-1956' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e4 = Geo::Ellipsoid->new();
isnt($e4, undef);
isa_ok($e4, 'Geo::Ellipsoid');
is( $e4->{ellipsoid}, 'HOUGH-1956' );
is( $e4->{units}, 'degrees' );
delta_ok( $e4->{equatorial}, 6378270 );
delta_ok( $e4->{polar}, 6356794.34343434 );
delta_ok( $e4->{flattening}, 0.00336700336700337 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'HAYFORD');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'HAYFORD' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e5 = Geo::Ellipsoid->new();
isnt($e5, undef);
isa_ok($e5, 'Geo::Ellipsoid');
is( $e5->{ellipsoid}, 'HAYFORD' );
is( $e5->{units}, 'degrees' );
delta_ok( $e5->{equatorial}, 6378388 );
delta_ok( $e5->{polar}, 6356911.94612795 );
delta_ok( $e5->{flattening}, 0.00336700336700337 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'AIRY-MODIFIED');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'AIRY-MODIFIED' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e6 = Geo::Ellipsoid->new();
isnt($e6, undef);
isa_ok($e6, 'Geo::Ellipsoid');
is( $e6->{ellipsoid}, 'AIRY-MODIFIED' );
is( $e6->{units}, 'degrees' );
delta_ok( $e6->{equatorial}, 6377340.189 );
delta_ok( $e6->{polar}, 6356034.44793853 );
delta_ok( $e6->{flattening}, 0.00334085064149708 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'NWL-9D');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'NWL-9D' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e7 = Geo::Ellipsoid->new();
isnt($e7, undef);
isa_ok($e7, 'Geo::Ellipsoid');
is( $e7->{ellipsoid}, 'NWL-9D' );
is( $e7->{units}, 'degrees' );
delta_ok( $e7->{equatorial}, 6378145 );
delta_ok( $e7->{polar}, 6356759.76948868 );
delta_ok( $e7->{flattening}, 0.00335289186923722 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'CLARKE-1880');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'CLARKE-1880' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e8 = Geo::Ellipsoid->new();
isnt($e8, undef);
isa_ok($e8, 'Geo::Ellipsoid');
is( $e8->{ellipsoid}, 'CLARKE-1880' );
is( $e8->{units}, 'degrees' );
delta_ok( $e8->{equatorial}, 6378249.145 );
delta_ok( $e8->{polar}, 6356514.86954978 );
delta_ok( $e8->{flattening}, 0.00340756137869933 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'KRASSOVSKY-1938');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'KRASSOVSKY-1938' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e9 = Geo::Ellipsoid->new();
isnt($e9, undef);
isa_ok($e9, 'Geo::Ellipsoid');
is( $e9->{ellipsoid}, 'KRASSOVSKY-1938' );
is( $e9->{units}, 'degrees' );
delta_ok( $e9->{equatorial}, 6378245 );
delta_ok( $e9->{polar}, 6356863.01877305 );
delta_ok( $e9->{flattening}, 0.00335232986925913 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'FISHER-1968');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'FISHER-1968' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e10 = Geo::Ellipsoid->new();
isnt($e10, undef);
isa_ok($e10, 'Geo::Ellipsoid');
is( $e10->{ellipsoid}, 'FISHER-1968' );
is( $e10->{units}, 'degrees' );
delta_ok( $e10->{equatorial}, 6378150 );
delta_ok( $e10->{polar}, 6356768.33724438 );
delta_ok( $e10->{flattening}, 0.00335232986925913 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'AUSTRALIAN');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'AUSTRALIAN' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e11 = Geo::Ellipsoid->new();
isnt($e11, undef);
isa_ok($e11, 'Geo::Ellipsoid');
is( $e11->{ellipsoid}, 'AUSTRALIAN' );
is( $e11->{units}, 'degrees' );
delta_ok( $e11->{equatorial}, 6378160 );
delta_ok( $e11->{polar}, 6356774.71919531 );
delta_ok( $e11->{flattening}, 0.00335289186923722 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'EVEREST-MODIFIED');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'EVEREST-MODIFIED' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e12 = Geo::Ellipsoid->new();
isnt($e12, undef);
isa_ok($e12, 'Geo::Ellipsoid');
is( $e12->{ellipsoid}, 'EVEREST-MODIFIED' );
is( $e12->{units}, 'degrees' );
delta_ok( $e12->{equatorial}, 6377304.063 );
delta_ok( $e12->{polar}, 6356103.03899315 );
delta_ok( $e12->{flattening}, 0.00332444929666288 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'WGS72');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'WGS72' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e13 = Geo::Ellipsoid->new();
isnt($e13, undef);
isa_ok($e13, 'Geo::Ellipsoid');
is( $e13->{ellipsoid}, 'WGS72' );
is( $e13->{units}, 'degrees' );
delta_ok( $e13->{equatorial}, 6378135 );
delta_ok( $e13->{polar}, 6356750.52001609 );
delta_ok( $e13->{flattening}, 0.0033527794541675 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'FISHER-1960');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'FISHER-1960' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e14 = Geo::Ellipsoid->new();
isnt($e14, undef);
isa_ok($e14, 'Geo::Ellipsoid');
is( $e14->{ellipsoid}, 'FISHER-1960' );
is( $e14->{units}, 'degrees' );
delta_ok( $e14->{equatorial}, 6378166 );
delta_ok( $e14->{polar}, 6356784.28360711 );
delta_ok( $e14->{flattening}, 0.00335232986925913 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'BESSEL-1841');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'BESSEL-1841' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e15 = Geo::Ellipsoid->new();
isnt($e15, undef);
isa_ok($e15, 'Geo::Ellipsoid');
is( $e15->{ellipsoid}, 'BESSEL-1841' );
is( $e15->{units}, 'degrees' );
delta_ok( $e15->{equatorial}, 6377397.155 );
delta_ok( $e15->{polar}, 6356078.96281819 );
delta_ok( $e15->{flattening}, 0.00334277318217481 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'AIRY');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'AIRY' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e16 = Geo::Ellipsoid->new();
isnt($e16, undef);
isa_ok($e16, 'Geo::Ellipsoid');
is( $e16->{ellipsoid}, 'AIRY' );
is( $e16->{units}, 'degrees' );
delta_ok( $e16->{equatorial}, 6377563.396 );
delta_ok( $e16->{polar}, 6356256.90923729 );
delta_ok( $e16->{flattening}, 0.00334085064149708 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'GRS80');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'GRS80' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e17 = Geo::Ellipsoid->new();
isnt($e17, undef);
isa_ok($e17, 'Geo::Ellipsoid');
is( $e17->{ellipsoid}, 'GRS80' );
is( $e17->{units}, 'degrees' );
delta_ok( $e17->{equatorial}, 6378137 );
delta_ok( $e17->{polar}, 6356752.31414035 );
delta_ok( $e17->{flattening}, 0.00335281068118367 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'IAU76');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'IAU76' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e18 = Geo::Ellipsoid->new();
isnt($e18, undef);
isa_ok($e18, 'Geo::Ellipsoid');
is( $e18->{ellipsoid}, 'IAU76' );
is( $e18->{units}, 'degrees' );
delta_ok( $e18->{equatorial}, 6378140 );
delta_ok( $e18->{polar}, 6356755.28815753 );
delta_ok( $e18->{flattening}, 0.00335281317789691 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'SOUTHAMERICAN-1969');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'SOUTHAMERICAN-1969' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e19 = Geo::Ellipsoid->new();
isnt($e19, undef);
isa_ok($e19, 'Geo::Ellipsoid');
is( $e19->{ellipsoid}, 'SOUTHAMERICAN-1969' );
is( $e19->{units}, 'degrees' );
delta_ok( $e19->{equatorial}, 6378160 );
delta_ok( $e19->{polar}, 6356774.71919531 );
delta_ok( $e19->{flattening}, 0.00335289186923722 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'WGS84');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'WGS84' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e20 = Geo::Ellipsoid->new();
isnt($e20, undef);
isa_ok($e20, 'Geo::Ellipsoid');
is( $e20->{ellipsoid}, 'WGS84' );
is( $e20->{units}, 'degrees' );
delta_ok( $e20->{equatorial}, 6378137 );
delta_ok( $e20->{polar}, 6356752.31424518 );
delta_ok( $e20->{flattening}, 0.00335281066474748 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'SOVIET-1985');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'SOVIET-1985' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e21 = Geo::Ellipsoid->new();
isnt($e21, undef);
isa_ok($e21, 'Geo::Ellipsoid');
is( $e21->{ellipsoid}, 'SOVIET-1985' );
is( $e21->{units}, 'degrees' );
delta_ok( $e21->{equatorial}, 6378136 );
delta_ok( $e21->{polar}, 6356751.30156878 );
delta_ok( $e21->{flattening}, 0.00335281317789691 );

Geo::Ellipsoid->set_defaults(units => 'degrees', ell => 'NAD27');
is( $Geo::Ellipsoid::defaults{ellipsoid}, 'NAD27' );
is( $Geo::Ellipsoid::defaults{units}, 'degrees' );
my $e22 = Geo::Ellipsoid->new();
isnt($e22, undef);
isa_ok($e22, 'Geo::Ellipsoid');
is( $e22->{ellipsoid}, 'NAD27' );
is( $e22->{units}, 'degrees' );
delta_ok( $e22->{equatorial}, 6378206.4 );
delta_ok( $e22->{polar}, 6356583.79999999 );
delta_ok( $e22->{flattening}, 0.00339007530392992 );
