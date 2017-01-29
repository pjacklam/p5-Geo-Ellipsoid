#!/usr/local/bin/perl
# Test Geo::Ellipsoid scale
use Test::More tests => 180;
use Test::Number::Delta relative => 1e-6;
use Geo::Ellipsoid;
use blib;
use strict;
use warnings;

my $e = Geo::Ellipsoid->new( units => 'degrees' );
my( $xs, $ys );
( $ys, $xs ) = $e->scales(0);
delta_ok( $xs, 111319.490793274 );
delta_ok( $ys, 110574.275817947 );

( $ys, $xs ) = $e->scales(1);
delta_ok( $xs, 111302.649769733 );
delta_ok( $ys, 110574.61401317 );

( $ys, $xs ) = $e->scales(2);
delta_ok( $xs, 111252.131520105 );
delta_ok( $ys, 110575.628197138 );

( $ys, $xs ) = $e->scales(3);
delta_ok( $xs, 111167.950506736 );
delta_ok( $ys, 110577.317165182 );

( $ys, $xs ) = $e->scales(4);
delta_ok( $xs, 111050.130831407 );
delta_ok( $ys, 110579.67891099 );

( $ys, $xs ) = $e->scales(5);
delta_ok( $xs, 110898.706232141 );
delta_ok( $ys, 110582.710628803 );

( $ys, $xs ) = $e->scales(6);
delta_ok( $xs, 110713.720078709 );
delta_ok( $ys, 110586.408716484 );

( $ys, $xs ) = $e->scales(7);
delta_ok( $xs, 110495.225366838 );
delta_ok( $ys, 110590.768779475 );

( $ys, $xs ) = $e->scales(8);
delta_ok( $xs, 110243.284711087 );
delta_ok( $ys, 110595.785635611 );

( $ys, $xs ) = $e->scales(9);
delta_ok( $xs, 109957.970336388 );
delta_ok( $ys, 110601.453320817 );

( $ys, $xs ) = $e->scales(10);
delta_ok( $xs, 109639.364068207 );
delta_ok( $ys, 110607.765095653 );

( $ys, $xs ) = $e->scales(11);
delta_ok( $xs, 109287.55732131 );
delta_ok( $ys, 110614.713452736 );

( $ys, $xs ) = $e->scales(12);
delta_ok( $xs, 108902.651087102 );
delta_ok( $ys, 110622.290125009 );

( $ys, $xs ) = $e->scales(13);
delta_ok( $xs, 108484.755919492 );
delta_ok( $ys, 110630.486094851 );

( $ys, $xs ) = $e->scales(14);
delta_ok( $xs, 108033.991919256 );
delta_ok( $ys, 110639.291604047 );

( $ys, $xs ) = $e->scales(15);
delta_ok( $xs, 107550.488716854 );
delta_ok( $ys, 110648.696164577 );

( $ys, $xs ) = $e->scales(16);
delta_ok( $xs, 107034.385453646 );
delta_ok( $ys, 110658.688570239 );

( $ys, $xs ) = $e->scales(17);
delta_ok( $xs, 106485.830761474 );
delta_ok( $ys, 110669.256909091 );

( $ys, $xs ) = $e->scales(18);
delta_ok( $xs, 105904.982740543 );
delta_ok( $ys, 110680.3885767 );

( $ys, $xs ) = $e->scales(19);
delta_ok( $xs, 105292.00893556 );
delta_ok( $ys, 110692.070290189 );

( $ys, $xs ) = $e->scales(20);
delta_ok( $xs, 104647.086310063 );
delta_ok( $ys, 110704.288103071 );

( $ys, $xs ) = $e->scales(21);
delta_ok( $xs, 103970.401218892 );
delta_ok( $ys, 110717.027420866 );

( $ys, $xs ) = $e->scales(22);
delta_ok( $xs, 103262.149378732 );
delta_ok( $ys, 110730.273017473 );

( $ys, $xs ) = $e->scales(23);
delta_ok( $xs, 102522.535836669 );
delta_ok( $ys, 110744.009052299 );

( $ys, $xs ) = $e->scales(24);
delta_ok( $xs, 101751.774936693 );
delta_ok( $ys, 110758.219088118 );

( $ys, $xs ) = $e->scales(25);
delta_ok( $xs, 100950.090284085 );
delta_ok( $ys, 110772.88610966 );

( $ys, $xs ) = $e->scales(26);
delta_ok( $xs, 100117.714707607 );
delta_ok( $ys, 110787.992542898 );

( $ys, $xs ) = $e->scales(27);
delta_ok( $xs, 99254.8902194535 );
delta_ok( $ys, 110803.520275028 );

