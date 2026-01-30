use <dimension.scad>;

DIMLINE_THICKNESS = 200;
WALL_THICKNESS = 200;
ROOM_HEIGHT = 2500;

KITCHEN_WIDTH = 2150;
KITCHEN_LENGTH = 3580;
KITCHEN_HEIGHT = ROOM_HEIGHT;

DOOR_WIDTH = 600;
DOOR_HEIGHT = 2000;

WINDOW_WIDTH = 970;
WINDOW_HEIGHT = 1000;

module kitchen() {
  module doorcut() {
    cube([DOOR_WIDTH, WALL_THICKNESS*3, DOOR_HEIGHT]);
  }
  module windowcut() {
    cube([WINDOW_WIDTH, WALL_THICKNESS*3, WINDOW_HEIGHT]);
  }
  module wall(length, height=ROOM_HEIGHT, offset=20, labelpos, withdim="true") {
    cube([length, WALL_THICKNESS, height]);
    if (withdim=="true") {
      overunder = labelpos == "below" ? -200 : WALL_THICKNESS + 200;
      translate([0, overunder, 0]) dimension(length=length, label=labelpos);
    }
  };
  // left wall
  translate([WALL_THICKNESS, WALL_THICKNESS, 0]) rotate([0, 0, 90]) wall(length=KITCHEN_LENGTH);
  // bottom wall
  translate([WALL_THICKNESS, 0, 0]) {
    difference() {
      wall(length=KITCHEN_WIDTH, labelpos="below");
      translate([650, -WALL_THICKNESS, 1000]) windowcut();
    }
  }
  // right wall
  translate([KITCHEN_WIDTH + WALL_THICKNESS*2, WALL_THICKNESS, 0]) rotate([0, 0, 90]) wall(length=KITCHEN_LENGTH, withdim="false");
  // top wall
  translate([WALL_THICKNESS, WALL_THICKNESS + KITCHEN_LENGTH, 0]) wall(length=KITCHEN_WIDTH, withdim="false");
}

kitchen();
