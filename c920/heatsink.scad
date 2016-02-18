$width = 39.3;
$depth = 13.0;
$height = 0.5;
$hole = 1.3;

difference() {
  cube([$width, $depth, $height]);
  translate([3, 1, 0]) cube([7, 7, 1.1]);
  translate([1.5, 1.5, -$height]) cylinder(d = $hole, h = 3 * $height);
  translate([1.5, $depth - 1.5, -$height]) cylinder(d = $hole, h = 3 * $height);
  translate([16.7, 1.5, -$height]) cylinder(d = $hole, h = 3 * $height);
  translate([16.7, $depth - 1.5, -$height]) cylinder(d = $hole, h = 3 * $height);
  translate([$width - 1.5, 1.5, -$height]) cylinder(d = $hole, h = 3 * $height);
  translate([$width - 1.5, $depth - 1.5, -$height]) cylinder(d = $hole, h = 3 * $height);
}
translate([3, 1, -1.1]) cube([7, 7, 1.1]);
