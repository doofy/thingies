$fn = 50;

include <c920.scad>;
include <heatsink.scad>;
include <adapter2.scad>;
include <irswitcher2.scad>;
/*translate([0, 0, 0]) c920();*/
/*rotate([0, 0, 180]) translate([0, 0, 0]) heatsink();*/
/*rotate([0, 0, 180]) translate([0, 0, 1.2]) adapter();*/
/*translate([0, 0, 3.2]) irswitcher();*/
include <mount.scad>;

include <c920cutouts.scad>;
translate([0, 0, 0]) c920cutouts();
include <heatsinkcutouts.scad>;
rotate([0, 0, 180]) translate([0, 0, 0]) heatsinkcutouts();

$innerw = 85;
$innerd = 27;
$innerh = 20;
$innersmallw = 20;
$innersmalld = 37;
$innersmallh = 20;
$wall = 2.0;
$outerw = $innerw + 2 * $wall;
$outerd = $innerd + 2 * $wall;
$outerh = $innerh + $wall - 0.01;
$outersmallw = $innersmallw + 2 * $wall;
$outersmalld = $innersmalld + 2 * $wall;
$outersmallh = $innersmallh + $wall - 0.01;
difference() {
  union() {
    translate([-$outerw / 2, -$outerd / 2, -2.2 - $wall]) cube([$outerw, $outerd, $outerh]);
    translate([-$outersmallw / 2, -$outersmalld / 2, -2.2 - $wall]) cube([$outersmallw, $outersmalld, $outersmallh]);
  }
    translate([-$innerw / 2, -$innerd / 2, -2.2]) cube([$innerw, $innerd, $innerh]);
    translate([-$innersmallw / 2, -$innersmalld / 2, -2.2]) cube([$innersmallw, $innersmalld, $innersmallh]);
}

translate([0, $outersmalld/2, 0]) mount();
