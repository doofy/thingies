use <roundedcube.scad>

$fn = 32;

adapter_thickness=5;
adapter_width=25+adapter_thickness*2;
adapter_height=28+adapter_thickness*2;
adapter_depth=35;

magnet_width = 20;
magnet_height = 10;

module controller() {
  translate([-25, 13, 0]) rotate([128, -6, 0]) translate([0, 0, -140]) import("index_controller.stl", convexity=3);
}
module versiontext() {
  linear_extrude(4) text("v1", size=6);
}
module clonemirror(v=[1, 0, 0]) {
  mirror(v) children();
  children();
}
module pipeadapter() {
  difference() {
    union() {
      translate([0, 0, 4]) roundedcube([adapter_width, adapter_depth, adapter_height], true, 2);
      clonemirror() translate([adapter_width/2, 0, 4]) roundedcube([20, 15, 38], true, 2);
    }
    clonemirror() {
      translate([adapter_width/2 - 5, -adapter_width/2 + 5, 15]) cylinder(h=15, d=5);
      translate([adapter_width/2 - 5, adapter_width/2 - 5, 15]) cylinder(h=15, d=5);
      translate([adapter_width/2+3.5, 0, 0]) {
        translate([0, 0, 5]) rotate([180, 0, 0]) screwhole();
        translate([0, 0, -6]) nuthole();
      }
    }

    translate([0, 0, adapter_width/2]) magnethole(); // magnet recess
    pipe();
    translate([0, 0, 15]) cylinder(h=15, d=5); // punch hole magnet

    cube([adapter_width*2, adapter_depth*2, 2], center=true); // split plane
    translate([0, 11, 16]) rotate([180, 0, 180]) versiontext();
    translate([0, -11, 16]) rotate([180, 0, 0]) versiontext();
  }
  /*
     translate([adapter_width/2+3.5, 0, 0]) {
     color("green") translate([0, 0, 5]) rotate([180, 0, 0]) screw();
     color("red") translate([0, 0, -6]) nut();
     }
   */
}
module controlleradapter() {
}
module screw() {
  screw_length = 12;
  screw_diameter = 3;
  screw_diameter2 = 5.7;
  screw_head_length = 1.65;
  cylinder(h=screw_length, d=screw_diameter);
  translate([0, 0, -screw_head_length]) cylinder(h=screw_head_length, d1=screw_diameter, d2=screw_diameter2);
}
module screwhole() {
  screw_length = 12;
  screw_diameter = 3;
  screw_diameter2 = 5.7;
  screw_head_length = 1.65;
  cylinder(h=screw_length*15, d=screw_diameter);
  translate([0, 0, -screw_head_length*15+0.01]) cylinder(h=screw_head_length*15, d1=screw_diameter2, d2=screw_diameter2);
}
module nut() {
  nut_thickness=2.4;
  nut_width=5.5;
  nut_hole=3;
  difference() {
    cylinder($fn=6, h=nut_thickness, d=nut_width*1.1547);
    //translate([0, 0, -1]) cylinder(h=nut_thickness+2, d=nut_hole);
  }
}
module nuthole() {
  nut_thickness=2.4;
  nut_width=5.5;
  nut_hole=3;
  cylinder($fn=6, h=nut_thickness, d=nut_width*1.1547);
  translate([0, -nut_width/2, 0]) cube([50, nut_width, nut_thickness]);
}
module magnet() {
  roundedcube([magnet_width, magnet_width, magnet_height], true, 1);
}
module magnethole() {
  translate([0, 0, -magnet_height]) roundedcube([magnet_width, magnet_width, magnet_height*3], true, 1);
}
module pipe(fill=1) {
  if (fill) {
    roundedcube([25, 800, 25], true, 2, "y");
  }
  else {
    difference() {
      roundedcube([25, 800, 25], true, 2, "y");
      roundedcube([25-1.5, 820, 25-1.5], true, 2, "y");
    }
  }
}
//translate([adapter_width/2, 0, adapter_height]) controller();
