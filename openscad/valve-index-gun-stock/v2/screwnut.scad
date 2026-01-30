module screw() {
  screw_length = 12;
  screw_diameter = 3;
  screw_diameter2 = 5.7;
  screw_head_length = 1.65;
  cylinder(h=screw_length, d=screw_diameter);
  translate([0, 0, -screw_head_length]) cylinder(h=screw_head_length, d1=screw_diameter, d2=screw_diameter2);
}
module nut(hole=0) {
  nut_thickness=2.4;
  nut_width=5.5;
  nut_hole=3;
  difference() {
    cylinder($fn=6, h=nut_thickness, d=nut_width*1.1547);
    if (hole) {
      translate([0, 0, -1]) cylinder(h=nut_thickness+2, d=nut_hole);
    }
  }
}
