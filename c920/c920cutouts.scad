module c920cutouts() {
  $w = 79.7;
  $d = 22.3;
  $h = 1.1;
  $d1 = 3.4 * 0.8;
  $d3 = 2 * 2.0;
  $d4 = 1.6 * 0.7;
  $cutout_hole_d = 3.5;
  $dhole = 1.6;

  translate([-$w / 2, -$d / 2, -$h * 2]) {
    // top-left small notch cutout
    translate([9.26, $d, 0]) hull() {
      translate([0, 3, 0]) cylinder(d = $d4, h = $h * 3);
      translate([0, -1.8, 0]) cylinder(d = $d4, h = $h * 3);
    }

    // top-right small notch cutout
    translate([$w - 9.26, $d, 0]) hull() {
      translate([0, 3, 0]) cylinder(d = $d4, h = $h * 3);
      translate([0, -1.8, 0]) cylinder(d = $d4, h = $h * 3);
    }

    //bottom-left big hole cutout
    translate([($w - 73.6) / 2 + 4.8, 0.9, 0]) hull() {
      cylinder(d = $d1, h = $h * 3);
      translate([0, -3.5, 0]) cylinder(d = $d1, h = $h * 3);
    }

    //bottom-right big hole cutout
    translate([$w - ($w - 73.6) / 2 - 4.8, 0.9, 0]) hull() {
      cylinder(d = $d1, h = $h * 3);
      translate([0, -3.5, 0]) cylinder(d = $d1, h = $h * 3);
    }

    // top-right small hole cutout
    translate([$w - ($w - 73.6) / 2 - 9.4, $d - 2, 0]) {
      difference() {
        cylinder(d = $d3, h = $h * 2);
        cylinder(d = $dhole, h = $h * 2.2);
      }
    }

    // bottom-left small hole cutout
    translate([($w - 73.6) / 2 + 9.0, 0.9, 0])
      difference() {
        hull() {
          cylinder(d = $d3, h = $h * 2);
          translate([0, -3.2, 0]) cylinder(d = $d3, h = $h * 2);
        }
        cylinder(d = $dhole, h = $h * 2.2);
      }

    // bottom-right small hole cutout
    translate([$w - ($w - 73.6) / 2 - 9.4, 0.9, 0])
      difference() {
        hull() {
          cylinder(d = $d3, h = $h * 2);
          translate([0, -3.2, 0]) cylinder(d = $d3, h = $h * 2);
        }
        cylinder(d = $dhole, h = $h * 2.2);
      }
  }
}
