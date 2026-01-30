$fn=128;
bb_width = 46.25;
bb_height = 11.1;
bb_depth = 28.4;

translate([0, 0, bb_depth]) cube([bb_width, 3.4, 47]);
translate([0, 0, bb_depth + 47]) cube([bb_width, 3.4, 47]);

// basic structure
difference() {
  cube([bb_width, bb_height, bb_depth]);
  translate([0, 4, 3]) translate([-1, 0, 0]) cube([bb_width + 2, 3.4, bb_depth]);
  translate([0, 4 + 3.4 - 1, 11]) translate([-1, 0, 0]) cube([bb_width + 2, 10, bb_depth]);
}

//angled piece
translate([0, 4 + 3.4, 11]) rotate([-45, 0, 0]) {
  myd=5;
  difference() {
    hull() {
      cube([bb_width, 3.7, 9.6-myd]);
      translate([myd / 2, 0, 9.6 - (myd / 2)]) rotate([-90, 0, 0]) cylinder(h=3.7, d=myd);
      translate([bb_width - (myd / 2), 0, 9.6 - (myd / 2)]) rotate([-90, 0, 0]) cylinder(h=3.7, d=myd);
    }
    translate([bb_width / 2, -1, 9.6+myd/2]) rotate([-90, 0, 0]) cylinder(h=3.7+2, d=2*myd);
  }
}

//three stegs
translate([1, 0, 0]) steg();
translate([bb_width - 1.4 - 1, 0, 0]) steg();
translate([(bb_width / 2) - (1.4 / 2), 0, 0]) steg();
module steg() {
  difference() {
    translate([0, 0, 3]) cube([1.4, 10, 9.5]);
    translate([-1, 3.4 + 1.5, 4]) cube([3.4, 10, 11]);
    translate([-1, 3.4 + 1.5, 9]) rotate([15, 0, 0]) cube([3.4, 10, 11]);
  }
}