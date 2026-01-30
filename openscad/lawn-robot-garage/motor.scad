module motor() {
  BASE_WIDTH = 39;
  BASE_HEIGHT = 30;
  BASE_LENGTH = 74;

  MOUNTING_LENGTH = 20;
  MOUNTING_D = BASE_WIDTH/1.5;
  MOUNTING_HOLE_D = 10;

  PUSHER_INNER_LENGTH = 222 - BASE_HEIGHT;
  PUSHER_INNER_D = BASE_WIDTH/1.5;
  PUSHER_OUTTER_LENGTH = PUSHER_INNER_LENGTH - MOUNTING_LENGTH;
  PUSHER_OUTTER_D = BASE_WIDTH;

  MOTOR_LENGTH = 106 - BASE_HEIGHT;
  MOTOR_D = BASE_WIDTH;

  color("lightgrey") {
    //BASE
    cube([BASE_LENGTH, BASE_WIDTH, BASE_HEIGHT]);

    //PUSHER
    translate([BASE_LENGTH - PUSHER_OUTTER_D / 2, PUSHER_OUTTER_D / 2, BASE_HEIGHT]) {
      cylinder(h = PUSHER_OUTTER_LENGTH, d = PUSHER_OUTTER_D);
      translate([0, 0, 100*DOOR_OPEN_PERCENT/100]) difference() {
        cylinder(h = PUSHER_INNER_LENGTH, d = PUSHER_INNER_D);
        translate([0, MOUNTING_LENGTH, PUSHER_INNER_LENGTH - 10]) rotate([90, 0, 0]) cylinder(h = MOUNTING_LENGTH*2, d = MOUNTING_HOLE_D);
      }
    }

    //MOTOR
    translate([MOTOR_D / 2, MOTOR_D / 2, BASE_HEIGHT])
      cylinder(h = MOTOR_LENGTH, d = MOTOR_D);

    //MOUNTING
    translate([BASE_LENGTH - PUSHER_OUTTER_D / 2, PUSHER_OUTTER_D / 2, -MOUNTING_LENGTH]) {
      difference() {
        cylinder(h = MOUNTING_LENGTH, d = MOUNTING_D);
        translate([0, MOUNTING_LENGTH, 10]) rotate([90, 0, 0]) cylinder(h = MOUNTING_LENGTH*2, d = MOUNTING_HOLE_D);
      }
    }
  }
}
