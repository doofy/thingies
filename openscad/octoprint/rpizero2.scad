$fn = 30;
eps = 0.01;
spc = 1.02;
spc2 = 0.5;

rpi_width = 65;
rpi_thickness = 5;
rpi_height = 30;
rpi_corner_r = 3.5;
rpi_hole_d = 2.5;
lower_thickness = 1;

module rpi_bounding_box_round() {
  hull() {
    r = rpi_corner_r;
    h = rpi_thickness;
    translate([r, r, 0]) cylinder(h = h, r = r);
    translate([-r, r, 0]) translate([rpi_width, 0, 0]) cylinder(h = h, r = r);
    translate([-r, -r, 0]) translate([rpi_width, rpi_height, 0]) cylinder(h = h, r = r);
    translate([r, -r, 0]) translate([0, rpi_height, 0]) cylinder(h = h, r = r);
  }
}
module rpi_pins() {
  d = rpi_hole_d;
  h = 2;
  margin = 3.5;
  translate([margin, margin, 0]) cylinder(h = h, d = d);
  translate([-margin, margin, 0]) translate([rpi_width, 0, 0]) cylinder(h = h, d = d);
  translate([-margin, -margin, 0]) translate([rpi_width, rpi_height, 0]) cylinder(h = h, d = d);
  translate([margin, -margin, 0]) translate([0, rpi_height, 0]) cylinder(h = h, d = d);

  translate([margin, margin, 0]) scale([1.2, 1.2, 0.2]) cylinder(h = h, d = d);
  translate([-margin, margin, 0]) translate([rpi_width, 0, 0]) scale([1.2, 1.2, 0.2]) cylinder(h = h, d = d);
  translate([-margin, -margin, 0]) translate([rpi_width, rpi_height, 0]) scale([1.2, 1.2, 0.2]) cylinder(h = h, d = d);
  translate([margin, -margin, 0]) translate([0, rpi_height, 0]) scale([1.2, 1.2, 0.2]) cylinder(h = h, d = d);
}

module lower() {
  difference() {
    hull() {
      r = rpi_corner_r;
      h = rpi_thickness + lower_thickness;
      thickness_offset = 2 * lower_thickness;
      translate([r, r, 0]) cylinder(h = h, r = r);
      translate([-r, r, 0]) translate([rpi_width + thickness_offset, 0, 0]) cylinder(h = h, r = r);
      translate([-r, -r, 0]) translate([rpi_width + thickness_offset, rpi_height + thickness_offset, 0]) cylinder(h = h, r = r);
      translate([r, -r, 0]) translate([0, rpi_height + thickness_offset, 0]) cylinder(h = h, r = r);
    }
    translate([lower_thickness, lower_thickness, lower_thickness + eps]) rpi_bounding_box_round();
    translate([-eps, 10.5, lower_thickness]) cube([lower_thickness + 2 * eps, 14, rpi_thickness + 2*eps]);
    translate([rpi_width + lower_thickness - eps, lower_thickness+rpi_height*0.2, lower_thickness]) cube([lower_thickness + 2 * eps, rpi_height*0.6, rpi_thickness + 2*eps]);
    translate([6.5, eps, lower_thickness]) cube([13, lower_thickness + 2*eps, rpi_thickness + 2*eps]);
    translate([rpi_width + 2*lower_thickness - 7 -22.5, eps, lower_thickness]) cube([22, lower_thickness + 2*eps, rpi_thickness + 2*eps]);
  }
}

module upper() {
  translate([rpi_width + 2*lower_thickness, 0, rpi_thickness + lower_thickness]) rotate([0, 180, 0]) {
    hull() {
      r = rpi_corner_r;
      h = lower_thickness;
      thickness_offset = 2 * lower_thickness;
      translate([r, r, 0]) cylinder(h = h, r = r);
      translate([-r, r, 0]) translate([rpi_width + thickness_offset, 0, 0]) cylinder(h = h, r = r);
      translate([-r, -r, 0]) translate([rpi_width + thickness_offset, rpi_height + thickness_offset, 0]) cylinder(h = h, r = r);
      translate([r, -r, 0]) translate([0, rpi_height + thickness_offset, 0]) cylinder(h = h, r = r);
    }
    color("green") translate([lower_thickness, lower_thickness, 0]) difference() {
      translate([0, 0, eps]) hull() {
        r = rpi_corner_r;
        h = rpi_thickness -eps;
        translate([r*spc, r*spc, 0]) cylinder(h = h, r = r);
        translate([-r*spc, r*spc, 0]) translate([rpi_width, 0, 0]) cylinder(h = h, r = r);
        translate([-r*spc, -r*spc, 0]) translate([rpi_width, rpi_height, 0]) cylinder(h = h, r = r);
        translate([r*spc, -r*spc, 0]) translate([0, rpi_height, 0]) cylinder(h = h, r = r);
      }
      translate([lower_thickness, lower_thickness, -eps]) hull() {
        r = rpi_corner_r;
        h = rpi_thickness + 2*eps;
        translate([r, r, 0]) cylinder(h = h, r = r);
        translate([-r, r, 0]) translate([rpi_width - 2*lower_thickness, 0, 0]) cylinder(h = h, r = r);
        translate([-r, -r, 0]) translate([rpi_width - 2*lower_thickness, rpi_height - 2*lower_thickness, 0]) cylinder(h = h, r = r);
        translate([r, -r, 0]) translate([0, rpi_height - 2*lower_thickness, 0]) cylinder(h = h, r = r);
      }
      translate([0, 0, -eps]) {
        translate([-eps, rpi_corner_r, 0]) cube([rpi_width+2*eps, rpi_height - 2 * rpi_corner_r, rpi_thickness + 2 * eps]);
        translate([rpi_corner_r, -eps, 0]) cube([rpi_width - 2 * rpi_corner_r, rpi_height+2*eps, rpi_thickness + 2 * eps]);
      }
    }
  }
}


/**
upper();
lower();
translate([lower_thickness, lower_thickness, lower_thickness]) {
 color("red") rpi_pins();
}
**/

rpicam_width = 25;
rpicam_thickness = 4;
rpicam_height = 24;
rpicam_lower_thickness = 1;

module rpicam_bounding_box_round() {
cube([rpicam_width + 2 * spc2, rpicam_height + 2 * spc2, rpicam_thickness + 2 * spc2 + eps]);
}

module rpicam_lower() {
  difference() {
    cube([rpicam_width + 2 * rpicam_lower_thickness, rpicam_height + 2 * rpicam_lower_thickness, rpicam_thickness + rpicam_lower_thickness]);
    translate([rpicam_lower_thickness, rpicam_lower_thickness - spc2, rpicam_lower_thickness]) rpicam_bounding_box_round();
  }
}

rpicam_lower();
