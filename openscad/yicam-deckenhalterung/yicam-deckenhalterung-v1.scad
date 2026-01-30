$fn=256;

module yicambase(height1=2, diameter1=80, ) {
  height2=6.5;
  diameter2a=diameter1;
  diameter2b=34;
  cylinder(h=height1, d=diameter1);
  translate([0, 0, height1 - 0.001]) cylinder(h=height2, d1=diameter2a, d2=diameter2b);
}


module yicamwallmount() {
  wallthickness=2;
  baseholeheight=2.2;
  mountheight=4;
  difference() {
    yicambase(height1=2+2*wallthickness, diameter1=80+2*wallthickness);
    translate([0, 0, wallthickness]) yicambase(height1=baseholeheight, diameter1=82);
    translate([-50, 10, -10]) cube([100, 100, 100]);
    translate([-50, -50, -10]) cube([100, 20, 100]);
    translate([-5, -31, 5]) cube([10, 10, 10]);
    translate([0, 0, 4]) cylinder(h=10, d=45);
    translate([0, -5, 0]) {
      translate([17, 0, 0]) {
        translate([0, 0, -10]) cylinder(h=20, d=4);
        translate([0, 0, 1]) cylinder(h=10, d=8);
      }
      translate([-17, 0, 0]) {
        translate([0, 0, -10]) cylinder(h=20, d=4);
        translate([0, 0, 1]) cylinder(h=10, d=8);
      }
    }
  }
}
yicamwallmount();
translate([0, 0, 2]) yicambase();

