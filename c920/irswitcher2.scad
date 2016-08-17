module irswitcher() {
  width = 13.95;
  depth = 31.5;
  height = 1.85;

  width2 = 15.45;
  depth2 = 10.25;
  height2 = 4.95;
  color("red") translate([-width / 2, -13.35, 0]) {
    cube([width, depth, height]);
    translate([(width - width2) / 2, depth - depth2, 0]) cube([width2, depth2, height2]);
  }
}
