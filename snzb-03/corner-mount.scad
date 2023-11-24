include <snzb-03.scad>;

$WALLS = 1.5;
$DELTA = 0.1;
$2DELTA = 2 * $DELTA;

  $WIDTH = 40;
  $WIDTH_ADAPTER = $WIDTH + 2 * $WALLS;
  $HEIGHT = 35;
  $HEIGHT_ADAPTER = $HEIGHT + 2 * $WALLS;
  $DEPTH = 16;
  $DEPTH_ADAPTER = $WALLS * 3;

module plate() {

  difference() {
    // base cube
    cube([$WIDTH_ADAPTER, $HEIGHT_ADAPTER, $DEPTH_ADAPTER]);
    // cutouts
    // big hole
    translate([$WALLS + 0.5 - $DELTA, $WALLS + 0.5 - $DELTA, $WALLS]) cube([$WIDTH - 2 * 0.5 + $2DELTA, 1.5 * $HEIGHT, $DEPTH]);
    // slot
    translate([$WALLS - $DELTA, $WALLS, $WALLS]) cube([$WIDTH + $2DELTA, 1.5 * $HEIGHT, $WALLS + $2DELTA]);
    // cut corner
    translate([$WALLS + 3, $WALLS + 3, 0]) translate([-20, -20, $WALLS]) cube([20, 20, $DEPTH * 2]);
    translate([$WIDTH - $WALLS, $HEIGHT - $WALLS, 0]) translate([0, 0, $WALLS]) cube([20, 20, $DEPTH * 2]);
    // cut corner
    translate([-2, -2, $DEPTH * 0.5]) rotate([0, 0, 45]) cube([10, 10, $DEPTH * 2], center = true);
    translate([$WIDTH + 2 * $WALLS, $HEIGHT + 2 * $WALLS, 0])
      translate([2, 2, $DEPTH * 0.5]) rotate([0, 0, 45]) cube([10, 10, $DEPTH * 2], center = true);
  }
// stopper
  translate([$WIDTH_ADAPTER / 4, $HEIGHT_ADAPTER - $WALLS / 2, $WALLS]) rotate([0, 90, 0]) cylinder(h = $HEIGHT_ADAPTER / 2, d = 1);
// catch plate
translate([-$WALLS, $WALLS * 4, 0]) cube([$WIDTH_ADAPTER + $WALLS * 2, $HEIGHT_ADAPTER - $WALLS * 8, $WALLS - $DELTA]);
}

//plate();
//color("red") translate([$WALLS, $WALLS, $WALLS]) snzb03();


$flange_length = $HEIGHT_ADAPTER - $WALLS * 8;
module holder() {
  $angle_x = 45;
  $holder_depth = 20;
  $holder_height = $flange_length + $WALLS * 2;
  $holder_width = $WIDTH_ADAPTER + $WALLS * 2;
  $offset_x = sin($angle_x) * $holder_depth;
  $offset_z = sin($angle_x) * $WALLS;
  $flange_offset_x = cos($angle_x) * $WALLS;
  $flange_offset_z = sin($angle_x) * $holder_depth;
  //flange dummy
  color("red") translate([$flange_offset_x, $WALLS, $flange_offset_z]) cube([$WIDTH_ADAPTER + $WALLS * 2, $flange_length, $WALLS - $DELTA]);
  //left
  translate([$offset_x, 0, 0]) rotate(-$angle_x, [0, 1, 0]) cube([$WALLS, $holder_height, $holder_depth]);
  //right
  translate([$holder_width + $WALLS - $offset_x, 0, $offset_z]) rotate($angle_x, [0, 1, 0]) cube([$WALLS, $holder_height, $holder_depth]);
  //bottom
  translate([$offset_x, 0, -$WALLS]) cube([$holder_width, $holder_height, $WALLS]);
}
holder();
