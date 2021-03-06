#!perl
# Test Geo::Ellipsoid to

use strict;
use warnings;

use Test::More tests => 476;
use Test::Number::Delta relative => 1e-6;
use Geo::Ellipsoid;

my $e = Geo::Ellipsoid->new(angle_unit => 'degrees');
my( $r, $a );
( $r, $a ) = $e->to(-88.000000, 1.000000,-88.000000, 1.000000);
delta_within( $r, 0, 0.1, 'range is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 1.000000,-88.000000, 90.000000);
delta_ok( $r, 313115.736403702, 'range is within tolerance' );
delta_within( $a, 134.482545961512, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 1.000000,-88.000000, 179.000000);
delta_ok( $r, 446706.010760529, 'range is within tolerance' );
delta_within( $a, 178.999390582928, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 1.000000,-88.000000, 268.000000);
delta_ok( $r, 324047.278966282, 'range is within tolerance' );
delta_within( $a, 223.517433140781, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 1.000000,0.000000, 1.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 0, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 1.000000,0.000000, 90.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 89.011158607559, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 1.000000,0.000000, 179.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 177.999150742584, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 1.000000,0.000000, 268.000000);
delta_ok( $r, 10013675.0566307, 'range is within tolerance' );
delta_within( $a, 266.991287566797, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 1.000000,88.000000, 1.000000);
delta_ok( $r, 19557157.3743612, 'range is within tolerance' );
delta_within( $a, 0, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 1.000000,88.000000, 90.000000);
delta_ok( $r, 19685321.6740635, 'range is within tolerance' );
delta_within( $a, 44.5248574511049, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 1.000000,88.000000, 179.000000);
delta_ok( $r, 19996176.9000454, 'range is within tolerance' );
delta_within( $a, 89.0111586075591, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 1.000000,88.000000, 268.000000);
delta_ok( $r, 19696447.0104273, 'range is within tolerance' );
delta_within( $a, 313.474906296864, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 90.000000,-88.000000, 1.000000);
delta_ok( $r, 313115.736403702, 'range is within tolerance' );
delta_within( $a, 225.517454038488, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 90.000000,-88.000000, 90.000000);
delta_within( $r, 0, 0.1, 'range is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 90.000000,-88.000000, 179.000000);
delta_ok( $r, 313115.736403702, 'range is within tolerance' );
delta_within( $a, 134.482545961512, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 90.000000,-88.000000, 268.000000);
delta_ok( $r, 446706.010760529, 'range is within tolerance' );
delta_within( $a, 178.999390582928, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 90.000000,0.000000, 1.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 270.988841392441, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 90.000000,0.000000, 90.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 0, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 90.000000,0.000000, 179.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 89.011158607559, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 90.000000,0.000000, 268.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 177.999150742584, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 90.000000,88.000000, 1.000000);
delta_ok( $r, 19685321.6740635, 'range is within tolerance' );
delta_within( $a, 315.475142548895, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 90.000000,88.000000, 90.000000);
delta_ok( $r, 19557157.3743612, 'range is within tolerance' );
delta_within( $a, 0, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 90.000000,88.000000, 179.000000);
delta_ok( $r, 19685321.6740635, 'range is within tolerance' );
delta_within( $a, 44.5248574511049, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 90.000000,88.000000, 268.000000);
delta_ok( $r, 19996176.9000454, 'range is within tolerance' );
delta_within( $a, 89.0111586075591, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 179.000000,-88.000000, 1.000000);
delta_ok( $r, 446706.010760529, 'range is within tolerance' );
delta_within( $a, 181.000609417072, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 179.000000,-88.000000, 90.000000);
delta_ok( $r, 313115.736403702, 'range is within tolerance' );
delta_within( $a, 225.517454038488, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 179.000000,-88.000000, 179.000000);
delta_within( $r, 0, 0.1, 'range is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 179.000000,-88.000000, 268.000000);
delta_ok( $r, 313115.736403702, 'range is within tolerance' );
delta_within( $a, 134.482545961512, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 179.000000,0.000000, 1.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 182.000849257416, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 179.000000,0.000000, 90.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 270.988841392441, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 179.000000,0.000000, 179.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 0, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 179.000000,0.000000, 268.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 89.011158607559, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 179.000000,88.000000, 1.000000);
delta_ok( $r, 19996176.9000454, 'range is within tolerance' );
delta_within( $a, 270.988841392441, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 179.000000,88.000000, 90.000000);
delta_ok( $r, 19685321.6740635, 'range is within tolerance' );
delta_within( $a, 315.475142548895, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 179.000000,88.000000, 179.000000);
delta_ok( $r, 19557157.3743612, 'range is within tolerance' );
delta_within( $a, 0, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 179.000000,88.000000, 268.000000);
delta_ok( $r, 19685321.6740635, 'range is within tolerance' );
delta_within( $a, 44.5248574511049, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 268.000000,-88.000000, 1.000000);
delta_ok( $r, 324047.278966282, 'range is within tolerance' );
delta_within( $a, 136.482566859219, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 268.000000,-88.000000, 90.000000);
delta_ok( $r, 446706.010760529, 'range is within tolerance' );
delta_within( $a, 181.000609417072, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 268.000000,-88.000000, 179.000000);
delta_ok( $r, 313115.736403702, 'range is within tolerance' );
delta_within( $a, 225.517454038488, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 268.000000,-88.000000, 268.000000);
delta_within( $r, 0, 0.1, 'range is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 268.000000,0.000000, 1.000000);
delta_ok( $r, 10013675.0566307, 'range is within tolerance' );
delta_within( $a, 93.0087124332033, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 268.000000,0.000000, 90.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 182.000849257416, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 268.000000,0.000000, 179.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 270.988841392441, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 268.000000,0.000000, 268.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 0, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 268.000000,88.000000, 1.000000);
delta_ok( $r, 19696447.0104273, 'range is within tolerance' );
delta_within( $a, 46.5250937031361, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 268.000000,88.000000, 90.000000);
delta_ok( $r, 19996176.9000454, 'range is within tolerance' );
delta_within( $a, 270.988841392441, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 268.000000,88.000000, 179.000000);
delta_ok( $r, 19685321.6740635, 'range is within tolerance' );
delta_within( $a, 315.475142548895, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-88.000000, 268.000000,88.000000, 268.000000);
delta_ok( $r, 19557157.3743612, 'range is within tolerance' );
delta_within( $a, 0, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 1.000000,-88.000000, 1.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 180, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 1.000000,-88.000000, 90.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 177.99357628514, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 1.000000,-88.000000, 179.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 179.929950967799, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 1.000000,-88.000000, 268.000000);
delta_ok( $r, 10013675.0566307, 'range is within tolerance' );
delta_within( $a, 182.003955421895, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 1.000000,0.000000, 1.000000);
delta_within( $r, 0, 0.1, 'range is within tolerance' );

( $r, $a ) = $e->to(0.000000, 1.000000,0.000000, 90.000000);
delta_ok( $r, 9907434.68060135, 'range is within tolerance' );
delta_within( $a, 90, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 1.000000,0.000000, 179.000000);
delta_ok( $r, 19814869.3612027, 'range is within tolerance' );
delta_within( $a, 90, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 1.000000,0.000000, 268.000000);
delta_ok( $r, 10352712.6437744, 'range is within tolerance' );
delta_within( $a, 270, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 1.000000,88.000000, 1.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 0, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 1.000000,88.000000, 90.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 2.00642371485969, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 1.000000,88.000000, 179.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 0.0700490322014982, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 1.000000,88.000000, 268.000000);
delta_ok( $r, 10013675.0566307, 'range is within tolerance' );
delta_within( $a, 357.996044578105, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 90.000000,-88.000000, 1.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 182.00642371486, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 90.000000,-88.000000, 90.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 180, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 90.000000,-88.000000, 179.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 177.99357628514, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 90.000000,-88.000000, 268.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 179.929950967799, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 90.000000,0.000000, 1.000000);
delta_ok( $r, 9907434.68060135, 'range is within tolerance' );
delta_within( $a, 270, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 90.000000,0.000000, 90.000000);
delta_within( $r, 0, 0.1, 'range is within tolerance' );

( $r, $a ) = $e->to(0.000000, 90.000000,0.000000, 179.000000);
delta_ok( $r, 9907434.68060135, 'range is within tolerance' );
delta_within( $a, 90, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 90.000000,0.000000, 268.000000);
delta_ok( $r, 19814869.3612027, 'range is within tolerance' );
delta_within( $a, 90, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 90.000000,88.000000, 1.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 357.99357628514, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 90.000000,88.000000, 90.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 0, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 90.000000,88.000000, 179.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 2.00642371485969, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 90.000000,88.000000, 268.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 0.0700490322014982, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 179.000000,-88.000000, 1.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 180.070049032201, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 179.000000,-88.000000, 90.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 182.00642371486, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 179.000000,-88.000000, 179.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 180, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 179.000000,-88.000000, 268.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 177.99357628514, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 179.000000,0.000000, 1.000000);
delta_ok( $r, 19814869.3612027, 'range is within tolerance' );
delta_within( $a, 270, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 179.000000,0.000000, 90.000000);
delta_ok( $r, 9907434.68060135, 'range is within tolerance' );
delta_within( $a, 270, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 179.000000,0.000000, 179.000000);
delta_within( $r, 0, 0.1, 'range is within tolerance' );

( $r, $a ) = $e->to(0.000000, 179.000000,0.000000, 268.000000);
delta_ok( $r, 9907434.68060135, 'range is within tolerance' );
delta_within( $a, 90, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 179.000000,88.000000, 1.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 359.929950967799, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 179.000000,88.000000, 90.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 357.99357628514, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 179.000000,88.000000, 179.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 0, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 179.000000,88.000000, 268.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 2.00642371485969, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 268.000000,-88.000000, 1.000000);
delta_ok( $r, 10013675.0566307, 'range is within tolerance' );
delta_within( $a, 177.996044578105, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 268.000000,-88.000000, 90.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 180.070049032201, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 268.000000,-88.000000, 179.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 182.00642371486, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 268.000000,-88.000000, 268.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 180, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 268.000000,0.000000, 1.000000);
delta_ok( $r, 10352712.6437744, 'range is within tolerance' );
delta_within( $a, 90, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 268.000000,0.000000, 90.000000);
delta_ok( $r, 19814869.3612027, 'range is within tolerance' );
delta_within( $a, 270, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 268.000000,0.000000, 179.000000);
delta_ok( $r, 9907434.68060135, 'range is within tolerance' );
delta_within( $a, 270, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 268.000000,0.000000, 268.000000);
delta_within( $r, 0, 0.1, 'range is within tolerance' );

( $r, $a ) = $e->to(0.000000, 268.000000,88.000000, 1.000000);
delta_ok( $r, 10013675.0566307, 'range is within tolerance' );
delta_within( $a, 2.00395542189512, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 268.000000,88.000000, 90.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 359.929950967799, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 268.000000,88.000000, 179.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 357.99357628514, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(0.000000, 268.000000,88.000000, 268.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 0, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 1.000000,-88.000000, 1.000000);
delta_ok( $r, 19557157.3743612, 'range is within tolerance' );
delta_within( $a, 180, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 1.000000,-88.000000, 90.000000);
delta_ok( $r, 19685321.6740635, 'range is within tolerance' );
delta_within( $a, 135.475142548895, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 1.000000,-88.000000, 179.000000);
delta_ok( $r, 19996176.9000454, 'range is within tolerance' );
delta_within( $a, 90.9888413924409, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 1.000000,-88.000000, 268.000000);
delta_ok( $r, 19696447.0104273, 'range is within tolerance' );
delta_within( $a, 226.525093703136, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 1.000000,0.000000, 1.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 180, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 1.000000,0.000000, 90.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 90.988841392441, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 1.000000,0.000000, 179.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 2.00084925741569, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 1.000000,0.000000, 268.000000);
delta_ok( $r, 10013675.0566307, 'range is within tolerance' );
delta_within( $a, 273.008712433203, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 1.000000,88.000000, 1.000000);
delta_within( $r, 0, 0.1, 'range is within tolerance' );

( $r, $a ) = $e->to(88.000000, 1.000000,88.000000, 90.000000);
delta_ok( $r, 313115.736403702, 'range is within tolerance' );
delta_within( $a, 45.5174540384878, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 1.000000,88.000000, 179.000000);
delta_ok( $r, 446706.010760529, 'range is within tolerance' );
delta_within( $a, 1.00060941707181, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 1.000000,88.000000, 268.000000);
delta_ok( $r, 324047.278966282, 'range is within tolerance' );
delta_within( $a, 316.482566859219, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 90.000000,-88.000000, 1.000000);
delta_ok( $r, 19685321.6740635, 'range is within tolerance' );
delta_within( $a, 224.524857451105, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 90.000000,-88.000000, 90.000000);
delta_ok( $r, 19557157.3743612, 'range is within tolerance' );
delta_within( $a, 180, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 90.000000,-88.000000, 179.000000);
delta_ok( $r, 19685321.6740635, 'range is within tolerance' );
delta_within( $a, 135.475142548895, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 90.000000,-88.000000, 268.000000);
delta_ok( $r, 19996176.9000454, 'range is within tolerance' );
delta_within( $a, 90.9888413924409, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 90.000000,0.000000, 1.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 269.011158607559, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 90.000000,0.000000, 90.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 180, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 90.000000,0.000000, 179.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 90.988841392441, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 90.000000,0.000000, 268.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 2.00084925741569, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 90.000000,88.000000, 1.000000);
delta_ok( $r, 313115.736403702, 'range is within tolerance' );
delta_within( $a, 314.482545961512, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 90.000000,88.000000, 90.000000);
delta_within( $r, 0, 0.1, 'range is within tolerance' );

( $r, $a ) = $e->to(88.000000, 90.000000,88.000000, 179.000000);
delta_ok( $r, 313115.736403702, 'range is within tolerance' );
delta_within( $a, 45.5174540384878, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 90.000000,88.000000, 268.000000);
delta_ok( $r, 446706.010760529, 'range is within tolerance' );
delta_within( $a, 1.00060941707181, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 179.000000,-88.000000, 1.000000);
delta_ok( $r, 19996176.9000454, 'range is within tolerance' );
delta_within( $a, 269.011158607559, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 179.000000,-88.000000, 90.000000);
delta_ok( $r, 19685321.6740635, 'range is within tolerance' );
delta_within( $a, 224.524857451105, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 179.000000,-88.000000, 179.000000);
delta_ok( $r, 19557157.3743612, 'range is within tolerance' );
delta_within( $a, 180, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 179.000000,-88.000000, 268.000000);
delta_ok( $r, 19685321.6740635, 'range is within tolerance' );
delta_within( $a, 135.475142548895, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 179.000000,0.000000, 1.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 357.999150742584, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 179.000000,0.000000, 90.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 269.011158607559, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 179.000000,0.000000, 179.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 180, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 179.000000,0.000000, 268.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 90.988841392441, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 179.000000,88.000000, 1.000000);
delta_ok( $r, 446706.010760529, 'range is within tolerance' );
delta_within( $a, 358.999390582928, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 179.000000,88.000000, 90.000000);
delta_ok( $r, 313115.736403702, 'range is within tolerance' );
delta_within( $a, 314.482545961512, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 179.000000,88.000000, 179.000000);
delta_within( $r, 0, 0.1, 'range is within tolerance' );

( $r, $a ) = $e->to(88.000000, 179.000000,88.000000, 268.000000);
delta_ok( $r, 313115.736403702, 'range is within tolerance' );
delta_within( $a, 45.5174540384878, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 268.000000,-88.000000, 1.000000);
delta_ok( $r, 19696447.0104273, 'range is within tolerance' );
delta_within( $a, 133.474906296864, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 268.000000,-88.000000, 90.000000);
delta_ok( $r, 19996176.9000454, 'range is within tolerance' );
delta_within( $a, 269.011158607559, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 268.000000,-88.000000, 179.000000);
delta_ok( $r, 19685321.6740635, 'range is within tolerance' );
delta_within( $a, 224.524857451105, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 268.000000,-88.000000, 268.000000);
delta_ok( $r, 19557157.3743612, 'range is within tolerance' );
delta_within( $a, 180, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 268.000000,0.000000, 1.000000);
delta_ok( $r, 10013675.0566307, 'range is within tolerance' );
delta_within( $a, 86.9912875667967, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 268.000000,0.000000, 90.000000);
delta_ok( $r, 10225216.6599337, 'range is within tolerance' );
delta_within( $a, 357.999150742584, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 268.000000,0.000000, 179.000000);
delta_ok( $r, 9998088.45002268, 'range is within tolerance' );
delta_within( $a, 269.011158607559, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 268.000000,0.000000, 268.000000);
delta_ok( $r, 9778578.68718058, 'range is within tolerance' );
delta_within( $a, 180, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 268.000000,88.000000, 1.000000);
delta_ok( $r, 324047.278966282, 'range is within tolerance' );
delta_within( $a, 43.5174331407808, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 268.000000,88.000000, 90.000000);
delta_ok( $r, 446706.010760529, 'range is within tolerance' );
delta_within( $a, 358.999390582928, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 268.000000,88.000000, 179.000000);
delta_ok( $r, 313115.736403702, 'range is within tolerance' );
delta_within( $a, 314.482545961512, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(88.000000, 268.000000,88.000000, 268.000000);
delta_within( $r, 0, 0.1, 'range is within tolerance' );

( $r, $a ) = $e->to(-57.934266, 269.464909,-71.038589, 313.367482);
delta_ok( $r, 2478983.26981423, 'range is within tolerance' );
delta_within( $a, 143.395603607968, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(13.605417, 282.316135,33.826171, 132.755857);
delta_ok( $r, 13850451.7048934, 'range is within tolerance' );
delta_within( $a, 329.412475743044, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(65.807118, 267.744045,-9.495920, 127.342153);
delta_ok( $r, 13064794.3870629, 'range is within tolerance' );
delta_within( $a, 314.966396589062, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(40.923455, 94.159476,-18.604296, 279.644382);
delta_ok( $r, 17475952.9859877, 'range is within tolerance' );
delta_within( $a, 346.682016294252, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(60.726184, 207.132176,37.934793, 29.881529);
delta_ok( $r, 9065819.55603936, 'range is within tolerance' );
delta_within( $a, 357.809015839191, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-7.774777, 40.360959,7.960132, 140.647165);
delta_ok( $r, 11262132.6431769, 'range is within tolerance' );
delta_within( $a, 83.4278273130908, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(12.071034, 344.345789,64.718561, 58.748224);
delta_ok( $r, 8059002.00518262, 'range is within tolerance' );
delta_within( $a, 25.6350676733314, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-39.510429, 94.209272,74.640675, 156.932149);
delta_ok( $r, 13463843.6928142, 'range is within tolerance' );
delta_within( $a, 16.0430701128036, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(50.945112, 46.686892,-73.531799, 338.631126);
delta_ok( $r, 14726732.6094757, 'range is within tolerance' );
delta_within( $a, 201.007479159506, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-83.498813, 56.207513,-20.735893, 55.705212);
delta_ok( $r, 6982046.80533501, 'range is within tolerance' );
delta_within( $a, 359.4713992725, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(5.162682, 314.911760,-12.212387, 95.006241);
delta_ok( $r, 15580306.134578, 'range is within tolerance' );
delta_within( $a, 102.90535353589, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-32.807368, 276.692824,-69.099205, 277.575212);
delta_ok( $r, 4037491.56639158, 'range is within tolerance' );
delta_within( $a, 179.466380802463, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(36.114418, 79.272998,46.075743, 148.216696);
delta_ok( $r, 5712966.86704551, 'range is within tolerance' );
delta_within( $a, 56.1362395061731, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(26.193521, 333.924339,0.425668, 247.478645);
delta_ok( $r, 9639530.83300946, 'range is within tolerance' );
delta_within( $a, 268.930507164728, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-11.247993, 218.771725,13.474320, 227.743816);
delta_ok( $r, 2908081.09846649, 'range is within tolerance' );
delta_within( $a, 20.1557316624214, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-6.437086, 227.343277,-63.660092, 345.874110);
delta_ok( $r, 10716663.132942, 'range is within tolerance' );
delta_within( $a, 156.867043901473, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-62.590000, 160.912539,-30.873135, 342.930268);
delta_ok( $r, 9642768.30471071, 'range is within tolerance' );
delta_within( $a, 181.732680684942, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-24.959632, 143.558544,-70.174449, 343.830865);
delta_ok( $r, 9331596.49998794, 'range is within tolerance' );
delta_within( $a, 186.797641578604, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(85.292583, 207.197289,64.400817, 53.955321);
delta_ok( $r, 3334743.62344139, 'range is within tolerance' );
delta_within( $a, 337.012768638466, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(72.010476, 234.148398,-76.760490, 343.799779);
delta_ok( $r, 17966012.0923903, 'range is within tolerance' );
delta_within( $a, 136.471695744589, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(82.062247, 282.224532,53.709008, 205.651325);
delta_ok( $r, 3925232.39059218, 'range is within tolerance' );
delta_within( $a, 267.548713448222, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-38.264913, 345.593277,13.987962, 157.269106);
delta_ok( $r, 17193609.7687517, 'range is within tolerance' );
delta_within( $a, 161.114003589302, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-21.923233, 331.579924,-82.948909, 276.789592);
delta_ok( $r, 7136933.98147936, 'range is within tolerance' );
delta_within( $a, 186.41943112575, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(39.266792, 212.567027,-13.043617, 231.171501);
delta_ok( $r, 6104433.98020838, 'range is within tolerance' );
delta_within( $a, 157.632255571465, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(43.430240, 25.708641,-78.620089, 278.752912);
delta_ok( $r, 15067414.5790259, 'range is within tolerance' );
delta_within( $a, 195.703317974022, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(35.816613, 44.413390,-34.595103, 26.822827);
delta_ok( $r, 8006275.94631107, 'range is within tolerance' );
delta_within( $a, 195.212777836564, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(33.063322, 131.654287,40.382161, 70.051002);
delta_ok( $r, 5452116.89026308, 'range is within tolerance' );
delta_within( $a, 297.235375347757, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-60.791775, 58.921675,58.472988, 198.337306);
delta_ok( $r, 17744632.7153385, 'range is within tolerance' );
delta_within( $a, 78.6460833331669, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-32.182827, 189.929621,-11.752936, 76.924247);
delta_ok( $r, 11405061.5799716, 'range is within tolerance' );
delta_within( $a, 247.228653711236, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(40.410413, 1.490210,15.171991, 171.877678);
delta_ok( $r, 13771611.4326195, 'range is within tolerance' );
delta_within( $a, 11.1215097915429, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(77.415003, 273.852765,-65.518823, 5.320166);
delta_ok( $r, 16984526.9730499, 'range is within tolerance' );
delta_within( $a, 114.317943803113, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-0.001169, 303.428210,61.978146, 32.763058);
delta_ok( $r, 9970926.02740749, 'range is within tolerance' );
delta_within( $a, 28.100737553144, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(62.964471, 283.438450,13.811810, 35.816077);
delta_ok( $r, 9733041.79438803, 'range is within tolerance' );
delta_within( $a, 63.9173979767126, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(57.757522, 268.496370,71.873398, 184.371272);
delta_ok( $r, 3887427.27158255, 'range is within tolerance' );
delta_within( $a, 327.17462331126, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(67.683592, 345.377181,11.705901, 170.600523);
delta_ok( $r, 11188758.804159, 'range is within tolerance' );
delta_within( $a, 354.806955928828, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-14.509993, 233.823561,66.915477, 210.936486);
delta_ok( $r, 9223027.54994791, 'range is within tolerance' );
delta_within( $a, 351.122612522391, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-48.837869, 358.766092,-59.984409, 250.415053);
delta_ok( $r, 6331138.72714118, 'range is within tolerance' );
delta_within( $a, 214.601548309314, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(35.469166, 354.061624,26.153177, 235.757036);
delta_ok( $r, 10606793.2549714, 'range is within tolerance' );
delta_within( $a, 307.54615644259, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(60.579911, 245.073600,82.746095, 119.397052);
delta_ok( $r, 3807870.32524918, 'range is within tolerance' );
delta_within( $a, 349.456168279081, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(52.814462, 58.052386,63.937125, 216.992405);
delta_ok( $r, 6929484.96260079, 'range is within tolerance' );
delta_within( $a, 10.2919524401595, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-14.087235, 352.325834,64.925852, 167.053343);
delta_ok( $r, 14344572.4591005, 'range is within tolerance' );
delta_within( $a, 2.87132324469977, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-44.555528, 303.380598,60.410717, 265.142366);
delta_ok( $r, 12142365.0295713, 'range is within tolerance' );
delta_within( $a, 341.013133837574, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-64.733717, 171.696178,50.043309, 179.133361);
delta_ok( $r, 12743611.5768642, 'range is within tolerance' );
delta_within( $a, 5.27317915617838, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(12.112040, 159.973637,-81.799749, 119.465377);
delta_ok( $r, 10640434.6234949, 'range is within tolerance' );
delta_within( $a, 185.36408498589, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-12.913136, 209.560123,-72.500921, 242.959763);
delta_ok( $r, 6973908.49631601, 'range is within tolerance' );
delta_within( $a, 169.226215342821, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(15.388763, 85.383404,43.057681, 345.007357);
delta_ok( $r, 9674590.63953447, 'range is within tolerance' );
delta_within( $a, 313.920881630087, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(64.108958, 27.645978,7.006558, 137.813405);
delta_ok( $r, 10265664.1927237, 'range is within tolerance' );
delta_within( $a, 68.7123060867185, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-87.675134, 257.547959,-78.556203, 7.576067);
delta_ok( $r, 1388279.96503049, 'range is within tolerance' );
delta_within( $a, 120.008321576532, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(45.506762, 226.167856,75.858502, 197.258652);
delta_ok( $r, 3642825.04801401, 'range is within tolerance' );
delta_within( $a, 347.342287196448, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-15.130062, 141.680058,-53.226032, 110.910346);
delta_ok( $r, 5012011.5716539, 'range is within tolerance' );
delta_within( $a, 205.717239120564, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-51.171998, 219.770710,-22.538592, 57.834091);
delta_ok( $r, 11650461.6034958, 'range is within tolerance' );
delta_within( $a, 197.174001590393, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-7.000668, 288.466856,-55.716970, 258.457540);
delta_ok( $r, 6017359.40295354, 'range is within tolerance' );
delta_within( $a, 200.419276815272, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-4.103181, 51.748045,23.523933, 87.322753);
delta_ok( $r, 4923654.59463328, 'range is within tolerance' );
delta_within( $a, 49.9333838628388, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-66.149558, 312.989638,-69.799797, 271.586522);
delta_ok( $r, 1743562.46751605, 'range is within tolerance' );
delta_within( $a, 238.030177426519, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-21.017857, 200.311309,-74.230046, 135.855002);
delta_ok( $r, 7005716.26957978, 'range is within tolerance' );
delta_within( $a, 196.029492653125, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(22.032424, 283.684581,-13.840647, 296.727744);
delta_ok( $r, 4215876.49472136, 'range is within tolerance' );
delta_within( $a, 159.073330859259, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(9.137311, 261.695802,-1.968743, 94.386354);
delta_ok( $r, 18415518.434645, 'range is within tolerance' );
delta_within( $a, 299.740904431686, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-0.367684, 176.265124,-1.495746, 305.845852);
delta_ok( $r, 14421564.897997, 'range is within tolerance' );
delta_within( $a, 92.2533762539934, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(73.726080, 130.581316,8.059198, 217.631502);
delta_ok( $r, 9055964.88324431, 'range is within tolerance' );
delta_within( $a, 90.4838402750219, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(19.299877, 158.813658,36.382896, 77.814439);
delta_ok( $r, 7978668.24478752, 'range is within tolerance' );
delta_within( $a, 303.044909439054, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(46.759530, 110.686586,50.379077, 32.324924);
delta_ok( $r, 5522070.40672904, 'range is within tolerance' );
delta_within( $a, 304.786480351645, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(70.152840, 335.224848,82.259265, 222.676574);
delta_ok( $r, 2664806.26132369, 'range is within tolerance' );
delta_within( $a, 342.089448894924, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-76.222244, 41.464968,22.995327, 26.717480);
delta_ok( $r, 11054300.8320442, 'range is within tolerance' );
delta_within( $a, 346.229809972732, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(10.103669, 84.844998,19.705372, 336.438821);
delta_ok( $r, 11523412.006604, 'range is within tolerance' );
delta_within( $a, 293.284547184864, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(12.619602, 206.584638,-6.260003, 43.507509);
delta_ok( $r, 18046314.1453549, 'range is within tolerance' );
delta_within( $a, 289.873007821456, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-46.431748, 358.501506,10.070717, 310.960507);
delta_ok( $r, 7840004.49282381, 'range is within tolerance' );
delta_within( $a, 309.499327919992, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-37.466916, 262.319964,56.541387, 175.943954);
delta_ok( $r, 13175801.2840537, 'range is within tolerance' );
delta_within( $a, 321.047143676273, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(16.376357, 41.153536,-60.139286, 251.664078);
delta_ok( $r, 14563419.7032955, 'range is within tolerance' );
delta_within( $a, 199.553357833555, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(16.688504, 317.111550,-12.125937, 75.628131);
delta_ok( $r, 13409094.6209134, 'range is within tolerance' );
delta_within( $a, 94.3634757244859, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-55.936936, 247.119658,-49.609989, 95.206424);
delta_ok( $r, 8019595.70546294, 'range is within tolerance' );
delta_within( $a, 198.711523711379, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-48.734356, 177.370827,-40.864142, 160.579825);
delta_ok( $r, 1585126.11176859, 'range is within tolerance' );
delta_within( $a, 297.197389057407, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-46.420266, 107.250326,26.510982, 269.915143);
delta_ok( $r, 17322878.3638282, 'range is within tolerance' );
delta_within( $a, 139.796923668858, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(33.895806, 153.110909,45.681845, 143.422437);
delta_ok( $r, 1546932.16434011, 'range is within tolerance' );
delta_within( $a, 330.633136925071, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-22.177541, 230.512649,5.952076, 323.707746);
delta_ok( $r, 10591953.1790129, 'range is within tolerance' );
delta_within( $a, 85.7970967849502, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(27.348830, 334.178805,-86.270375, 62.080991);
delta_ok( $r, 13006113.218666, 'range is within tolerance' );
delta_within( $a, 175.799365534158, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(25.235341, 275.242036,31.035045, 277.375893);
delta_ok( $r, 676004.612711586, 'range is within tolerance' );
delta_within( $a, 17.5689229834593, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(44.964609, 321.744934,-49.665325, 229.175856);
delta_ok( $r, 13769363.5529944, 'range is within tolerance' );
delta_within( $a, 231.396822356016, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(17.105270, 223.789909,-23.725503, 25.530801);
delta_ok( $r, 17989959.0909754, 'range is within tolerance' );
delta_within( $a, 114.55421109574, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-43.562030, 130.274241,-2.881152, 181.334105);
delta_ok( $r, 6743615.83724109, 'range is within tolerance' );
delta_within( $a, 63.1354501704683, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-36.975702, 86.458774,28.597533, 323.170028);
delta_ok( $r, 14709618.4240825, 'range is within tolerance' );
delta_within( $a, 276.991231019081, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(30.175209, 16.459075,59.419522, 205.929510);
delta_ok( $r, 10036719.5388652, 'range is within tolerance' );
delta_within( $a, 355.197249821978, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-55.644950, 10.465550,-4.344329, 202.739897);
delta_ok( $r, 13260281.1799076, 'range is within tolerance' );
delta_within( $a, 194.001768323124, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-58.450106, 219.537369,25.011231, 110.301202);
delta_ok( $r, 13454859.3055112, 'range is within tolerance' );
delta_within( $a, 267.595411116428, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(80.393984, 275.211192,23.935568, 24.731901);
delta_ok( $r, 7745665.22175974, 'range is within tolerance' );
delta_within( $a, 66.7895730503046, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-65.005040, 272.050479,-3.463969, 257.290127);
delta_ok( $r, 6929926.85789332, 'range is within tolerance' );
delta_within( $a, 343.292530540849, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-67.713271, 230.359203,-17.890516, 254.265464);
delta_ok( $r, 5790460.28705559, 'range is within tolerance' );
delta_within( $a, 29.3042376067398, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(49.977476, 253.413450,-40.736808, 280.971459);
delta_ok( $r, 10404674.0369978, 'range is within tolerance' );
delta_within( $a, 159.351345995222, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-64.390959, 100.137796,-73.699237, 76.773535);
delta_ok( $r, 1377371.39603648, 'range is within tolerance' );
delta_within( $a, 211.403175640332, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-53.488147, 222.676284,18.783198, 197.750208);
delta_ok( $r, 8357066.17548392, 'range is within tolerance' );
delta_within( $a, 335.565188497479, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(11.886353, 45.880034,-75.325990, 317.821511);
delta_ok( $r, 11219022.8120392, 'range is within tolerance' );
delta_within( $a, 194.994234182454, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-61.023376, 203.548199,-32.274576, 120.526333);
delta_ok( $r, 6560175.4959274, 'range is within tolerance' );
delta_within( $a, 258.557806173273, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-51.815775, 243.103403,-81.006002, 15.254084);
delta_ok( $r, 4980459.53607217, 'range is within tolerance' );
delta_within( $a, 170.496737342413, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(55.609307, 24.137667,36.573196, 147.424699);
delta_ok( $r, 8467114.65823862, 'range is within tolerance' );
delta_within( $a, 43.7496416993868, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(68.261410, 337.404883,-87.468266, 126.278650);
delta_ok( $r, 17814444.0832232, 'range is within tolerance' );
delta_within( $a, 176.099040884626, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(77.163243, 355.929440,-24.865636, 351.624329);
delta_ok( $r, 11323314.1064423, 'range is within tolerance' );
delta_within( $a, 183.999262418074, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-83.363412, 123.109687,60.930467, 157.757983);
delta_ok( $r, 16129090.5382028, 'range is within tolerance' );
delta_within( $a, 29.0390517827566, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(35.819668, 205.275583,-69.790147, 65.110415);
delta_ok( $r, 15535352.6980755, 'range is within tolerance' );
delta_within( $a, 200.069364324033, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(-45.720757, 245.961448,85.378805, 184.898940);
delta_ok( $r, 14801887.1990009, 'range is within tolerance' );
delta_within( $a, 354.425186265008, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(70.557651, 168.120919,-4.512946, 146.711647);
delta_ok( $r, 8481627.39707062, 'range is within tolerance' );
delta_within( $a, 202.024485782197, 0.0001, 'bearing is within tolerance' );

( $r, $a ) = $e->to(45.494490, 42.178744,-62.327500, 251.688039);
delta_ok( $r, 17356605.1087735, 'range is within tolerance' );
delta_within( $a, 214.442967212505, 0.0001, 'bearing is within tolerance' );
