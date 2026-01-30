
module d1mini(center = false) {
  rastermass = 2.56;

  board_length = 34.2;
  board_width = 26;
  board_thickness = 1;

  centerx = center ? -board_length / 2 : 0;
  centery = center ? -board_width / 2 : 0;
  centerz = center ? -board_thickness / 2 : 0;
  translate([centerx, centery, centerz]) {
    difference() {
      // board
      cube([board_length, board_width, board_thickness]);
      // long hole
      translate([-0.01, -0.01, -board_thickness]) {
        translate([6, 0.1*hole_diameter, 0]) cylinder(h = 3*board_thickness, d = hole_diameter);
        cube([6, 0.6*hole_diameter, 3*board_thickness]);
      }
      // corner cut right top
      translate([board_length, board_width, 0]) rotate([0, 0, 180]) {
        translate([hole_diameter*0.5, hole_diameter*0.5, 0]) difference() {
          translate([-2*hole_diameter, -2*hole_diameter, -board_thickness]) cube([2*hole_diameter, 2*hole_diameter, 3*board_thickness]);
          translate([0, 0, -2*board_thickness]) cylinder(h = 5*board_thickness, d = hole_diameter);
        }
      }
      // corner cut right bottom
      translate([board_length, 0, 0]) rotate([0, 0, 90]) {
        translate([hole_diameter*0.5, hole_diameter*0.5, 0]) difference() {
          translate([-2*hole_diameter, -2*hole_diameter, -board_thickness]) cube([2*hole_diameter, 2*hole_diameter, 3*board_thickness]);
          translate([0, 0, -2*board_thickness]) cylinder(h = 5*board_thickness, d = hole_diameter);
        }
      }
    }
    // esp
    translate([11.5, 6.5, -3.5]) cube([15, 12, 3.5]);
    // usbc
    translate([-1.5, 8.6, board_thickness]) cube([9, 7.5, 3.1]);
    // pins bottom
    translate([8.5, 1, 0]) {
      translate([0 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
      translate([1 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
      translate([2 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
      translate([3 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
      translate([4 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
      translate([5 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
      translate([6 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
      translate([7 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
    }
    // pins top
    translate([8.5, board_width - 1, 0]) {
      translate([0 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
      translate([1 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
      translate([2 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
      translate([3 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
      translate([4 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
      translate([5 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
      translate([6 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
      translate([7 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
    }
  }
}
