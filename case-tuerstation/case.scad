case_inner_width=110;
case_inner_height=30;
case_inner_depth=20;
case_wall_thickness=2;
case_flange=5;

difference() {
  union() {
    //main case
    translate([-case_wall_thickness, -case_wall_thickness, 0])
      cube([case_inner_width+2*case_wall_thickness, case_inner_height+2*case_wall_thickness, case_inner_depth+2*case_wall_thickness]);
    translate([-case_wall_thickness-case_flange, -case_wall_thickness-case_flange, 0])
      cube([case_inner_width+2*case_wall_thickness+2*case_flange, case_inner_height+2*case_wall_thickness+2*case_flange, case_wall_thickness]);
  }
  //inner difference blocker
  translate([0, 0, -0.01])
    cube([case_inner_width, case_inner_height, case_inner_depth]);
}
