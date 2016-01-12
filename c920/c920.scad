module c920() {
  $w = 79.7;
  $d = 22.3;
  $h = 1.1;
  $r1 = 1;
  $d1 = 3.4;
  $d2 = 3;

  $sensor_w = 6.6;
  $sensor_d = 6.3;
  $sensor_h = 0.8;

  translate([-$w / 2, -$d / 2, 0]) {
    color("green") difference() {
      cube([$w, $d, $h]);
      //top-left corner cutout
      translate([-$r1, -$r1, $h * -1]) minkowski() {
        cylinder(r = $r1, h = $h * 2);
        cube([($w - 73.6) / 2, ($d - 11.0) / 2, $h * 1]);
      }
      //bottom-left corner cutout
      translate([-$r1, $r1 + ($d - 11.0) / 2 + 11.0, $h * -1]) minkowski() {
        cylinder(r = $r1, h = $h * 2);
        cube([($w - 73.6) / 2, ($d - 11.0) / 2, $h * 1]);
      }
      //top-right corner cutout
      translate([$w - ($w - 73.6) / 2 + $r1, -$r1, $h * -1]) minkowski() {
        cylinder(r = $r1, h = $h * 2);
        cube([($w - 73.6) / 2, ($d - 11.0) / 2, $h * 1]);
      }
      //bottom-right corner cutout
      translate([$w - ($w - 73.6) / 2 + $r1, $r1 + ($d - 11.0) / 2 + 11.0, $h * -1]) minkowski() {
        cylinder(r = $r1, h = $h * 2);
        cube([($w - 73.6) / 2, ($d - 11.0) / 2, $h * 1]);
      }
      //bottom-left big hole cutout
      translate([($w - 73.6) / 2 + 3.1 + $d1 / 2, 0.9, $h * -1]) hull() {
        cylinder(d = $d1, h = $h * 3);
        translate([0, -2, 0]) cylinder(d = $d1, h = $h * 3);
      }
      //bottom-right big hole cutout
      translate([$w - ($w - 73.6) / 2 - 3.1 - $d1 / 2, 0.9, $h * -1]) hull() {
        cylinder(d = $d1, h = $h * 3);
        translate([0, -2, 0]) cylinder(d = $d1, h = $h * 3);
      }
      // left sensor hole
      translate([31.5, $d / 2, $h * -1]) cylinder(d = $d2, h = $h * 3);
      // right sensor hole
      translate([$w - 31.5, $d / 2, $h * -1]) cylinder(d = $d2, h = $h * 3);
      // bottom cutout
      translate([$w / 2 - 50 / 2, 0, $h * -1]) linear_extrude(height = $h * 3) offset(r=1) hull() {
        translate([(50 - 46.7 + 1.5) / 2, 1, 0]) square(size = [46.7 - 1.5, 3.8 - 2]);
        translate([1, -2.0, 0]) square(size = [50.0 - 2, 0.5 * 4]);
      }
    }


    // speakers
    color("silver") {
      translate([($w - 73.6) / 2 - 0.5, $d / 2, $h]) cylinder(d = 6.5, h = 5.5);
      translate([$w - ($w - 73.6) / 2 + 0.5, $d / 2, $h]) cylinder(d = 6.5, h = 5.5);
    }

    translate([$w / 2 - $sensor_w / 2, $d - 18.5 + 4.4, $h]) cube([$sensor_w, $sensor_d, $sensor_h]);
  }
}
