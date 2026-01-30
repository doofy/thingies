$fn=12;

mount_plate_side=31;
mount_plate_thickness=1;
mount_hole_distance=27;
screw_hole_d=3;
column_height=7;
column_screw_d1=2;
column_screw_d2=4;
column_distance1=12.5;
column_distance2=21;

module hole() {
  cylinder(d=screw_hole_d, h=3*mount_plate_thickness);
}

module column() {
  cylinder(d=column_screw_d2, h=column_height);
  translate([0, 0, column_height]) cylinder(d=column_screw_d1, h=2);
}

difference() {
  cube([mount_plate_side, mount_plate_side, mount_plate_thickness]);
  translate([2, 2, -mount_plate_thickness]) {
    hole();
    translate([mount_hole_distance, 0, 0]) hole();
    translate([0, mount_hole_distance, 0]) hole();
    translate([mount_hole_distance, mount_hole_distance, 0]) hole();
  }
}
translate([2+3, 5, mount_plate_thickness]) {
  column();
  translate([column_distance1, 0, 0]) column();
  translate([0, column_distance2, 0]) column();
  translate([column_distance1, column_distance2, 0]) column();
}
