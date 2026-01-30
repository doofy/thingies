$fn = 64;

use <couchtisch.scad>

module side() {
  translate([0, 20, 0]) sphere(r=3);
}

difference() {
  hull() {
    sphere(r=3);
    rotate([0, 0, 0]) side();
    rotate([-90, 0, 0]) side();
    rotate([0, 0, 90]) side();
  };
  couchtisch();
  translate([1, 15, -3]) rotate([90, 0, 90]) linear_extrude(height = 5) text("couch v2", size=2, font = "DejaVu Sans Mono", halign="right");
}
