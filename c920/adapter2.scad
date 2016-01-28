//$fn = 100;

$holeoutter = 5; //outside diameter of holding things for screws
$hole = 1.6; // bore for original c920 screws
$holeheight = 3.8 - 1.1 + 3; // thread length - board thickness + safety space
$mountheight = $holeheight + 2; // height of mounting poles
$inner = 12.5; // inner diameter fitting M12 lenses
$outer = $inner + 2; // thickness of adapter wall
$baseheight = 16;
$holeoffset = 8.2; // for original c920 board holes

difference() {
  union() {
    // base
    hull() {
      cylinder(d = $outer, h = $baseheight);
      translate([0, 0, 16 - 2.5 * 2]) cylinder(d = 15 + 3, h = 2.5 * 2);
    }
    // left mounting pole
    hull() {
      translate([-$holeoffset, 0, 0]) cylinder(d1 = $holeoutter, d2 = $holeoutter + 5, h = $mountheight);
      translate([0, 0, 0]) cylinder(d = $holeoutter * 2, h = $mountheight);
    }
    // right mounting pole
    hull() {
      translate([$holeoffset, 0, 0]) cylinder(d1 = $holeoutter, d2 = $holeoutter + 5, h = $mountheight);
      translate([0, 0, 0]) cylinder(d = $holeoutter * 2, h = $mountheight);
    }
  }
  // left mounting pole hole
  translate([-$holeoffset, 0, 0]) cylinder(d = $hole, h = $holeheight);
  // right mounting pole hole
  translate([$holeoffset, 0, 0]) cylinder(d = $hole, h = $holeheight);
  // base hole
  translate([0, 0, -$baseheight]) cylinder(d = $inner, h = $baseheight * 3);
  // cutout for screw ring
  translate([0, 0, 16 - 2.5]) difference() {
    cylinder(d = 15.2 + 0.2, h = 10);
    translate([15 / 2 - 0.4, -15 / 2, -5]) cube([5, 16, 20]);
    translate([-15 / 2 + 0.4 - 5, -15 / 2, -5]) cube([5, 16, 20]);
  }
  // cutout for ir module
  translate([0, -21/2 + 14, 2]) translate([0, 0, 1.9 / 2]) {
    cube([13.9 + 0.3, 21 + 2, 1.9 + 0.3], center = true);
    translate([0, -(31.5 - 21) / 2 - 21 / 2, 6 / 2 - (1.9 + 0.3) / 2]) cube([17.9, 31.5 - 21, 6], center = true);
  }
}
