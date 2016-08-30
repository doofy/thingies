module heatsinkcutouts() {
  $sizeoffset = 2;
  $width = 39.3+0.2;
  $depth = 13.0+0.2;
  $height = 2.5;
  $hole = 1.3 * 0.5;

  translate([-3 -3.5-0.1, -$depth + 1 + 3.5+0.1, -1.6]) {
    difference() {
        translate([-$sizeoffset / 2, -$sizeoffset / 2, -2]) cube([$width + $sizeoffset, $depth + $sizeoffset, $height]);
        translate([0, 0, -3]) cube([$width, $depth, $height+2]);
    }
  }
}
