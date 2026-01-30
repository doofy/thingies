//gelaender
//color("red")translate([-4, 0, 0]) cube([500, 40, 8]);

difference() {
  translate([0, -4/2, -2]) {
    rotate([90, 0, 90]) {
      translate([0, 8+2, 0])
        linear_extrude(height=50) {
          polygon(points=[[0, 0], [40+4, 0], [20+2, 20+2]]);
        }
      linear_extrude(height=50) {
        polygon(points=[[0, 0], [0, 8+2], [40+4, 8+2], [40+4, 0]]);
      }
    }
  }
  translate([-1, -.5, -.5]) cube([500, 41, 9]);
  translate([-1, 2, -4]) cube([500, 36, 8]);
translate([10, 0, 0]) cylinder(d=5, h=50);
}
