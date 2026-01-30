DOOR_TYPE=2;
DOOR_OPEN_PERCENT=100;

use <dimlines.scad>;

use <husqvarna.scad>;

translate([EDGESTONE_WIDTH + COLUMN_WIDTH + 150, -150, 0]) automower_305();

include <motor.scad>;

if(DOOR_TYPE==1) translate([EDGESTONE_WIDTH + COLUMN_WIDTH + 45, EDGESTONE_WIDTH + COLUMN_WIDTH + COLUMN_WIDTH/1.2, BOARD_HEIGHT * 2 + 250]) rotate([180, 0, -90]) motor();
if(DOOR_TYPE==2) {
  translate([120,
      285,
      BOARD_HEIGHT * 2 - 50])
    rotate([0, -90, 90])
    motor();
}

//sample_dimensions();

EDGESTONE_WIDTH = 30;
EDGESTONE_HEIGHT = 150;

BOARD_WIDTH = 5;
BOARD_HEIGHT = 200;

SQUARE_TILE_WIDTH = 300;
SQUARE_TILE_HEIGHT = 30;

HEXA_TILE_WIDTH = 200;
HEXA_TILE_HEIGHT = 50;
HEXA_TILE_COUNT = 2;

COLUMN_WIDTH = 50;
DISTANCE_BETWEEN_COLUMNS = 750;

module schuppen() {
  translate([EDGESTONE_WIDTH, EDGESTONE_WIDTH, 0]) {
    column();
    translate([DISTANCE_BETWEEN_COLUMNS, 0, 0]) column();
  }

  translate([0, 0, -100]) {
    translate([EDGESTONE_WIDTH, 0, 0]) edgestone();
    translate([EDGESTONE_WIDTH, 0, 0]) rotate([0, 0, 90]) edgestone();
  }

  translate([EDGESTONE_WIDTH, EDGESTONE_WIDTH-BOARD_WIDTH, EDGESTONE_HEIGHT-100]) {
    rotate([0, 0, 90]) boards();
    translate([0, 0, BOARD_HEIGHT * 2]) boards();
    translate([0, 0, BOARD_HEIGHT*2]) rotate([-90*DOOR_OPEN_PERCENT/100, 0, 0]) door();
  };

  translate([EDGESTONE_WIDTH, EDGESTONE_WIDTH, 0]) squaretiles();

  mirror([0, 1, 0]) hexatiles(HEXA_TILE_COUNT);

