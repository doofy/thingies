$fn = 100;

include <c920.scad>;
include <heatsink.scad>;
include <adapter2.scad>;
include <irswitcher2.scad>;
translate([0, 0, 2]) c920();
rotate([0, 0, 180]) translate([0, 0, 1.6]) heatsink();
rotate([0, 0, 180]) translate([0, 0, 3.1]) adapter();
translate([0, 0, 5.2]) irswitcher();
