#!/usr/local/bin/perl
# Test Geo::Ellipsoid load
use Test::More tests => 13;
use Test::Number::Delta relative => 1e-6;
use Geo::Ellipsoid;
use blib;
use strict;
use warnings;

BEGIN { use_ok( 'Geo::Ellipsoid' ); }
my $e = Geo::Ellipsoid->new();
isa_ok( $e, 'Geo::Ellipsoid');

can_ok( 'Geo::Ellipsoid', 'new' );
can_ok( 'Geo::Ellipsoid', 'set_units' );
can_ok( 'Geo::Ellipsoid', 'set_ellipsoid' );
can_ok( 'Geo::Ellipsoid', 'set_custom_ellipsoid' );
can_ok( 'Geo::Ellipsoid', 'scales' );
can_ok( 'Geo::Ellipsoid', 'range' );
can_ok( 'Geo::Ellipsoid', 'bearing' );
can_ok( 'Geo::Ellipsoid', 'at' );
can_ok( 'Geo::Ellipsoid', 'to' );
can_ok( 'Geo::Ellipsoid', 'displacement' );
can_ok( 'Geo::Ellipsoid', 'location' );
