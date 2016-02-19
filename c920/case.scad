$fn = 100;

include <c920.scad>;
include <heatsink.scad>;
translate([0, 0, 2]) c920();
rotate([0, 0, 180]) translate([0, 0, 1.6]) heatsink();
