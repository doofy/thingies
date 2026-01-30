module couchtisch() {
  boardthickness = 16;
  demolength = 100;
  demoheight = 50;
  translate([-demolength, 0, -demoheight-boardthickness]) {
    translate([0, 0, demoheight-1]) cube([demolength, demolength, boardthickness+1]);
    translate([demolength - boardthickness - 1, 1, 0]) cube([boardthickness, demolength, demoheight]);
  }
}
