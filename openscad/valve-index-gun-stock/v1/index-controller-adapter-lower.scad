include <index-controller-adapter.scad>
rotate([180, 0, 0]) {
  difference() {
    rotate([180, 0, 0]) pipeadapter();
    translate([0, 0, -25]) cube([60, 40, 50], center=true);
  }
}
