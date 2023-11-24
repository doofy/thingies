$fn = 100;

module snzb03() {
  $WIDTH = 40;
  $HEIGHT = 35;
  $DEPTH = 16;
  $DIAMETER_DOME = 22;
  $DIAMETER_HOLE = 1;
  $DEPTH_RECESS = 0.5;

  // dome
  translate([$WIDTH / 2, $HEIGHT / 2, $DEPTH]) rotate([0, 90, 0]) sphere(d = $DIAMETER_DOME, $fn = 32);
  difference() {
    // main body
    cube([$WIDTH, $HEIGHT, $DEPTH]);

    // hole
    translate([$WIDTH / 2, 5, 9]) rotate([90, 0, 0]) cylinder(h = 10, d = $DIAMETER_HOLE);

    // cut corners
    translate([-2.75, -2.75, $DEPTH]) rotate([0, 0, 45]) cube([10, 10, $DEPTH * 2], center = true);
    translate([$WIDTH, $HEIGHT, 0]) translate([2.75, 2.75, $DEPTH]) rotate([0, 0, 45]) cube([10, 10, $DEPTH * 2], center = true);

    // recesses
    translate([2.5, -1, 1.5]) cube([$WIDTH, $DEPTH_RECESS + 1, 13.5]);
    translate([$WIDTH - $DEPTH_RECESS, $HEIGHT - 2.5, 1.5]) rotate([0, 0, -90]) cube([$WIDTH, $DEPTH_RECESS + 1, 13.5]);
    translate([-2.5, $HEIGHT - 1, 1.5]) cube([$WIDTH, $DEPTH_RECESS + 1, 13.5]);
    translate([$DEPTH_RECESS, 2.5, 1.5]) rotate([0, 0, 90]) cube([$WIDTH, $DEPTH_RECESS + 1, 13.5]);
  }
}
