include <c920.scad>;
include <irswitcher.scad>;

c920();
translate([0, 0, 1.1 + 0.1]) irswitcher();
