include <c920.scad>;
include <irswitcher.scad>;
include <adapter.scad>;

c920();
color("red") translate([0, 0, 1.1 + 0.1])adapter();
rotate([0, 0, 90]) translate([0, 0, 1.1 + 0.1 + 4]) irswitcher();