( $ys, $xs ) = $e->scales(28);
delta_ok( $xs, 98361.8679728551 );
delta_ok( $ys, 110819.450675121 );

( $ys, $xs ) = $e->scales(29);
delta_ok( $xs, 97438.9082173023 );
delta_ok( $ys, 110835.764615431 );

( $ys, $xs ) = $e->scales(30);
delta_ok( $xs, 96486.2802512923 );
delta_ok( $ys, 110852.442493325 );

( $ys, $xs ) = $e->scales(31);
delta_ok( $xs, 95504.2623725379 );
delta_ok( $ys, 110869.464253847 );

( $ys, $xs ) = $e->scales(32);
delta_ok( $xs, 94493.1418255652 );
delta_ok( $ys, 110886.809412857 );

( $ys, $xs ) = $e->scales(33);
delta_ok( $xs, 93453.2147466289 );
delta_ok( $ys, 110904.45708075 );

( $ys, $xs ) = $e->scales(34);
delta_ok( $xs, 92384.7861058737 );
delta_ok( $ys, 110922.385986724 );

( $ys, $xs ) = $e->scales(35);
delta_ok( $xs, 91288.1696466726 );
delta_ok( $ys, 110940.574503569 );

( $ys, $xs ) = $e->scales(36);
delta_ok( $xs, 90163.687822073 );
delta_ok( $ys, 110959.000672956 );

( $ys, $xs ) = $e->scales(37);
delta_ok( $xs, 89011.6717282826 );
delta_ok( $ys, 110977.642231203 );

( $ys, $xs ) = $e->scales(38);
delta_ok( $xs, 87832.4610351287 );
delta_ok( $ys, 110996.476635487 );

( $ys, $xs ) = $e->scales(39);
delta_ok( $xs, 86626.4039134272 );
delta_ok( $ys, 111015.481090474 );

( $ys, $xs ) = $e->scales(40);
delta_ok( $xs, 85393.856959198 );
delta_ok( $ys, 111034.63257535 );

( $ys, $xs ) = $e->scales(41);
delta_ok( $xs, 84135.1851146667 );
delta_ok( $ys, 111053.9078712 );

( $ys, $xs ) = $e->scales(42);
delta_ok( $xs, 82850.7615859959 );
delta_ok( $ys, 111073.283588736 );

( $ys, $xs ) = $e->scales(43);
delta_ok( $xs, 81540.9677576894 );
delta_ok( $ys, 111092.736196315 );

( $ys, $xs ) = $e->scales(44);
delta_ok( $xs, 80206.1931036193 );
delta_ok( $ys, 111112.242048231 );

( $ys, $xs ) = $e->scales(45);
delta_ok( $xs, 78846.8350946261 );
delta_ok( $ys, 111131.77741325 );

( $ys, $xs ) = $e->scales(46);
delta_ok( $xs, 77463.2991026462 );
delta_ok( $ys, 111151.318503339 );

( $ys, $xs ) = $e->scales(47);
delta_ok( $xs, 76055.9983013273 );
delta_ok( $ys, 111170.841502575 );

( $ys, $xs ) = $e->scales(48);
delta_ok( $xs, 74625.3535630919 );
delta_ok( $ys, 111190.322596186 );

( $ys, $xs ) = $e->scales(49);
delta_ok( $xs, 73171.7933526159 );
delta_ok( $ys, 111209.737999693 );

( $ys, $xs ) = $e->scales(50);
delta_ok( $xs, 71695.7536166949 );
delta_ok( $ys, 111229.063988114 );

( $ys, $xs ) = $e->scales(51);
delta_ok( $xs, 70197.6776704706 );
delta_ok( $ys, 111248.276925202 );

( $ys, $xs ) = $e->scales(52);
delta_ok( $xs, 68678.01608 );
delta_ok( $ys, 111267.353292667 );

( $ys, $xs ) = $e->scales(53);
delta_ok( $xs, 67137.2265411514 );
delta_ok( $ys, 111286.269719356 );

( $ys, $xs ) = $e->scales(54);
delta_ok( $xs, 65575.7737548158 );
delta_ok( $ys, 111305.003010348 );

( $ys, $xs ) = $e->scales(55);
delta_ok( $xs, 63994.1292984323 );
delta_ok( $ys, 111323.530175922 );

( $ys, $xs ) = $e->scales(56);
delta_ok( $xs, 62392.771493824 );
delta_ok( $ys, 111341.828460371 );

( $ys, $xs ) = $e->scales(57);
delta_ok( $xs, 60772.1852713534 );
delta_ok( $ys, 111359.875370607 );

( $ys, $xs ) = $e->scales(58);
delta_ok( $xs, 59132.8620304075 );
delta_ok( $ys, 111377.648704531 );

