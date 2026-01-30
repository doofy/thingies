board_length = 44;
board_width = 14.9;
board_thickness = 1.2;

hole_diameter = 2.5;

connector_width = 9;
connector_depth = 5;
connector_height = 4;

pin_diameter = 0.5;
pin_height = 6.4;

pin_box_width = 8;
pin_box_depth = 4;
pin_box_height = 2.5;

rastermass = 2;

module ld2450(altitude = 0, center = false) {
  centerx = center ? -board_length / 2 : 0;
  centery = center ? -board_width / 2 : 0;
  centerz = center ? -board_thickness / 2 : 0;
  rotate([altitude, 0, 0]) translate([centerx, centery, centerz]) {
    // board with holes
    difference() {
      // board
      cube([board_length, board_width, board_thickness]);
      // holes
      translate([0, 0, -board_thickness]) cylinder(h = 3*board_thickness, d = hole_diameter);
      translate([board_length, board_width, -board_thickness]) cylinder(h = 3*board_thickness, d = hole_diameter);
      // corner cut left top
      translate([0, board_width, 0]) rotate([0, 0, -90]) {
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
    // stuff thats on the board
    translate([0, 0, board_thickness]) {
      // connector box
      translate([1.5, connector_width + (board_width - connector_width)/2, 0]) rotate([0, 0, -90]) cube([connector_width, connector_depth, connector_height]);
      // pins with box
      translate([board_length - pin_box_depth - 3, pin_box_width + 4, 0]) rotate([0, 0, -90]) {
        // pin cube
        cube([pin_box_width, pin_box_depth, pin_box_height]);
        translate([rastermass*0.5, rastermass*0.5, 0]) {
          // pins
          translate([0 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
          translate([1 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
          translate([2 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
          translate([3 * rastermass, 0 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
          translate([0 * rastermass, 1 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
          translate([1 * rastermass, 1 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
          translate([2 * rastermass, 1 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
          translate([3 * rastermass, 1 * rastermass, 0]) cylinder(h = pin_height, d = pin_diameter);
        }
      }
    }
  }
}
