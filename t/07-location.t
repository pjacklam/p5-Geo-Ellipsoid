#!perl
# Test Geo::Ellipsoid location

use strict;
use warnings;

use Test::More tests => 400;
use Test::Number::Delta relative => 1e-6;
use Geo::Ellipsoid;

my $e1 = Geo::Ellipsoid->new(angle_unit => 'degrees');
my $e2 = Geo::Ellipsoid->new(angle_unit => 'degrees',longitude_symmetric => 1);
my($lat1,$lon1,$lat2,$lon2,$x,$y);

($lat1, $lon1) = $e1->location(-38.369163,190.874558,533.491111,393.690590);
($lat2, $lon2) = $e2->location(-38.369163,190.874558,533.491111,393.690590);
delta_ok( $lat1, -38.3656166574816, 'latitude is within tolerance' );
delta_ok( $lon1, 190.880662670944, 'longitude is within tolerance' );
delta_ok( $lat2, -38.3656166574816, 'latitude is within tolerance' );
delta_ok( $lon2, -169.119337329056, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-14.608137,30.094655,650.150163,6357.798657);
($lat2, $lon2) = $e2->location(-14.608137,30.094655,650.150163,6357.798657);
delta_ok( $lat1, -14.5506757312212, 'latitude is within tolerance' );
delta_ok( $lon1, 30.1006878108632, 'longitude is within tolerance' );
delta_ok( $lat2, -14.5506757312212, 'latitude is within tolerance' );
delta_ok( $lon2, 30.1006878108632, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-41.623677,208.834416,1603.258290,-147.740698);
($lat2, $lon2) = $e2->location(-41.623677,208.834416,1603.258290,-147.740698);
delta_ok( $lat1, -41.6250052190667, 'latitude is within tolerance' );
delta_ok( $lon1, 208.853654884741, 'longitude is within tolerance' );
delta_ok( $lat2, -41.6250052190667, 'latitude is within tolerance' );
delta_ok( $lon2, -151.146345115259, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-67.726400,52.964864,685.045725,541.410394);
($lat2, $lon2) = $e2->location(-67.726400,52.964864,685.045725,541.410394);
delta_ok( $lat1, -67.72154487153, 'latitude is within tolerance' );
delta_ok( $lon1, 52.9810494838027, 'longitude is within tolerance' );
delta_ok( $lat2, -67.72154487153, 'latitude is within tolerance' );
delta_ok( $lon2, 52.9810494838027, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-5.158991,259.931626,-1709.088383,-4457.450145);
($lat2, $lon2) = $e2->location(-5.158991,259.931626,-1709.088383,-4457.450145);
delta_ok( $lat1, -5.19929911014964, 'latitude is within tolerance' );
delta_ok( $lon1, 259.916209822012, 'longitude is within tolerance' );
delta_ok( $lat2, -5.19929911014964, 'latitude is within tolerance' );
delta_ok( $lon2, -100.083790177988, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-0.582762,29.118576,2827.367632,-828.182160);
($lat2, $lon2) = $e2->location(-0.582762,29.118576,2827.367632,-828.182160);
delta_ok( $lat1, -0.590251306822751, 'latitude is within tolerance' );
delta_ok( $lon1, 29.1439759994689, 'longitude is within tolerance' );
delta_ok( $lat2, -0.590251306822751, 'latitude is within tolerance' );
delta_ok( $lon2, 29.1439759994689, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-26.934636,30.474042,947.389493,291.952216);
($lat2, $lon2) = $e2->location(-26.934636,30.474042,947.389493,291.952216);
delta_ok( $lat1, -26.9320006429191, 'latitude is within tolerance' );
delta_ok( $lon1, 30.4835810246334, 'longitude is within tolerance' );
delta_ok( $lat2, -26.9320006429191, 'latitude is within tolerance' );
delta_ok( $lon2, 30.4835810246334, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-62.773742,62.342057,-7400.407449,3875.891848);
($lat2, $lon2) = $e2->location(-62.773742,62.342057,-7400.407449,3875.891848);
delta_ok( $lat1, -62.738893257913, 'latitude is within tolerance' );
delta_ok( $lon1, 62.197305731553, 'longitude is within tolerance' );
delta_ok( $lat2, -62.738893257913, 'latitude is within tolerance' );
delta_ok( $lon2, 62.197305731553, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(68.057252,192.858027,-4489.419161,-1429.203025);
($lat2, $lon2) = $e2->location(68.057252,192.858027,-4489.419161,-1429.203025);
delta_ok( $lat1, 68.0444035490457, 'latitude is within tolerance' );
delta_ok( $lon1, 192.750473587802, 'longitude is within tolerance' );
delta_ok( $lat2, 68.0444035490457, 'latitude is within tolerance' );
delta_ok( $lon2, -167.249526412198, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(1.348841,276.378914,2224.789779,-9574.419452);
($lat2, $lon2) = $e2->location(1.348841,276.378914,2224.789779,-9574.419452);
delta_ok( $lat1, 1.26225340172628, 'latitude is within tolerance' );
delta_ok( $lon1, 276.398904775364, 'longitude is within tolerance' );
delta_ok( $lat2, 1.26225340172628, 'latitude is within tolerance' );
delta_ok( $lon2, -83.6010952246363, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(27.335146,320.699240,-8535.150724,157.936548);
($lat2, $lon2) = $e2->location(27.335146,320.699240,-8535.150724,157.936548);
delta_ok( $lat1, 27.336544790133, 'latitude is within tolerance' );
delta_ok( $lon1, 320.612989777828, 'longitude is within tolerance' );
delta_ok( $lat2, 27.336544790133, 'latitude is within tolerance' );
delta_ok( $lon2, -39.3870102221718, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(34.623205,31.357288,5664.823875,-5632.708719);
($lat2, $lon2) = $e2->location(34.623205,31.357288,5664.823875,-5632.708719);
delta_ok( $lat1, 34.5724140545376, 'latitude is within tolerance' );
delta_ok( $lon1, 31.4190231012302, 'longitude is within tolerance' );
delta_ok( $lat2, 34.5724140545376, 'latitude is within tolerance' );
delta_ok( $lon2, 31.4190231012302, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-6.856999,130.887597,-4447.965929,-6362.641019);
($lat2, $lon2) = $e2->location(-6.856999,130.887597,-4447.965929,-6362.641019);
delta_ok( $lat1, -6.91453101371974, 'latitude is within tolerance' );
delta_ok( $lon1, 130.847349224089, 'longitude is within tolerance' );
delta_ok( $lat2, -6.91453101371974, 'latitude is within tolerance' );
delta_ok( $lon2, 130.847349224089, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-70.754141,43.777574,-4660.663331,-3114.520427);
($lat2, $lon2) = $e2->location(-70.754141,43.777574,-4660.663331,-3114.520427);
delta_ok( $lat1, -70.7820124418521, 'latitude is within tolerance' );
delta_ok( $lon1, 43.6507601360177, 'longitude is within tolerance' );
delta_ok( $lat2, -70.7820124418521, 'latitude is within tolerance' );
delta_ok( $lon2, 43.6507601360177, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-69.865357,188.114494,7057.333326,4623.928963);
($lat2, $lon2) = $e2->location(-69.865357,188.114494,7057.333326,4623.928963);
delta_ok( $lat1, -69.8238139675753, 'latitude is within tolerance' );
delta_ok( $lon1, 188.297759634022, 'longitude is within tolerance' );
delta_ok( $lat2, -69.8238139675753, 'latitude is within tolerance' );
delta_ok( $lon2, -171.702240365978, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-79.523730,324.065787,2004.841971,835.056246);
($lat2, $lon2) = $e2->location(-79.523730,324.065787,2004.841971,835.056246);
delta_ok( $lat1, -79.5162359949416, 'latitude is within tolerance' );
delta_ok( $lon1, 324.164444728713, 'longitude is within tolerance' );
delta_ok( $lat2, -79.5162359949416, 'latitude is within tolerance' );
delta_ok( $lon2, -35.8355552712871, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(74.606774,294.646962,-3726.786136,-6044.735429);
($lat2, $lon2) = $e2->location(74.606774,294.646962,-3726.786136,-6044.735429);
delta_ok( $lat1, 74.552581484185, 'latitude is within tolerance' );
delta_ok( $lon1, 294.521662695934, 'longitude is within tolerance' );
delta_ok( $lat2, 74.552581484185, 'latitude is within tolerance' );
delta_ok( $lon2, -65.4783373040659, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(28.972667,278.549276,2282.396343,457.952283);
($lat2, $lon2) = $e2->location(28.972667,278.549276,2282.396343,457.952283);
delta_ok( $lat1, 28.9767972109023, 'latitude is within tolerance' );
delta_ok( $lon1, 278.572694719835, 'longitude is within tolerance' );
delta_ok( $lat2, 28.9767972109023, 'latitude is within tolerance' );
delta_ok( $lon2, -81.4273052801652, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-20.359063,296.599967,-1055.268135,-1240.723925);
($lat2, $lon2) = $e2->location(-20.359063,296.599967,-1055.268135,-1240.723925);
delta_ok( $lat1, -20.3702696544288, 'latitude is within tolerance' );
delta_ok( $lon1, 296.589859316515, 'longitude is within tolerance' );
delta_ok( $lat2, -20.3702696544288, 'latitude is within tolerance' );
delta_ok( $lon2, -63.4101406834851, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-60.365048,156.813021,-1.250697,-10.735742);
($lat2, $lon2) = $e2->location(-60.365048,156.813021,-1.250697,-10.735742);
delta_ok( $lat1, -60.3651441594277, 'latitude is within tolerance' );
delta_ok( $lon1, 156.812997908757, 'longitude is within tolerance' );
delta_ok( $lat2, -60.3651441594277, 'latitude is within tolerance' );
delta_ok( $lon2, 156.812997908757, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-6.203945,247.684632,182.386266,-268.728800);
($lat2, $lon2) = $e2->location(-6.203945,247.684632,182.386266,-268.728800);
delta_ok( $lat1, -6.20637500756399, 'latitude is within tolerance' );
delta_ok( $lon1, 247.686280489375, 'longitude is within tolerance' );
delta_ok( $lat2, -6.20637500756399, 'latitude is within tolerance' );
delta_ok( $lon2, -112.313719510625, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(0.611947,100.746342,7512.264392,-6560.959753);
($lat2, $lon2) = $e2->location(0.611947,100.746342,7512.264392,-6560.959753);
delta_ok( $lat1, 0.55261091016823, 'latitude is within tolerance' );
delta_ok( $lon1, 100.813828549171, 'longitude is within tolerance' );
delta_ok( $lat2, 0.55261091016823, 'latitude is within tolerance' );
delta_ok( $lon2, 100.813828549171, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-20.725615,342.386744,-538.867522,-614.748871);
($lat2, $lon2) = $e2->location(-20.725615,342.386744,-538.867522,-614.748871);
delta_ok( $lat1, -20.7311674916701, 'latitude is within tolerance' );
delta_ok( $lon1, 342.381570767838, 'longitude is within tolerance' );
delta_ok( $lat2, -20.7311674916701, 'latitude is within tolerance' );
delta_ok( $lon2, -17.6184292321621, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(46.911457,128.191393,8859.825337,3981.362304);
($lat2, $lon2) = $e2->location(46.911457,128.191393,8859.825337,3981.362304);
delta_ok( $lat1, 46.9472109419573, 'latitude is within tolerance' );
delta_ok( $lon1, 128.307769547944, 'longitude is within tolerance' );
delta_ok( $lat2, 46.9472109419573, 'latitude is within tolerance' );
delta_ok( $lon2, 128.307769547944, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-11.235004,282.756437,-247.423508,-1148.832859);
($lat2, $lon2) = $e2->location(-11.235004,282.756437,-247.423508,-1148.832859);
delta_ok( $lat1, -11.2453901777647, 'latitude is within tolerance' );
delta_ok( $lon1, 282.754171348951, 'longitude is within tolerance' );
delta_ok( $lat2, -11.2453901777647, 'latitude is within tolerance' );
delta_ok( $lon2, -77.2458286510488, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-41.167125,221.956378,7098.529445,3165.704607);
($lat2, $lon2) = $e2->location(-41.167125,221.956378,7098.529445,3165.704607);
delta_ok( $lat1, -41.1385887169891, 'latitude is within tolerance' );
delta_ok( $lon1, 222.040925759323, 'longitude is within tolerance' );
delta_ok( $lat2, -41.1385887169891, 'latitude is within tolerance' );
delta_ok( $lon2, -137.959074240677, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-1.549886,336.466532,2432.164382,-2003.196884);
($lat2, $lon2) = $e2->location(-1.549886,336.466532,2432.164382,-2003.196884);
delta_ok( $lat1, -1.56800166865689, 'latitude is within tolerance' );
delta_ok( $lon1, 336.48838856866, 'longitude is within tolerance' );
delta_ok( $lat2, -1.56800166865689, 'latitude is within tolerance' );
delta_ok( $lon2, -23.5116114313395, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-63.776699,134.057987,-5461.071096,7031.399910);
($lat2, $lon2) = $e2->location(-63.776699,134.057987,-5461.071096,7031.399910);
delta_ok( $lat1, -63.7135798907925, 'latitude is within tolerance' );
delta_ok( $lon1, 133.947510160671, 'longitude is within tolerance' );
delta_ok( $lat2, -63.7135798907925, 'latitude is within tolerance' );
delta_ok( $lon2, 133.947510160671, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(77.940951,38.523563,-588.281719,1372.291090);
($lat2, $lon2) = $e2->location(77.940951,38.523563,-588.281719,1372.291090);
delta_ok( $lat1, 77.9532419255974, 'latitude is within tolerance' );
delta_ok( $lon1, 38.4983240629321, 'longitude is within tolerance' );
delta_ok( $lat2, 77.9532419255974, 'latitude is within tolerance' );
delta_ok( $lon2, 38.4983240629321, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(45.339403,315.409130,1866.951314,1836.028607);
($lat2, $lon2) = $e2->location(45.339403,315.409130,1866.951314,1836.028607);
delta_ok( $lat1, 45.3559203918087, 'latitude is within tolerance' );
delta_ok( $lon1, 315.432955775137, 'longitude is within tolerance' );
delta_ok( $lat2, 45.3559203918087, 'latitude is within tolerance' );
delta_ok( $lon2, -44.5670442248635, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(6.190847,124.992089,2809.542582,-2638.185417);
($lat2, $lon2) = $e2->location(6.190847,124.992089,2809.542582,-2638.185417);
delta_ok( $lat1, 6.16698993482276, 'latitude is within tolerance' );
delta_ok( $lon1, 125.017473198902, 'longitude is within tolerance' );
delta_ok( $lat2, 6.16698993482276, 'latitude is within tolerance' );
delta_ok( $lon2, 125.017473198902, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-4.121498,262.769582,245.486247,-9305.729473);
($lat2, $lon2) = $e2->location(-4.121498,262.769582,245.486247,-9305.729473);
delta_ok( $lat1, -4.20565178483598, 'latitude is within tolerance' );
delta_ok( $lon1, 262.771793465594, 'longitude is within tolerance' );
delta_ok( $lat2, -4.20565178483598, 'latitude is within tolerance' );
delta_ok( $lon2, -97.2282065344056, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-4.285155,344.319438,962.149187,-2828.960604);
($lat2, $lon2) = $e2->location(-4.285155,344.319438,962.149187,-2828.960604);
delta_ok( $lat1, -4.31073788511535, 'latitude is within tolerance' );
delta_ok( $lon1, 344.328105973954, 'longitude is within tolerance' );
delta_ok( $lat2, -4.31073788511535, 'latitude is within tolerance' );
delta_ok( $lon2, -15.6718940260457, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(51.523602,137.628739,5934.070688,-4204.718518);
($lat2, $lon2) = $e2->location(51.523602,137.628739,5934.070688,-4204.718518);
delta_ok( $lat1, 51.4857783969849, 'latitude is within tolerance' );
delta_ok( $lon1, 137.714167388512, 'longitude is within tolerance' );
delta_ok( $lat2, 51.4857783969849, 'latitude is within tolerance' );
delta_ok( $lon2, 137.714167388512, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(25.726049,310.324628,-6257.928111,2250.854111);
($lat2, $lon2) = $e2->location(25.726049,310.324628,-6257.928111,2250.854111);
delta_ok( $lat1, 25.7463533347373, 'latitude is within tolerance' );
delta_ok( $lon1, 310.262255281203, 'longitude is within tolerance' );
delta_ok( $lat2, 25.7463533347373, 'latitude is within tolerance' );
delta_ok( $lon2, -49.7377447187972, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(68.128342,115.791221,-2001.180839,-4332.668684);
($lat2, $lon2) = $e2->location(68.128342,115.791221,-2001.180839,-4332.668684);
delta_ok( $lat1, 68.089489578884, 'latitude is within tolerance' );
delta_ok( $lon1, 115.743184646015, 'longitude is within tolerance' );
delta_ok( $lat2, 68.089489578884, 'latitude is within tolerance' );
delta_ok( $lon2, 115.743184646015, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-11.919645,340.641713,400.975087,-796.364784);
($lat2, $lon2) = $e2->location(-11.919645,340.641713,400.975087,-796.364784);
delta_ok( $lat1, -11.9268441615802, 'latitude is within tolerance' );
delta_ok( $lon1, 340.645393779515, 'longitude is within tolerance' );
delta_ok( $lat2, -11.9268441615802, 'latitude is within tolerance' );
delta_ok( $lon2, -19.354606220485, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-30.550903,251.787663,-775.012580,-3452.638734);
($lat2, $lon2) = $e2->location(-30.550903,251.787663,-775.012580,-3452.638734);
delta_ok( $lat1, -30.5820467190056, 'latitude is within tolerance' );
delta_ok( $lon1, 251.77958340328, 'longitude is within tolerance' );
delta_ok( $lat2, -30.5820467190056, 'latitude is within tolerance' );
delta_ok( $lon2, -108.22041659672, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-61.797586,265.384439,7146.867896,5933.555966);
($lat2, $lon2) = $e2->location(-61.797586,265.384439,7146.867896,5933.555966);
delta_ok( $lat1, -61.7442754682937, 'latitude is within tolerance' );
delta_ok( $lon1, 265.519702300482, 'longitude is within tolerance' );
delta_ok( $lat2, -61.7442754682937, 'latitude is within tolerance' );
delta_ok( $lon2, -94.4802976995183, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(71.112709,8.834545,3822.767201,1239.546435);
($lat2, $lon2) = $e2->location(71.112709,8.834545,3822.767201,1239.546435);
delta_ok( $lat1, 71.1237884898956, 'latitude is within tolerance' );
delta_ok( $lon1, 8.9403714174623, 'longitude is within tolerance' );
delta_ok( $lat2, 71.1237884898956, 'latitude is within tolerance' );
delta_ok( $lon2, 8.9403714174623, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-63.553064,13.025588,1412.584591,-3809.123459);
($lat2, $lon2) = $e2->location(-63.553064,13.025588,1412.584591,-3809.123459);
delta_ok( $lat1, -63.587232627602, 'latitude is within tolerance' );
delta_ok( $lon1, 13.0540374200214, 'longitude is within tolerance' );
delta_ok( $lat2, -63.587232627602, 'latitude is within tolerance' );
delta_ok( $lon2, 13.0540374200214, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(29.289568,92.918510,4731.596510,6590.786214);
($lat2, $lon2) = $e2->location(29.289568,92.918510,4731.596510,6590.786214);
delta_ok( $lat1, 29.3490208963828, 'latitude is within tolerance' );
delta_ok( $lon1, 92.9672340946057, 'longitude is within tolerance' );
delta_ok( $lat2, 29.3490208963828, 'latitude is within tolerance' );
delta_ok( $lon2, 92.9672340946057, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(23.630668,183.960989,4138.465023,2799.859193);
($lat2, $lon2) = $e2->location(23.630668,183.960989,4138.465023,2799.859193);
delta_ok( $lat1, 23.6559427295585, 'latitude is within tolerance' );
delta_ok( $lon1, 184.001554318971, 'longitude is within tolerance' );
delta_ok( $lat2, 23.6559427295585, 'latitude is within tolerance' );
delta_ok( $lon2, -175.998445681029, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(21.323022,38.682180,-1399.057344,1614.938175);
($lat2, $lon2) = $e2->location(21.323022,38.682180,-1399.057344,1614.938175);
delta_ok( $lat1, 21.3376068588205, 'latitude is within tolerance' );
delta_ok( $lon1, 38.6686929767104, 'longitude is within tolerance' );
delta_ok( $lat2, 21.3376068588205, 'latitude is within tolerance' );
delta_ok( $lon2, 38.6686929767104, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(77.751666,6.954744,5929.596522,6252.746147);
($lat2, $lon2) = $e2->location(77.751666,6.954744,5929.596522,6252.746147);
delta_ok( $lat1, 77.8075587887118, 'latitude is within tolerance' );
delta_ok( $lon1, 7.20615011733763, 'longitude is within tolerance' );
delta_ok( $lat2, 77.8075587887118, 'latitude is within tolerance' );
delta_ok( $lon2, 7.20615011733763, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-58.652658,205.140021,-989.610011,857.234290);
($lat2, $lon2) = $e2->location(-58.652658,205.140021,-989.610011,857.234290);
delta_ok( $lat1, -58.6449608105583, 'latitude is within tolerance' );
delta_ok( $lon1, 205.122978574437, 'longitude is within tolerance' );
delta_ok( $lat2, -58.6449608105583, 'latitude is within tolerance' );
delta_ok( $lon2, -154.877021425563, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(7.193705,159.638737,1331.489232,-2884.772253);
($lat2, $lon2) = $e2->location(7.193705,159.638737,1331.489232,-2884.772253);
delta_ok( $lat1, 7.16761967835449, 'latitude is within tolerance' );
delta_ok( $lon1, 159.650791084088, 'longitude is within tolerance' );
delta_ok( $lat2, 7.16761967835449, 'latitude is within tolerance' );
delta_ok( $lon2, 159.650791084088, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(74.707726,290.854396,-5950.188093,4079.190116);
($lat2, $lon2) = $e2->location(74.707726,290.854396,-5950.188093,4079.190116);
delta_ok( $lat1, 74.7441816240245, 'latitude is within tolerance' );
delta_ok( $lon1, 290.651891561222, 'longitude is within tolerance' );
delta_ok( $lat2, 74.7441816240245, 'latitude is within tolerance' );
delta_ok( $lon2, -69.3481084387778, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(68.994921,41.466113,2924.344241,-3618.182892);
($lat2, $lon2) = $e2->location(68.994921,41.466113,2924.344241,-3618.182892);
delta_ok( $lat1, 68.9624691494271, 'latitude is within tolerance' );
delta_ok( $lon1, 41.5390782800596, 'longitude is within tolerance' );
delta_ok( $lat2, 68.9624691494271, 'latitude is within tolerance' );
delta_ok( $lon2, 41.5390782800596, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-19.222949,91.053479,-938.847377,-953.711224);
($lat2, $lon2) = $e2->location(-19.222949,91.053479,-938.847377,-953.711224);
delta_ok( $lat1, -19.2315645979899, 'latitude is within tolerance' );
delta_ok( $lon1, 91.0445501139712, 'longitude is within tolerance' );
delta_ok( $lat2, -19.2315645979899, 'latitude is within tolerance' );
delta_ok( $lon2, 91.0445501139712, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(19.041053,175.994927,-5076.395617,1015.894519);
($lat2, $lon2) = $e2->location(19.041053,175.994927,-5076.395617,1015.894519);
delta_ok( $lat1, 19.0502245946019, 'latitude is within tolerance' );
delta_ok( $lon1, 175.946699498326, 'longitude is within tolerance' );
delta_ok( $lat2, 19.0502245946019, 'latitude is within tolerance' );
delta_ok( $lon2, 175.946699498326, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-35.454628,153.274308,1065.988824,115.261143);
($lat2, $lon2) = $e2->location(-35.454628,153.274308,1065.988824,115.261143);
delta_ok( $lat1, -35.4535887262639, 'latitude is within tolerance' );
delta_ok( $lon1, 153.286050580698, 'longitude is within tolerance' );
delta_ok( $lat2, -35.4535887262639, 'latitude is within tolerance' );
delta_ok( $lon2, 153.286050580698, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(64.324875,209.104753,-7966.963936,1631.358114);
($lat2, $lon2) = $e2->location(64.324875,209.104753,-7966.963936,1631.358114);
delta_ok( $lat1, 64.3394159635433, 'latitude is within tolerance' );
delta_ok( $lon1, 208.939932681831, 'longitude is within tolerance' );
delta_ok( $lat2, 64.3394159635433, 'latitude is within tolerance' );
delta_ok( $lon2, -151.060067318169, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(33.139375,123.465763,9017.723154,2497.952993);
($lat2, $lon2) = $e2->location(33.139375,123.465763,9017.723154,2497.952993);
delta_ok( $lat1, 33.1618601109721, 'latitude is within tolerance' );
delta_ok( $lon1, 123.562433957867, 'longitude is within tolerance' );
delta_ok( $lat2, 33.1618601109721, 'latitude is within tolerance' );
delta_ok( $lon2, 123.562433957867, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(35.694667,300.725605,3044.246236,-1595.338139);
($lat2, $lon2) = $e2->location(35.694667,300.725605,3044.246236,-1595.338139);
delta_ok( $lat1, 35.6802840942486, 'latitude is within tolerance' );
delta_ok( $lon1, 300.75923369164, 'longitude is within tolerance' );
delta_ok( $lat2, 35.6802840942486, 'latitude is within tolerance' );
delta_ok( $lon2, -59.2407663083597, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-25.789728,191.087862,546.974169,5517.283430);
($lat2, $lon2) = $e2->location(-25.789728,191.087862,546.974169,5517.283430);
delta_ok( $lat1, -25.7399260442896, 'latitude is within tolerance' );
delta_ok( $lon1, 191.093313592838, 'longitude is within tolerance' );
delta_ok( $lat2, -25.7399260442896, 'latitude is within tolerance' );
delta_ok( $lon2, -168.906686407162, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-7.204161,179.885067,-166.062018,-2506.871288);
($lat2, $lon2) = $e2->location(-7.204161,179.885067,-166.062018,-2506.871288);
delta_ok( $lat1, -7.22682901108564, 'latitude is within tolerance' );
delta_ok( $lon1, 179.883563144484, 'longitude is within tolerance' );
delta_ok( $lat2, -7.22682901108564, 'latitude is within tolerance' );
delta_ok( $lon2, 179.883563144484, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-41.090138,219.595320,-1516.572325,2551.756928);
($lat2, $lon2) = $e2->location(-41.090138,219.595320,-1516.572325,2551.756928);
delta_ok( $lat1, -41.0671591825447, 'latitude is within tolerance' );
delta_ok( $lon1, 219.577276687536, 'longitude is within tolerance' );
delta_ok( $lat2, -41.0671591825447, 'latitude is within tolerance' );
delta_ok( $lon2, -140.422723312464, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(11.191046,106.356107,3797.399564,3019.906799);
($lat2, $lon2) = $e2->location(11.191046,106.356107,3797.399564,3019.906799);
delta_ok( $lat1, 11.2183452049465, 'latitude is within tolerance' );
delta_ok( $lon1, 106.390879919224, 'longitude is within tolerance' );
delta_ok( $lat2, 11.2183452049465, 'latitude is within tolerance' );
delta_ok( $lon2, 106.390879919224, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(22.955732,47.794852,-728.235876,-8214.488456);
($lat2, $lon2) = $e2->location(22.955732,47.794852,-728.235876,-8214.488456);
delta_ok( $lat1, 22.8815557299625, 'latitude is within tolerance' );
delta_ok( $lon1, 47.7877547716615, 'longitude is within tolerance' );
delta_ok( $lat2, 22.8815557299625, 'latitude is within tolerance' );
delta_ok( $lon2, 47.7877547716615, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-15.074589,56.914619,812.601451,-7118.197278);
($lat2, $lon2) = $e2->location(-15.074589,56.914619,812.601451,-7118.197278);
delta_ok( $lat1, -15.1389196660838, 'latitude is within tolerance' );
delta_ok( $lon1, 56.9221791309893, 'longitude is within tolerance' );
delta_ok( $lat2, -15.1389196660838, 'latitude is within tolerance' );
delta_ok( $lon2, 56.9221791309893, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(35.067827,307.917302,1430.720014,-8246.452560);
($lat2, $lon2) = $e2->location(35.067827,307.917302,1430.720014,-8246.452560);
delta_ok( $lat1, 34.993494196776, 'latitude is within tolerance' );
delta_ok( $lon1, 307.932973187806, 'longitude is within tolerance' );
delta_ok( $lat2, 34.993494196776, 'latitude is within tolerance' );
delta_ok( $lon2, -52.0670268121944, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(66.084685,30.192264,-1488.568101,-729.098707);
($lat2, $lon2) = $e2->location(66.084685,30.192264,-1488.568101,-729.098707);
delta_ok( $lat1, 66.0781430272163, 'latitude is within tolerance' );
delta_ok( $lon1, 30.1593794067059, 'longitude is within tolerance' );
delta_ok( $lat2, 66.0781430272163, 'latitude is within tolerance' );
delta_ok( $lon2, 30.1593794067059, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(42.839865,327.847225,-3356.170762,2661.665629);
($lat2, $lon2) = $e2->location(42.839865,327.847225,-3356.170762,2661.665629);
delta_ok( $lat1, 42.8638173053354, 'latitude is within tolerance' );
delta_ok( $lon1, 327.806155932557, 'longitude is within tolerance' );
delta_ok( $lat2, 42.8638173053354, 'latitude is within tolerance' );
delta_ok( $lon2, -32.1938440674425, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-23.824528,241.336801,164.348890,-2173.203049);
($lat2, $lon2) = $e2->location(-23.824528,241.336801,164.348890,-2173.203049);
delta_ok( $lat1, -23.8441499994284, 'latitude is within tolerance' );
delta_ok( $lon1, 241.338413904748, 'longitude is within tolerance' );
delta_ok( $lat2, -23.8441499994284, 'latitude is within tolerance' );
delta_ok( $lon2, -118.661586095252, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-48.109675,147.804097,-2798.934288,2645.898077);
($lat2, $lon2) = $e2->location(-48.109675,147.804097,-2798.934288,2645.898077);
delta_ok( $lat1, -48.0858733128975, 'latitude is within tolerance' );
delta_ok( $lon1, 147.766528156688, 'longitude is within tolerance' );
delta_ok( $lat2, -48.0858733128975, 'latitude is within tolerance' );
delta_ok( $lon2, 147.766528156688, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-17.562152,276.168590,4000.919027,-4011.407532);
($lat2, $lon2) = $e2->location(-17.562152,276.168590,4000.919027,-4011.407532);
delta_ok( $lat1, -17.5983930208429, 'latitude is within tolerance' );
delta_ok( $lon1, 276.206284342329, 'longitude is within tolerance' );
delta_ok( $lat2, -17.5983930208429, 'latitude is within tolerance' );
delta_ok( $lon2, -83.7937156576705, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(64.918979,305.870922,-2185.353234,1803.463898);
($lat2, $lon2) = $e2->location(64.918979,305.870922,-2185.353234,1803.463898);
delta_ok( $lat1, 64.9351480714201, 'latitude is within tolerance' );
delta_ok( $lon1, 305.824710582963, 'longitude is within tolerance' );
delta_ok( $lat2, 64.9351480714201, 'latitude is within tolerance' );
delta_ok( $lon2, -54.1752894170374, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(75.481994,274.248595,1468.485439,671.355532);
($lat2, $lon2) = $e2->location(75.481994,274.248595,1468.485439,671.355532);
delta_ok( $lat1, 75.4880029055828, 'latitude is within tolerance' );
delta_ok( $lon1, 274.301072964265, 'longitude is within tolerance' );
delta_ok( $lat2, 75.4880029055828, 'latitude is within tolerance' );
delta_ok( $lon2, -85.6989270357354, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(3.076206,112.117539,-9631.381601,-1991.682451);
($lat2, $lon2) = $e2->location(3.076206,112.117539,-9631.381601,-1991.682451);
delta_ok( $lat1, 3.05819117659667, 'latitude is within tolerance' );
delta_ok( $lon1, 112.03089587221, 'longitude is within tolerance' );
delta_ok( $lat2, 3.05819117659667, 'latitude is within tolerance' );
delta_ok( $lon2, 112.03089587221, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(12.921677,151.249684,4007.814242,1136.263953);
($lat2, $lon2) = $e2->location(12.921677,151.249684,4007.814242,1136.263953);
delta_ok( $lat1, 12.9319448741798, 'latitude is within tolerance' );
delta_ok( $lon1, 151.286617723767, 'longitude is within tolerance' );
delta_ok( $lat2, 12.9319448741798, 'latitude is within tolerance' );
delta_ok( $lon2, 151.286617723767, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(72.833548,317.667505,30.309765,54.677509);
($lat2, $lon2) = $e2->location(72.833548,317.667505,30.309765,54.677509);
delta_ok( $lat1, 72.8340378772457, 'latitude is within tolerance' );
delta_ok( $lon1, 317.668425118621, 'longitude is within tolerance' );
delta_ok( $lat2, 72.8340378772457, 'latitude is within tolerance' );
delta_ok( $lon2, -42.3315748813785, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-33.041308,313.249683,-7612.695827,-6103.244743);
($lat2, $lon2) = $e2->location(-33.041308,313.249683,-7612.695827,-6103.244743);
delta_ok( $lat1, -33.0963123185806, 'latitude is within tolerance' );
delta_ok( $lon1, 313.168134096477, 'longitude is within tolerance' );
delta_ok( $lat2, -33.0963123185806, 'latitude is within tolerance' );
delta_ok( $lon2, -46.8318659035227, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-12.674750,312.909013,-99.336137,3144.112895);
($lat2, $lon2) = $e2->location(-12.674750,312.909013,-99.336137,3144.112895);
delta_ok( $lat1, -12.6463295522285, 'latitude is within tolerance' );
delta_ok( $lon1, 312.908098770026, 'longitude is within tolerance' );
delta_ok( $lat2, -12.6463295522285, 'latitude is within tolerance' );
delta_ok( $lon2, -47.0919012299736, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-67.846380,99.041109,1767.089902,8127.615993);
($lat2, $lon2) = $e2->location(-67.846380,99.041109,1767.089902,8127.615993);
delta_ok( $lat1, -67.7735027510774, 'latitude is within tolerance' );
delta_ok( $lon1, 99.0829538757835, 'longitude is within tolerance' );
delta_ok( $lat2, -67.7735027510774, 'latitude is within tolerance' );
delta_ok( $lon2, 99.0829538757835, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(41.911754,138.151813,715.584705,2194.888534);
($lat2, $lon2) = $e2->location(41.911754,138.151813,715.584705,2194.888534);
delta_ok( $lat1, 41.9315142758588, 'latitude is within tolerance' );
delta_ok( $lon1, 138.160440601835, 'longitude is within tolerance' );
delta_ok( $lat2, 41.9315142758588, 'latitude is within tolerance' );
delta_ok( $lon2, 138.160440601835, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-27.100512,351.279156,-4288.353886,-6119.806043);
($lat2, $lon2) = $e2->location(-27.100512,351.279156,-4288.353886,-6119.806043);
delta_ok( $lat1, -27.1557353506078, 'latitude is within tolerance' );
delta_ok( $lon1, 351.235890988004, 'longitude is within tolerance' );
delta_ok( $lat2, -27.1557353506078, 'latitude is within tolerance' );
delta_ok( $lon2, -8.76410901199599, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(19.497371,220.383733,4954.747397,-2856.049159);
($lat2, $lon2) = $e2->location(19.497371,220.383733,4954.747397,-2856.049159);
delta_ok( $lat1, 19.4715643857244, 'latitude is within tolerance' );
delta_ok( $lon1, 220.430924356231, 'longitude is within tolerance' );
delta_ok( $lat2, 19.4715643857244, 'latitude is within tolerance' );
delta_ok( $lon2, -139.569075643769, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(18.396198,143.265994,958.381194,7286.761076);
($lat2, $lon2) = $e2->location(18.396198,143.265994,958.381194,7286.761076);
delta_ok( $lat1, 18.4620306038802, 'latitude is within tolerance' );
delta_ok( $lon1, 143.275067859029, 'longitude is within tolerance' );
delta_ok( $lat2, 18.4620306038802, 'latitude is within tolerance' );
delta_ok( $lon2, 143.275067859029, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-18.084386,221.381908,-2205.006481,5561.325186);
($lat2, $lon2) = $e2->location(-18.084386,221.381908,-2205.006481,5561.325186);
delta_ok( $lat1, -18.0341383666819, 'latitude is within tolerance' );
delta_ok( $lon1, 221.361083689563, 'longitude is within tolerance' );
delta_ok( $lat2, -18.0341383666819, 'latitude is within tolerance' );
delta_ok( $lon2, -138.638916310437, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(46.204817,295.396070,-5484.432841,-6111.550638);
($lat2, $lon2) = $e2->location(46.204817,295.396070,-5484.432841,-6111.550638);
delta_ok( $lat1, 46.1498123310369, 'latitude is within tolerance' );
delta_ok( $lon1, 295.325077737085, 'longitude is within tolerance' );
delta_ok( $lat2, 46.1498123310369, 'latitude is within tolerance' );
delta_ok( $lon2, -64.6749222629154, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-30.523088,295.285416,406.600787,152.458264);
($lat2, $lon2) = $e2->location(-30.523088,295.285416,406.600787,152.458264);
delta_ok( $lat1, -30.5217130438922, 'latitude is within tolerance' );
delta_ok( $lon1, 295.289652469157, 'longitude is within tolerance' );
delta_ok( $lat2, -30.5217130438922, 'latitude is within tolerance' );
delta_ok( $lon2, -64.7103475308431, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(13.742087,63.763606,-95.122902,-4387.882671);
($lat2, $lon2) = $e2->location(13.742087,63.763606,-95.122902,-4387.882671);
delta_ok( $lat1, 13.7024269689814, 'latitude is within tolerance' );
delta_ok( $lon1, 63.7627262988153, 'longitude is within tolerance' );
delta_ok( $lat2, 13.7024269689814, 'latitude is within tolerance' );
delta_ok( $lon2, 63.7627262988153, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(1.554684,167.837560,2690.410011,1602.978188);
($lat2, $lon2) = $e2->location(1.554684,167.837560,2690.410011,1602.978188);
delta_ok( $lat1, 1.56918059097552, 'latitude is within tolerance' );
delta_ok( $lon1, 167.861737784577, 'longitude is within tolerance' );
delta_ok( $lat2, 1.56918059097552, 'latitude is within tolerance' );
delta_ok( $lon2, 167.861737784577, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(40.356751,153.160097,-4697.732313,3299.388956);
($lat2, $lon2) = $e2->location(40.356751,153.160097,-4697.732313,3299.388956);
delta_ok( $lat1, 40.3864504304799, 'latitude is within tolerance' );
delta_ok( $lon1, 153.104771159051, 'longitude is within tolerance' );
delta_ok( $lat2, 40.3864504304799, 'latitude is within tolerance' );
delta_ok( $lon2, 153.104771159051, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(46.867006,44.857631,-4396.760337,-8160.550665);
($lat2, $lon2) = $e2->location(46.867006,44.857631,-4396.760337,-8160.550665);
delta_ok( $lat1, 46.7935841133508, 'latitude is within tolerance' );
delta_ok( $lon1, 44.8000433688766, 'longitude is within tolerance' );
delta_ok( $lat2, 46.7935841133508, 'latitude is within tolerance' );
delta_ok( $lon2, 44.8000433688766, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-9.089458,237.666143,554.021197,2169.712645);
($lat2, $lon2) = $e2->location(-9.089458,237.666143,554.021197,2169.712645);
delta_ok( $lat1, -9.06984018685995, 'latitude is within tolerance' );
delta_ok( $lon1, 237.671182904242, 'longitude is within tolerance' );
delta_ok( $lat2, -9.06984018685995, 'latitude is within tolerance' );
delta_ok( $lon2, -122.328817095758, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-27.107665,34.103508,-3674.498299,-1844.633778);
($lat2, $lon2) = $e2->location(-27.107665,34.103508,-3674.498299,-1844.633778);
delta_ok( $lat1, -27.1243073483822, 'latitude is within tolerance' );
delta_ok( $lon1, 34.0664465612592, 'longitude is within tolerance' );
delta_ok( $lat2, -27.1243073483822, 'latitude is within tolerance' );
delta_ok( $lon2, 34.0664465612592, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(5.067958,24.268528,5054.677123,6422.204117);
($lat2, $lon2) = $e2->location(5.067958,24.268528,5054.677123,6422.204117);
delta_ok( $lat1, 5.12603197726362, 'latitude is within tolerance' );
delta_ok( $lon1, 24.3141162471053, 'longitude is within tolerance' );
delta_ok( $lat2, 5.12603197726362, 'latitude is within tolerance' );
delta_ok( $lon2, 24.3141162471053, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-30.360974,322.538048,1267.989013,753.967422);
($lat2, $lon2) = $e2->location(-30.360974,322.538048,1267.989013,753.967422);
delta_ok( $lat1, -30.3541720736129, 'latitude is within tolerance' );
delta_ok( $lon1, 322.551236568074, 'longitude is within tolerance' );
delta_ok( $lat2, -30.3541720736129, 'latitude is within tolerance' );
delta_ok( $lon2, -37.4487634319259, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(54.780139,8.410011,-3719.339493,-9205.903722);
($lat2, $lon2) = $e2->location(54.780139,8.410011,-3719.339493,-9205.903722);
delta_ok( $lat1, 54.6974261720386, 'latitude is within tolerance' );
delta_ok( $lon1, 8.3523242715081, 'longitude is within tolerance' );
delta_ok( $lat2, 54.6974261720386, 'latitude is within tolerance' );
delta_ok( $lon2, 8.3523242715081, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(13.769616,110.113762,-380.806322,1252.084129);
($lat2, $lon2) = $e2->location(13.769616,110.113762,-380.806322,1252.084129);
delta_ok( $lat1, 13.78093309177, 'latitude is within tolerance' );
delta_ok( $lon1, 110.110240703272, 'longitude is within tolerance' );
delta_ok( $lat2, 13.78093309177, 'latitude is within tolerance' );
delta_ok( $lon2, 110.110240703272, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-64.270514,45.105873,3439.709227,-4115.446675);
($lat2, $lon2) = $e2->location(-64.270514,45.105873,3439.709227,-4115.446675);
delta_ok( $lat1, -64.3074130400444, 'latitude is within tolerance' );
delta_ok( $lon1, 45.1769508481278, 'longitude is within tolerance' );
delta_ok( $lat2, -64.3074130400444, 'latitude is within tolerance' );
delta_ok( $lon2, 45.1769508481278, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-45.137898,141.541847,-480.245739,1899.413779);
($lat2, $lon2) = $e2->location(-45.137898,141.541847,-480.245739,1899.413779);
delta_ok( $lat1, -45.1208065938124, 'latitude is within tolerance' );
delta_ok( $lon1, 141.535743596221, 'longitude is within tolerance' );
delta_ok( $lat2, -45.1208065938124, 'latitude is within tolerance' );
delta_ok( $lon2, 141.535743596221, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(6.782845,255.237805,-2988.667145,1508.754049);
($lat2, $lon2) = $e2->location(6.782845,255.237805,-2988.667145,1508.754049);
delta_ok( $lat1, 6.79648733577162, 'latitude is within tolerance' );
delta_ok( $lon1, 255.21076894319, 'longitude is within tolerance' );
delta_ok( $lat2, 6.79648733577162, 'latitude is within tolerance' );
delta_ok( $lon2, -104.78923105681, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(6.371687,279.113190,-136.703314,337.358790);
($lat2, $lon2) = $e2->location(6.371687,279.113190,-136.703314,337.358790);
delta_ok( $lat1, 6.37473803790458, 'latitude is within tolerance' );
delta_ok( $lon1, 279.111954845525, 'longitude is within tolerance' );
delta_ok( $lat2, 6.37473803790458, 'latitude is within tolerance' );
delta_ok( $lon2, -80.8880451544753, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(44.782374,163.862303,6592.128771,6482.474659);
($lat2, $lon2) = $e2->location(44.782374,163.862303,6592.128771,6482.474659);
delta_ok( $lat1, 44.8406766505374, 'latitude is within tolerance' );
delta_ok( $lon1, 163.945679242349, 'longitude is within tolerance' );
delta_ok( $lat2, 44.8406766505374, 'latitude is within tolerance' );
delta_ok( $lon2, 163.945679242349, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-70.362274,322.490547,-1550.111266,2065.274611);
($lat2, $lon2) = $e2->location(-70.362274,322.490547,-1550.111266,2065.274611);
delta_ok( $lat1, -70.343757819168, 'latitude is within tolerance' );
delta_ok( $lon1, 322.449273778159, 'longitude is within tolerance' );
delta_ok( $lat2, -70.343757819168, 'latitude is within tolerance' );
delta_ok( $lon2, -37.5507262218411, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-19.715571,5.847281,-3564.890093,-4571.754065);
($lat2, $lon2) = $e2->location(-19.715571,5.847281,-3564.890093,-4571.754065);
delta_ok( $lat1, -19.7568659277085, 'latitude is within tolerance' );
delta_ok( $lon1, 5.81326755286751, 'longitude is within tolerance' );
delta_ok( $lat2, -19.7568659277085, 'latitude is within tolerance' );
delta_ok( $lon2, 5.81326755286751, 'longitude is within tolerance' );

($lat1, $lon1) = $e1->location(-69.938162,165.492639,3286.686080,-7115.046135);
($lat2, $lon2) = $e2->location(-69.938162,165.492639,3286.686080,-7115.046135);
delta_ok( $lat1, -70.0019179240387, 'latitude is within tolerance' );
delta_ok( $lon1, 165.578716457451, 'longitude is within tolerance' );
delta_ok( $lat2, -70.0019179240387, 'latitude is within tolerance' );
delta_ok( $lon2, 165.578716457451, 'longitude is within tolerance' );
