module adapter() {
  $holeoutter = 5;
  $hole = 1.1;
  $holeheight = 3.8 - 1.1; //thread length - board thickness
  $holeoutterheight = $holeheight + 1; //holeheight
  $inner = 11;
  $outer = $inner + 3;
  $baseheight = $holeoutterheight;
  $holeoffset = 8.2;

  $topholeoffset = 9.95;

  difference() {
    union() {
      cylinder(d = $outer, h = $baseheight);
      translate([0, 0, $baseheight - 2]) {
        translate([-13.8 / 2, -14.1 / 2, 2]) cube([13.8, 14.1, 2]);
        difference() {
          hull() {
            translate([0, $topholeoffset, 0]) cylinder(d = 4.5, h = 2);
            translate([0, 0, 0]) cylinder(d = 4.5 * 3, h = 2);
          }
          translate([0, $topholeoffset, 0]) translate([0, 0, -2]) cylinder(d = 2.2, h = 2 * 3);
        }
        difference() {
          hull() {
            translate([0, -$topholeoffset, 0]) cylinder(d = 4.5, h = 2);
            translate([0, 0, 0]) cylinder(d = 4.5 * 3, h = 2);
          }
          translate([0, -$topholeoffset, 0]) translate([0, 0, -2]) cylinder(d = 2.2, h = 2 * 3);
        }
      }
      difference() {
        hull() {
          translate([-$holeoffset, 0, 0]) cylinder(d = $holeoutter, h = $holeoutterheight);
          translate([0, 0, 0]) cylinder(d = $holeoutter * 2, h = $holeoutterheight);
        }
        translate([-$holeoffset, 0, 0]) cylinder(d = $hole, h = $holeheight);
      }
      difference() {
        hull() {
          translate([$holeoffset, 0, 0]) cylinder(d = $holeoutter, h = $holeoutterheight);
          translate([0, 0, 0]) cylinder(d = $holeoutter * 2, h = $holeoutterheight);
        }
        translate([$holeoffset, 0, 0]) cylinder(d = $hole, h = $holeheight);
      }
    }
    translate([0, 0, -$baseheight]) cylinder(d = $inner, h = $baseheight * 3);
  }
}
