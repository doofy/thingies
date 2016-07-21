module irswitcher() {
  translate([-17 / 2, -16.8 / 2, 0]) {
    difference() {
      intersection() {
        difference() {
          cube([17, 22, 5.6]);
          translate([1.3, 1.3, -0.5]) cube([14, 14, 3]);
          translate([-1, 16.8, -1]) cube([17 + 2, 10, 1.7 + 1]);
          translate([-1, 16.8 + 1.5, -1]) cube([17 + 2, 10, 1.7 + 1 + 1]);
        }
        translate([17/2, 22 - 11.5, 0]) hull() {
          translate([0, 0, -2.5]) cylinder(d = 23, h = 10);
          translate([0, -10, -2.5]) cylinder(d = 23, h = 10);
        }
      }
      translate([17 / 2, 16.8 / 2, -2]) {
        hull() {
          translate([-4 + 2, -4 + 2, 0])  cylinder(r = 2, h= 20);
          translate([+4 - 2, -4 + 2, 0])  cylinder(r = 2, h= 20);
          translate([-4 + 2, +4 - 2, 0])  cylinder(r = 2, h= 20);
          translate([+4 - 2, +4 - 2, 0])  cylinder(r = 2, h= 20);
        }
      }
    }
    translate([-3.25 + (3.4 / 2), 16.8 / 2, 0]) difference() {
      cylinder(d = 3.4, h = 5.6);
      translate([0, 0, -0.1]) cylinder(d = 1.0, h = 6.6);
    }
    translate([16.8 + 3.25 - (3.4 / 2), 16.8 / 2, 0]) difference() {
      cylinder(d = 3.4, h = 5.6);
      translate([0, 0, -0.1]) cylinder(d = 1.0, h = 6.6);
    }
    translate([17 / 2, 16.8 / 2, 5.6]) difference() {
      cylinder(d = 16, h = 12 - 5.6);
      translate([0, 0, - 0.5]) cylinder(d = 12.5, h = 12 - 5.6 + 1);
    }

    translate([17 / 2 - 15.2 / 2, -12, 3.9]) cube([15.2, 12, 5]);
  }
}
irswitcher();