( $ys, $xs ) = $e->scales(59);
delta_ok( $xs, 57475.2994962303 );
delta_ok( $ys, 111395.126579128 );

( $ys, $xs ) = $e->scales(60);
delta_ok( $xs, 55800.0015731251 );
delta_ok( $ys, 111412.287458232 );

( $ys, $xs ) = $e->scales(61);
delta_ok( $xs, 54107.4781940567 );
delta_ok( $ys, 111429.110179948 );

( $ys, $xs ) = $e->scales(62);
delta_ok( $xs, 52398.245166686 );
delta_ok( $ys, 111445.573983668 );

( $ys, $xs ) = $e->scales(63);
delta_ok( $xs, 50672.824015881 );
delta_ok( $ys, 111461.658536656 );

( $ys, $xs ) = $e->scales(64);
delta_ok( $xs, 48931.7418227467 );
delta_ok( $ys, 111477.343960157 );

( $ys, $xs ) = $e->scales(65);
delta_ok( $xs, 47175.5310602301 );
delta_ok( $ys, 111492.610854996 );

( $ys, $xs ) = $e->scales(66);
delta_ok( $xs, 45404.7294253569 );
delta_ok( $ys, 111507.440326623 );

( $ys, $xs ) = $e->scales(67);
delta_ok( $xs, 43619.8796681642 );
delta_ok( $ys, 111521.814009577 );

( $ys, $xs ) = $e->scales(68);
delta_ok( $xs, 41821.5294174006 );
delta_ok( $ys, 111535.714091316 );

( $ys, $xs ) = $e->scales(69);
delta_ok( $xs, 40010.2310030689 );
delta_ok( $ys, 111549.123335396 );

( $ys, $xs ) = $e->scales(70);
delta_ok( $xs, 38186.5412758943 );
delta_ok( $ys, 111562.025103946 );

( $ys, $xs ) = $e->scales(71);
delta_ok( $xs, 36351.0214238039 );
delta_ok( $ys, 111574.403379417 );

( $ys, $xs ) = $e->scales(72);
delta_ok( $xs, 34504.2367855127 );
delta_ok( $ys, 111586.242785563 );

( $ys, $xs ) = $e->scales(73);
delta_ok( $xs, 32646.7566613133 );
delta_ok( $ys, 111597.528607626 );

( $ys, $xs ) = $e->scales(74);
delta_ok( $xs, 30779.1541211736 );
delta_ok( $ys, 111608.246811693 );

( $ys, $xs ) = $e->scales(75);
delta_ok( $xs, 28902.0058102511 );
delta_ok( $ys, 111618.384063189 );

( $ys, $xs ) = $e->scales(76);
delta_ok( $xs, 27015.8917519385 );
delta_ok( $ys, 111627.927744482 );

( $ys, $xs ) = $e->scales(77);
delta_ok( $xs, 25121.3951485581 );
delta_ok( $ys, 111636.865971573 );

( $ys, $xs ) = $e->scales(78);
delta_ok( $xs, 23219.1021798302 );
delta_ok( $ys, 111645.187609837 );

( $ys, $xs ) = $e->scales(79);
delta_ok( $xs, 21309.6017992407 );
delta_ok( $ys, 111652.882288796 );

( $ys, $xs ) = $e->scales(80);
delta_ok( $xs, 19393.4855284423 );
delta_ok( $ys, 111659.940415897 );

( $ys, $xs ) = $e->scales(81);
delta_ok( $xs, 17471.3472498225 );
delta_ok( $ys, 111666.353189275 );

( $ys, $xs ) = $e->scales(82);
delta_ok( $xs, 15543.7829973802 );
delta_ok( $ys, 111672.112609476 );

( $ys, $xs ) = $e->scales(83);
delta_ok( $xs, 13611.390746052 );
delta_ok( $ys, 111677.21149012 );

( $ys, $xs ) = $e->scales(84);
delta_ok( $xs, 11674.7701996341 );
delta_ok( $ys, 111681.643467501 );

( $ys, $xs ) = $e->scales(85);
delta_ok( $xs, 9734.52257745026 );
delta_ok( $ys, 111685.40300908 );

( $ys, $xs ) = $e->scales(86);
delta_ok( $xs, 7791.25039991422 );
delta_ok( $ys, 111688.48542089 );

( $ys, $xs ) = $e->scales(87);
delta_ok( $xs, 5845.55727314299 );
delta_ok( $ys, 111690.886853809 );

( $ys, $xs ) = $e->scales(88);
delta_ok( $xs, 3898.04767277445 );
delta_ok( $ys, 111692.604308716 );

( $ys, $xs ) = $e->scales(89);
delta_ok( $xs, 1949.32672714707 );
delta_ok( $ys, 111693.635640507 );

