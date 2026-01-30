rf_width=15.3;
rf_length=28.1;
rf_height=1;
rf_hole=3.3;
rf_sma=5.3;

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
