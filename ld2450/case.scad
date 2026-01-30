$fn = 16;

include <ld2450.scad>
include <d1mini.scad>

translate([20, 0, 5]) rotate([90+35, 0, -90]) ld2450(center = true);
d1mini(center = true);