  translate([0, -HEXA_TILE_COUNT*HEXA_TILE_WIDTH, -EDGESTONE_HEIGHT]) edgestone();
}
module column() {
  color("chocolate") cube([COLUMN_WIDTH, COLUMN_WIDTH, 2000]);
}
module edgestone(length=DISTANCE_BETWEEN_COLUMNS + COLUMN_WIDTH) {
  color("silver") cube([length, EDGESTONE_WIDTH, EDGESTONE_HEIGHT]);
}
module boards(count=6) {
  for(i = [0 : count-1]) {
    translate([0, 0, i * BOARD_HEIGHT]) board();
  }
}
module board(length=DISTANCE_BETWEEN_COLUMNS + COLUMN_WIDTH) {
  color("saddlebrown") cube([length, BOARD_WIDTH, BOARD_HEIGHT-2]);
}
module squaretiles(count=2) {
  for(i = [0 : count]) {
    for(j = [0 : count]) {
      translate([i * SQUARE_TILE_WIDTH, j * SQUARE_TILE_WIDTH, 0]) squaretile();
    }
  }
}
module squaretile() {
  color("wheat") translate([0, 0, -SQUARE_TILE_HEIGHT]) cube([SQUARE_TILE_WIDTH, SQUARE_TILE_WIDTH, SQUARE_TILE_HEIGHT]);
}
module hexatiles(count=2) {
  function oddoffset(i) = i%2 == 0 ? 0 : HEXA_TILE_WIDTH*0.75;
  for(i = [0 : count]) {
    for(j = [0 : count]) {
      translate([HEXA_TILE_WIDTH/2, HEXA_TILE_WIDTH/2, -1]) {
        translate([i * HEXA_TILE_WIDTH*1.5 + oddoffset(j), j * HEXA_TILE_WIDTH*0.45, 0]) hexatile();
        if (j == 0) translate([i * HEXA_TILE_WIDTH*1.5 + oddoffset(j+1), (j-1) * HEXA_TILE_WIDTH*0.45, 0]) hexatileupper();
        if (j == count) translate([i * HEXA_TILE_WIDTH*1.5 + oddoffset(j+1), (j+1) * HEXA_TILE_WIDTH*0.45, 0]) hexatilelower();
      }
    }
  }
}
module hexatile() {
  color("rosybrown") translate([0, 0, -HEXA_TILE_HEIGHT]) cylinder($fn=6, h=HEXA_TILE_HEIGHT, d=HEXA_TILE_WIDTH);
}
module hexatileupper() {
  color("rosybrown") translate([0, 0, -HEXA_TILE_HEIGHT]) difference() {
    cylinder($fn=6, h=HEXA_TILE_HEIGHT, d=HEXA_TILE_WIDTH);
    translate([0, -HEXA_TILE_WIDTH/2, HEXA_TILE_HEIGHT/2]) cube([HEXA_TILE_WIDTH, HEXA_TILE_WIDTH, HEXA_TILE_HEIGHT*1.1], center=true);
  }
}
module hexatilelower() {
  color("rosybrown") translate([0, 0, -HEXA_TILE_HEIGHT]) difference() {
    cylinder($fn=6, h=HEXA_TILE_HEIGHT, d=HEXA_TILE_WIDTH);
    translate([0, HEXA_TILE_WIDTH/2, HEXA_TILE_HEIGHT/2]) cube([HEXA_TILE_WIDTH, HEXA_TILE_WIDTH, HEXA_TILE_HEIGHT*1.1], center=true);
  }
}

module door(count=2) {
  translate([0, 0, -BOARD_HEIGHT*count]) {
    boards(count);
    BOARD_LENGTH=DISTANCE_BETWEEN_COLUMNS + COLUMN_WIDTH;
    DOOR_METAL_DISTANCE_FROM_RIM=30;
    DOOR_LENGTH=BOARD_LENGTH - 2*DOOR_METAL_DISTANCE_FROM_RIM - COLUMN_WIDTH*2;
    DOOR_DEPTH=5;
    DOOR_HEIGHT=count*BOARD_HEIGHT-2*DOOR_METAL_DISTANCE_FROM_RIM;
    DOOR_METAL_WIDTH=30;
    color("darkorange") {
      translate([(BOARD_LENGTH - DOOR_LENGTH) / 2, BOARD_WIDTH+1, (2 * BOARD_HEIGHT - DOOR_HEIGHT) - DOOR_METAL_DISTANCE_FROM_RIM]) {
        difference() {
          cube([DOOR_LENGTH, DOOR_DEPTH, DOOR_HEIGHT]);
          translate([DOOR_METAL_WIDTH/2, -DOOR_DEPTH*2, DOOR_METAL_WIDTH/2]) cube([DOOR_LENGTH - DOOR_METAL_WIDTH, DOOR_DEPTH*6, DOOR_HEIGHT - DOOR_METAL_WIDTH]);
        }
        if(DOOR_TYPE==1) translate([DOOR_METAL_WIDTH/3, 30, 250]) rotate([0, -63, 90]) cube([200, 5, DOOR_METAL_WIDTH]);
        if(DOOR_TYPE==2) translate([DOOR_METAL_WIDTH/3, 0, 310]) rotate([0, 0, 90]) cube([50, 5, DOOR_METAL_WIDTH]);
      }
    }
  }
}

schuppen();

