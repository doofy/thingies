module ikea() {
  boardthickness = 16;
  demolength = 100;
  demoheight = 50;
  translate([-demolength-boardthickness, 0, -demoheight-boardthickness-7]) {
    translate([0, 6, 0]) cube([demolength, boardthickness, 56]);
    translate([demolength-1, 0, 0]) cube([16+1, demolength, 56 + boardthickness + 1]);
    translate([0, 1, 56]) cube([demolength, demolength, boardthickness]);
    translate([demolength + boardthickness, 26, 56 + boardthickness - 10]) rotate([0, 90, 0]) cylinder(d=7, h=0.5);
  }
}

