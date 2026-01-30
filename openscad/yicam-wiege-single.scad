$fn=150;

BRETT_THICKNESS = 10;
BRETT_WIDTH = 49;
module brett() {
  translate([0, -BRETT_WIDTH/2, 0]) cube([300, BRETT_WIDTH, BRETT_THICKNESS]); // Wiege Brett
}

RING_THICKNESS = 2.5;
RING_OUTER = 58;
module adapter() {
  module adapter_notch() {
    CLIP_BASE_WIDTH = 15;
    CLIP_BASE_THICKNESS = RING_THICKNESS*2;
    CLIP_BASE_HEIGHT = 5;
    translate([-CLIP_BASE_WIDTH/2, -RING_OUTER/2-CLIP_BASE_HEIGHT/2, -CLIP_BASE_THICKNESS/2])
      cube([CLIP_BASE_WIDTH, CLIP_BASE_HEIGHT, CLIP_BASE_THICKNESS]);
  }
  YICAM_SPACE = 12.5;
  translate([0, 0, -YICAM_SPACE]) //Platz zwischen Adapter und Brett für yicam Gehäuse
    translate([RING_OUTER/2, 0, -2.5]) {

      difference() {
        cylinder(h=RING_THICKNESS, d=RING_OUTER);
        translate([0, 0, -RING_THICKNESS]) cylinder(h=7.5, d=46);
      }

mirror([0, 1, 0]) adapter_notch();
adapter_notch();
    }
}

CLIP_THICKNESS = 2.5;
CLIP_WIDTH = 8;
module clip() {
  module hook() {
    cube([CLIP_WIDTH, CLIP_THICKNESS, BRETT_THICKNESS]);
    translate([0, -(RING_OUTER/2-BRETT_WIDTH/2), 0]) {
      translate([0, 0, BRETT_THICKNESS]) cube([CLIP_WIDTH, CLIP_THICKNESS, CLIP_SPACE+RING_THICKNESS*2]);
      translate([0, CLIP_THICKNESS, BRETT_THICKNESS]) cube([CLIP_WIDTH, RING_OUTER/2-BRETT_WIDTH/2, CLIP_THICKNESS]);
      translate([0, 0, CLIP_SPACE+BRETT_THICKNESS+RING_THICKNESS*2]) cube([CLIP_WIDTH, CLIP_THICKNESS*2, CLIP_THICKNESS]);
    }
  }
  CLIP_HEIGHT = BRETT_WIDTH+2*CLIP_THICKNESS;
  CLIP_SPACE = 12.5;
  cube([CLIP_WIDTH, CLIP_HEIGHT, CLIP_THICKNESS]);
  translate([0, 0, CLIP_THICKNESS]) {
    translate([0, CLIP_HEIGHT, 0]) mirror([0, 1, 0]) hook();
    hook();
  }
}

translate([RING_OUTER/2+CLIP_WIDTH/2, -BRETT_WIDTH/2-CLIP_THICKNESS, BRETT_THICKNESS+CLIP_THICKNESS]) rotate([0, 90, 0]) scale([0.99, 1.01, 1.01]) clip();

//brett();

/**
difference() {
adapter();
scale([1.01, 1.01, 1.01]) translate([RING_OUTER/2+CLIP_WIDTH/2, -BRETT_WIDTH/2-CLIP_THICKNESS, BRETT_THICKNESS+CLIP_THICKNESS]) rotate([0, 180, 0]) clip();
translate([RING_OUTER/2+CLIP_WIDTH/2, -BRETT_WIDTH/2-CLIP_THICKNESS, BRETT_THICKNESS+CLIP_THICKNESS]) rotate([0, 180, 0]) clip();
}
**/
