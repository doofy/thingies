$fn=256;

module yicambase(height1=2, diameter1=80, ) {
  height2=6.5;
  diameter2a=diameter1;
  diameter2b=34;
  cylinder(h=height1, d=diameter1);
  translate([0, 0, height1 - 0.001]) cylinder(h=height2, d1=diameter2a, d2=diameter2b);
}


module yicamwallmount() {
  wallthickness=3.5;
  baseholeheight=3;
  mountheight=4;
  difference() {
    yicambase(height1=2+2*wallthickness, diameter1=80+2*wallthickness);
    translate([0, 0, wallthickness]) yicambase(height1=baseholeheight, diameter1=83);
    translate([-50, 10, -10]) cube([100, 100, 100]);
    translate([-50, -50, -10]) cube([100, 20, 100]);
    translate([-5, -31, 5]) cube([10, 10, 10]);
    translate([0, 0, 4]) cylinder(h=20, d=75);
    translate([0, -5, 0]) {
      translate([17, 0, 0]) {
        translate([0, 0, -10]) cylinder(h=20, d=5.5);
        translate([0, 0, 1]) cylinder(h=10, d=10);
      }
      translate([-17, 0, 0]) {
        translate([0, 0, -10]) cylinder(h=20, d=5.5);
        translate([0, 0, 1]) cylinder(h=10, d=10);
      }
    }
    mirror(v=[0, 0, 0]) {
      holes();
    }
    mirror(v=[1, 0, 0]) {
      holes();
    }
  }
}

module holes() {
  holes1();
  translate([0, -3, 0]) holes1();
  translate([0, -6, 0]) holes1();
  translate([0, -16, 0]) holes1();
  translate([0, -19, 0]) holes1();
  translate([0, -22, 0]) holes1();
  translate([0, -25, 0]) holes1();
  translate([0, -28, 0]) holes1();
  translate([0, -31, 0]) holes1();
}

module holes1() {
  translate([4*(-10 - 1), 5, -1]) cube([10, 2, 5]);
  translate([3*(-10 - 1), 5, -1]) cube([10, 2, 5]);
  translate([2*(-10 - 1), 5, -1]) cube([10, 2, 5]);
  translate([-10 - 1, 5, -1]) cube([10, 2, 5]);
}

yicamwallmount();
//translate([0, 0, 3.5]) yicambase();

