module automower_305() {
  ROBOT_HEIGHT = 250;
  ROBOT_LENGTH = 570;
  ROBOT_WIDTH = 430;
  ROBOT_GROUND_CLEARANCE = 50;

  ROBOT_WHEEL_BIG_WIDTH = 30;
  ROBOT_WHEEL_BIG_RADIUS = 125;

  A_WIDTH = 60;
  A_RADIUS = 50;

  translate([ROBOT_WHEEL_BIG_WIDTH/2, 0, 0]) {
    translate([0, 0, ROBOT_GROUND_CLEARANCE])
      body(ROBOT_WIDTH, ROBOT_LENGTH, ROBOT_HEIGHT);
    translate([-ROBOT_WHEEL_BIG_WIDTH/2, ROBOT_WHEEL_BIG_RADIUS, ROBOT_WHEEL_BIG_RADIUS])
      bigwheel(ROBOT_WHEEL_BIG_WIDTH, ROBOT_WHEEL_BIG_RADIUS);
    translate([ROBOT_WIDTH - ROBOT_WHEEL_BIG_WIDTH/2, ROBOT_WHEEL_BIG_RADIUS, ROBOT_WHEEL_BIG_RADIUS])
      bigwheel(ROBOT_WHEEL_BIG_WIDTH, ROBOT_WHEEL_BIG_RADIUS);
    translate([2*A_WIDTH - A_WIDTH, ROBOT_LENGTH/1.25, A_RADIUS])
      smallwheel(A_WIDTH, A_RADIUS);
    translate([ROBOT_WIDTH - 2*A_WIDTH, ROBOT_LENGTH/1.25, A_RADIUS])
      smallwheel(A_WIDTH, A_RADIUS);
  }
}

module smallwheel(ROBOT_WHEEL_WIDTH, ROBOT_WHEEL_RADIUS) {
  color("gray")
    rotate([90, 0, 90])
    cylinder(h = ROBOT_WHEEL_WIDTH, r = ROBOT_WHEEL_RADIUS);
}

module bigwheel(ROBOT_WHEEL_WIDTH, ROBOT_WHEEL_RADIUS) {
  color("gray")
    rotate([90, 0, 90])
    cylinder(h = ROBOT_WHEEL_WIDTH, r = ROBOT_WHEEL_RADIUS);
}

module body(ROBOT_WIDTH, ROBOT_LENGTH, ROBOT_HEIGHT) {
  color("lightgrey")
    difference() {
      cube(size = [ROBOT_WIDTH, ROBOT_LENGTH, ROBOT_HEIGHT]);
      translate([0, ROBOT_WIDTH, ROBOT_HEIGHT])
        rotate([-25, 0, 0])
        translate([-.25*ROBOT_WIDTH, -.25*ROBOT_LENGTH, -.25*ROBOT_HEIGHT])
        cube(size = [1.5*ROBOT_WIDTH, 1.5*ROBOT_LENGTH, 1.5*ROBOT_HEIGHT]);
    }
}
