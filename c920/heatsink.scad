module heatsink() {
  $width = 39.3;
  $depth = 13.0;
  $height = 0.5;
  $hole = 1.3;

  translate([-3 -3.5, -$depth + 1 + 3.5, -1.6]) {
    difference() {
      cube([$width, $depth, $height]);
      translate([3, $depth - 1 -7, -0.1]) cube([7, 7, 1.1]);
      translate([1.5, 1.5, -$height]) cylinder(d = $hole, h = 3 * $height);
      translate([1.5, $depth - 1.5, -$height]) cylinder(d = $hole, h = 3 * $height);
      translate([16.7, 1.5, -$height]) cylinder(d = $hole, h = 3 * $height);
      translate([16.7, $depth - 1.5, -$height]) cylinder(d = $hole, h = 3 * $height);
      translate([$width - 1.5, 1.5, -$height]) cylinder(d = $hole, h = 3 * $height);
      translate([$width - 1.5, $depth - 1.5, -$height]) cylinder(d = $hole, h = 3 * $height);
    }
    translate([3, $depth - 1 - 7, 0.5]) cube([7, 7, 1.1]);
  }
}
