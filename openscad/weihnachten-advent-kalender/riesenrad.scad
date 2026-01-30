base_width=250;
base_length=500;
base_thickness=18;

wheel_outer_diameter=640;
wheel_outer_thickness=20;
wheel_outer_height1=25;
wheel_outer_height2=23;
wheel_inner_diameter1=70;
wheel_inner_diameter2=50;
wheel_inner_thickness1=110;
wheel_inner_thickness2=85;

cup_diameter=60;
cup_height=60;

module wheel(wheel_outer_height, wheel_inner_thickness, wheel_inner_diameter) {
  translate([0, 0, -wheel_outer_thickness/2]) difference() {
    cylinder(h=wheel_outer_thickness, d=wheel_outer_diameter);
    translate([0, 0, -1]) cylinder(h=wheel_outer_thickness+2, d=wheel_outer_diameter-wheel_outer_height);
  }
    translate([0, 0, -wheel_inner_thickness/2]) cylinder(h=wheel_inner_thickness, d=wheel_inner_diameter);
    color("red") translate([0, 0, -500]) cylinder(h=1000, d=10);
translate([wheel_outer_diameter/2-10, 0, base_thickness+20]) rotate([0, 90, 0]) cylinder(h=cup_height, d=cup_diameter);
}

translate([0, 0, wheel_outer_diameter/2 + base_thickness+cup_height+30]) rotate([0, 90, 0]) {
  wheel(wheel_outer_height1, wheel_inner_thickness1, wheel_inner_diameter1);
  //wheel(wheel_outer_height2, wheel_inner_thickness2, wheel_inner_diameter2);
}

bar_thickness=20;
bar_angle=70;
bar_length=500;
bar_margin=115;

module barsnbase(wheel_inner_thickness) {
  translate([-base_width/2, -base_length/2, 0]) {
    cube([base_width, base_length, base_thickness]);


    translate([bar_thickness, bar_margin, 0]) rotate([0, -bar_angle, 90]) cube([bar_length, bar_thickness, 40]);
    translate([0, base_length-bar_margin, 0]) rotate([0, -bar_angle, -90]) cube([bar_length, bar_thickness, 40]);

    translate([base_width, bar_margin, 0]) rotate([0, -bar_angle, 90]) cube([bar_length, bar_thickness, 40]);
    translate([base_width-20, base_length-bar_margin, 0]) rotate([0, -bar_angle, -90]) cube([bar_length, bar_thickness, 40]);
  }
}

barsnbase(wheel_inner_thickness1);
//barsnbase(wheel_inner_thickness2);
