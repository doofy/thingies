$fn = 10;
difference() {
  union() {
    difference() {
      difference() {
        cube([32, 35, 11]);
        translate([0, 35, -5]) rotate([0,0,-11.5]) cube([35, 20, 20]);
      }
      translate([32 / 2 - 21.4 / 2, 1.8, 1.6]) difference() {
        cube([21.4, 29, 11 + 1]);
        translate([0, 29, -5]) rotate([0,0,-10.5]) cube([25, 20, 20]);
      }
    }
    $h = 5.5;
    $d = 4;
    $d2 = 1;
    translate([32 / 2 - 5, 10, 0]) difference() {
      cylinder(h = $h, d = $d);
      translate([0, 0, 3]) cylinder(h = $h, d = $d2);
    }
    translate([32 / 2 + 5, 10, 0]) difference() {
      cylinder(h = $h, d = $d);
      translate([0, 0, 3]) cylinder(h = $h, d = $d2);
    }
    translate([32 / 2 + 5, 10 + 10, 0]) difference() {
      cylinder(h = $h, d = $d);
      translate([0, 0, 3]) cylinder(h = $h, d = $d2);
    }
    translate([32 / 2 - 5 + 1, 10 + 14, 0]) difference() {
      cylinder(h = $h, d = $d);
      translate([0, 0, 3]) cylinder(h = $h, d = $d2);
    }

    translate([32 / 2 - 5.5, 11, 0]) rotate([0,0,-3]) cube([1.5, 12, $h]);
    translate([32 / 2 + 4.25, 11, 0]) cube([1.5, 8, $h]);
    translate([32 / 2 - 4, 9.5, 0]) cube([8, 1.5, $h]);
    translate([32 / 2 - 3.5, 23, 0]) rotate([0,0,-25]) cube([8, 1.5, $h]);
  }
  translate([32 / 2 - 17 / 2, 35 - 10, 5.5 + 1]) cube([17, 20, 1.3 + 5]);
  translate([32 / 2, -5, 6.5]) rotate([-90, 0, 0]) hull() {
    cylinder(d = 6.5, 10);
    translate([0, -5, 0]) cylinder(d = 6.5, 10);
  }
  translate([32 / 2, -5, 6.5]) rotate([-90, 0, 0]) cylinder(d = 4, h = 45);
}

