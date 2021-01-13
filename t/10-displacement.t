#!perl
# Test Geo::Ellipsoid displacement

use strict;
use warnings;

use Test::More tests => 200;
use Test::Number::Delta relative => 1e-6;
use Geo::Ellipsoid;

my $e1 = Geo::Ellipsoid->new(angle_unit => 'degrees');
my $e2 = Geo::Ellipsoid->new(angle_unit => 'degrees',longitude_symmetric => 1);
my($lat1,$lon1,$lat2,$lon2,$x,$y);

($x, $y) = $e1->displacement(-38.369163,190.874558,-38.365617,190.880663);
delta_within( $x, 533.491110769497, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 393.690589873872, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-14.608137,30.094655,-14.550676,30.100688);
delta_within( $x, 650.150163064452, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 6357.79865738374, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-41.623677,208.834416,-41.625005,208.853655);
delta_within( $x, 1603.25828998005, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -147.740698434298, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-67.726400,52.964864,-67.721545,52.981049);
delta_within( $x, 685.045724508065, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 541.410394042256, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-5.158991,259.931626,-5.199299,259.916210);
delta_within( $x, -1709.08838296384, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -4457.45014453801, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-0.582762,29.118576,-0.590251,29.143976);
delta_within( $x, 2827.36763205086, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -828.182160065182, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-26.934636,30.474042,-26.932001,30.483581);
delta_within( $x, 947.389492534066, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 291.95221620625, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-62.773742,62.342057,-62.738893,62.197306);
delta_within( $x, -7400.40744853875, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 3875.89184805399, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(68.057252,192.858027,68.044404,192.750474);
delta_within( $x, -4489.41916103631, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -1429.20302514898, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(1.348841,276.378914,1.262253,276.398905);
delta_within( $x, 2224.78977865538, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -9574.41945175545, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(27.335146,320.699240,27.336545,320.612990);
delta_within( $x, -8535.15072425152, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 157.936548304324, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(34.623205,31.357288,34.572414,31.419023);
delta_within( $x, 5664.82387546623, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -5632.70871934825, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-6.856999,130.887597,-6.914531,130.847349);
delta_within( $x, -4447.96592912094, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -6362.64101921163, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-70.754141,43.777574,-70.782012,43.650760);
delta_within( $x, -4660.66333081732, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -3114.5204267637, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-69.865357,188.114494,-69.823814,188.297760);
delta_within( $x, 7057.33332640238, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 4623.92896337807, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-79.523730,324.065787,-79.516236,324.164445);
delta_within( $x, 2004.84197135812, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 835.05624599899, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(74.606774,294.646962,74.552581,294.521663);
delta_within( $x, -3726.78613552502, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -6044.73542923351, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(28.972667,278.549276,28.976797,278.572695);
delta_within( $x, 2282.39634325838, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 457.952282732985, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-20.359063,296.599967,-20.370270,296.589859);
delta_within( $x, -1055.2681349475, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -1240.7239252939, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-60.365048,156.813021,-60.365144,156.812998);
delta_within( $x, -1.25069744996409, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -10.735742111454, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-6.203945,247.684632,-6.206375,247.686280);
delta_within( $x, 182.386266388312, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -268.728800216709, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(0.611947,100.746342,0.552611,100.813829);
delta_within( $x, 7512.26439232481, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -6560.95975342741, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-20.725615,342.386744,-20.731167,342.381571);
delta_within( $x, -538.867521997165, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -614.748870906239, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(46.911457,128.191393,46.947211,128.307770);
delta_within( $x, 8859.82533662808, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 3981.36230426399, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-11.235004,282.756437,-11.245390,282.754171);
delta_within( $x, -247.423508180175, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -1148.83285898256, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-41.167125,221.956378,-41.138589,222.040926);
delta_within( $x, 7098.52944501954, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 3165.70460707207, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-1.549886,336.466532,-1.568002,336.488389);
delta_within( $x, 2432.16438177744, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -2003.19688436404, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-63.776699,134.057987,-63.713580,133.947510);
delta_within( $x, -5461.07109624643, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 7031.3999102379, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(77.940951,38.523563,77.953242,38.498324);
delta_within( $x, -588.2817189244, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 1372.29108955997, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(45.339403,315.409130,45.355920,315.432956);
delta_within( $x, 1866.95131432594, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 1836.02860724827, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(6.190847,124.992089,6.166990,125.017473);
delta_within( $x, 2809.54258182171, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -2638.1854171307, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-4.121498,262.769582,-4.205652,262.771793);
delta_within( $x, 245.486246709279, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -9305.72947322145, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-4.285155,344.319438,-4.310738,344.328106);
delta_within( $x, 962.149187035999, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -2828.96060386948, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(51.523602,137.628739,51.485778,137.714167);
delta_within( $x, 5934.07068830833, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -4204.71851784455, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(25.726049,310.324628,25.746353,310.262255);
delta_within( $x, -6257.92811146551, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 2250.85411079545, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(68.128342,115.791221,68.089490,115.743185);
delta_within( $x, -2001.18083908742, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -4332.66868442188, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-11.919645,340.641713,-11.926844,340.645394);
delta_within( $x, 400.975086576748, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -796.364783669101, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-30.550903,251.787663,-30.582047,251.779583);
delta_within( $x, -775.012580393562, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -3452.63873401273, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-61.797586,265.384439,-61.744275,265.519702);
delta_within( $x, 7146.86789641311, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 5933.55596563448, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(71.112709,8.834545,71.123788,8.940371);
delta_within( $x, 3822.76720145874, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 1239.54643522283, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-63.553064,13.025588,-63.587233,13.054037);
delta_within( $x, 1412.58459089997, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -3809.12345867196, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(29.289568,92.918510,29.349021,92.967234);
delta_within( $x, 4731.59651044238, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 6590.7862137285, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(23.630668,183.960989,23.655943,184.001554);
delta_within( $x, 4138.46502323554, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 2799.85919268482, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(21.323022,38.682180,21.337607,38.668693);
delta_within( $x, -1399.05734418193, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 1614.9381747213, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(77.751666,6.954744,77.807559,7.206150);
delta_within( $x, 5929.59652185934, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 6252.74614671928, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-58.652658,205.140021,-58.644961,205.122979);
delta_within( $x, -989.610010692449, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 857.234289734966, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(7.193705,159.638737,7.167620,159.650791);
delta_within( $x, 1331.48923190115, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -2884.77225251152, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(74.707726,290.854396,74.744182,290.651892);
delta_within( $x, -5950.18809260623, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 4079.1901160009, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(68.994921,41.466113,68.962469,41.539078);
delta_within( $x, 2924.34424068079, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -3618.18289201676, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-19.222949,91.053479,-19.231565,91.044550);
delta_within( $x, -938.847376999214, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -953.711224264123, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(19.041053,175.994927,19.050225,175.946699);
delta_within( $x, -5076.39561742681, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 1015.89451929997, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-35.454628,153.274308,-35.453589,153.286051);
delta_within( $x, 1065.98882431652, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 115.261142808934, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(64.324875,209.104753,64.339416,208.939933);
delta_within( $x, -7966.96393627614, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 1631.35811372205, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(33.139375,123.465763,33.161860,123.562434);
delta_within( $x, 9017.72315379902, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 2497.95299346363, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(35.694667,300.725605,35.680284,300.759234);
delta_within( $x, 3044.24623630822, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -1595.33813900956, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-25.789728,191.087862,-25.739926,191.093314);
delta_within( $x, 546.974168864775, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 5517.28342993103, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-7.204161,179.885067,-7.226829,179.883563);
delta_within( $x, -166.062017698856, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -2506.87128827767, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-41.090138,219.595320,-41.067159,219.577277);
delta_within( $x, -1516.57232495753, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 2551.75692820411, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(11.191046,106.356107,11.218345,106.390880);
delta_within( $x, 3797.39956359156, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 3019.90679922201, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(22.955732,47.794852,22.881556,47.787755);
delta_within( $x, -728.235875891048, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -8214.48845561489, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-15.074589,56.914619,-15.138920,56.922179);
delta_within( $x, 812.601451282285, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -7118.19727800996, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(35.067827,307.917302,34.993494,307.932973);
delta_within( $x, 1430.72001409177, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -8246.45256031149, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(66.084685,30.192264,66.078143,30.159379);
delta_within( $x, -1488.56810134952, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -729.098706812585, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(42.839865,327.847225,42.863817,327.806156);
delta_within( $x, -3356.1707620514, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 2661.66562916981, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-23.824528,241.336801,-23.844150,241.338414);
delta_within( $x, 164.348889911057, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -2173.20304898315, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-48.109675,147.804097,-48.085873,147.766528);
delta_within( $x, -2798.93428834979, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 2645.89807702508, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-17.562152,276.168590,-17.598393,276.206284);
delta_within( $x, 4000.91902732043, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -4011.40753167892, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(64.918979,305.870922,64.935148,305.824711);
delta_within( $x, -2185.353233505, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 1803.46389815993, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(75.481994,274.248595,75.488003,274.301073);
delta_within( $x, 1468.48543886645, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 671.355531566821, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(3.076206,112.117539,3.058191,112.030896);
delta_within( $x, -9631.38160123754, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -1991.68245088253, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(12.921677,151.249684,12.931945,151.286618);
delta_within( $x, 4007.81424175016, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 1136.26395257582, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(72.833548,317.667505,72.834038,317.668425);
delta_within( $x, 30.3097655306324, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 54.677508779463, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-33.041308,313.249683,-33.096312,313.168134);
delta_within( $x, -7612.69582743443, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -6103.24474259603, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-12.674750,312.909013,-12.646330,312.908099);
delta_within( $x, -99.3361370786624, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 3144.11289504971, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-67.846380,99.041109,-67.773503,99.082954);
delta_within( $x, 1767.08990217108, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 8127.61599255158, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(41.911754,138.151813,41.931514,138.160441);
delta_within( $x, 715.584704636911, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 2194.88853405005, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-27.100512,351.279156,-27.155735,351.235891);
delta_within( $x, -4288.35388641327, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -6119.80604285317, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(19.497371,220.383733,19.471564,220.430924);
delta_within( $x, 4954.74739700155, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -2856.04915916429, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(18.396198,143.265994,18.462031,143.275068);
delta_within( $x, 958.381194292114, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 7286.76107621224, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-18.084386,221.381908,-18.034138,221.361084);
delta_within( $x, -2205.00648076527, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 5561.32518565219, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(46.204817,295.396070,46.149812,295.325078);
delta_within( $x, -5484.43284149248, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -6111.55063780036, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-30.523088,295.285416,-30.521713,295.289652);
delta_within( $x, 406.600786596961, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 152.458263849088, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(13.742087,63.763606,13.702427,63.762726);
delta_within( $x, -95.1229021040874, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -4387.88267126666, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(1.554684,167.837560,1.569181,167.861738);
delta_within( $x, 2690.41001032243, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 1602.97818773516, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(40.356751,153.160097,40.386450,153.104771);
delta_within( $x, -4697.73231336178, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 3299.38895647392, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(46.867006,44.857631,46.793584,44.800043);
delta_within( $x, -4396.76033676708, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -8160.55066556507, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-9.089458,237.666143,-9.069840,237.671183);
delta_within( $x, 554.021196653765, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 2169.71264531183, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-27.107665,34.103508,-27.124307,34.066447);
delta_within( $x, -3674.49829921885, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -1844.63377836673, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(5.067958,24.268528,5.126032,24.314116);
delta_within( $x, 5054.67712322343, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 6422.20411670883, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-30.360974,322.538048,-30.354172,322.551237);
delta_within( $x, 1267.9890126613, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 753.96742231916, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(54.780139,8.410011,54.697426,8.352324);
delta_within( $x, -3719.33949254854, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -9205.90372228507, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(13.769616,110.113762,13.780933,110.110241);
delta_within( $x, -380.806322268491, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 1252.08412928076, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-64.270514,45.105873,-64.307413,45.176951);
delta_within( $x, 3439.70922672176, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -4115.44667469491, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-45.137898,141.541847,-45.120807,141.535744);
delta_within( $x, -480.245739061077, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 1899.41377857496, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(6.782845,255.237805,6.796487,255.210769);
delta_within( $x, -2988.66714517472, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 1508.75404879856, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(6.371687,279.113190,6.374738,279.111955);
delta_within( $x, -136.703313797909, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 337.358790144585, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(44.782374,163.862303,44.840677,163.945679);
delta_within( $x, 6592.12877130491, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 6482.4746588658, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-70.362274,322.490547,-70.343758,322.449274);
delta_within( $x, -1550.1112655522, 1.0, 'x displacement is within tolerance' );
delta_within( $y, 2065.27461061981, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-19.715571,5.847281,-19.756866,5.813268);
delta_within( $x, -3564.89009313264, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -4571.75406452381, 1.0, 'y displacement is within tolerance' );

($x, $y) = $e1->displacement(-69.938162,165.492639,-70.001918,165.578716);
delta_within( $x, 3286.68608014123, 1.0, 'x displacement is within tolerance' );
delta_within( $y, -7115.04613475074, 1.0, 'y displacement is within tolerance' );
