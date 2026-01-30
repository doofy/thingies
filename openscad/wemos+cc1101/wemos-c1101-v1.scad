$fn=64;

wemos_width=25.5;
wemos_length=34.5;
wemos_height=1.2;
wemos_usb_width=9;
wemos_usb_length=7.5;
wemos_usb_height=4.5-1.2;
wemos_hole=2;

rf_width=15.3;
rf_length=28.1;
rf_height=1;
rf_hole=3.3;
rf_sma=5.3;

thickness=2;
space=0.5;
case_width=wemos_width + 2*space;
case_length=wemos_length + 10*space + 2*space + rf_length;
case_height=10;

spacer_height=4;

//cube([case_width, case_length, case_height]);

module wemos(scalefactor=1) {
  difference() {
    cube([wemos_width, wemos_length, wemos_height]);
    translate([3, wemos_length - 3, -wemos_height]) cylinder(h=wemos_height*3, d=wemos_hole);
    translate([wemos_width - 3, wemos_length - 3, -wemos_height]) cylinder(h=wemos_height*3, d=wemos_hole);
  }
  translate([wemos_width/2, -40*(scalefactor-1), wemos_height]) scale([scalefactor, scalefactor, scalefactor]) translate([-wemos_usb_width/2, 0, 0]) cube([wemos_usb_width, wemos_usb_length, wemos_usb_height]);
}

module rf(scalefactor=1) {
  difference() {
    cube([rf_width, rf_length, rf_height]);
    translate([3, rf_length - 9.5 + rf_hole/2, -rf_height]) cylinder(h=rf_height*3, d=rf_hole);
    translate([rf_width - 3, rf_length - 9.5 + rf_hole/2, -rf_height]) cylinder(h=rf_height*3, d=rf_hole);
  }
  translate([rf_width/2, rf_length, rf_height/2 + 0.75]) rotate([-90, 0 ,0]) {
    translate([0, 0, 1.5]) cylinder(h=5, d=rf_sma);
    scale([scalefactor, scalefactor, scalefactor]) translate([-3.25, -3.25, 0]) cube([6.5, 6.5, 1.5]);
  }
}

module case() {
  difference() {
    cube([case_width + 2*thickness, case_length + 2*thickness, case_height + 2*thickness]);
    translate([thickness, thickness, thickness]) cube([case_width, case_length, 2*case_height]);
  }
}

module spacer() {
  cylinder(h=spacer_height, d=5);
}

module pinspacer(hole, height) {
  difference() {
    union() {
      cylinder(h=spacer_height, d=5);
      translate([0, 0, spacer_height+height+0.3*hole]) sphere(d=1.1*hole);
      translate([0, 0, spacer_height]) cylinder(h=height, d=0.9*hole);
    }
    slit_width=0.5*hole;
    translate([-0.5*slit_width, -2*hole, 0.5*spacer_height]) cube([0.5*hole, 4*hole, 4*hole]);
  }
}

//case cutouts for wemos usb and rf antenna
difference() {
  case();
  translate([9, 35, 2.7*thickness]) text("V1.0", size=3);
  translate([thickness + space, thickness + space, thickness + spacer_height]) {
    wemos(1.1);
    translate([wemos_width/2 - rf_width/2, wemos_length + 10*space, 0]) rf(1.1);
  }
}

translate([thickness + space, thickness + space, thickness]) {
  translate([0, 0, spacer_height]) {
    wemos();
    translate([wemos_width/2 - rf_width/2, wemos_length + 10*space, 0]) rf();
  }
  //wemos spacers
  translate([3, wemos_length - 3, 0]) pinspacer(wemos_hole, wemos_height);
  translate([wemos_width - 3, wemos_length - 3, 0]) pinspacer(wemos_hole, wemos_height);
  translate([3, 3, 0]) spacer();
  translate([wemos_width - 3, 3, 0]) spacer();
  //rf spacers
  translate([wemos_width/2 - rf_width/2, wemos_length + 10*space, 0]) {
    translate([3, rf_length - 9.5 + rf_hole/2, 0]) pinspacer(rf_hole, rf_height);
    translate([rf_width - 3, rf_length - 9.5 + rf_hole/2, 0]) pinspacer(rf_hole, rf_height);
    translate([3, 4.5 + rf_hole/2, 0]) spacer();
    translate([rf_width - 3, 4.5 + rf_hole/2, 0]) spacer();
  }
}
