include <roundedcube.scad>
include <unionRoundMask.scad>
include <clonemirror.scad>
include <index_controller.scad>
include <magnet.scad>
include <screwnut.scad>
include <pipe.scad>

$fn = 16;

adapter_wall_thickness = 5;

adapter_width = profile_size + 2 * adapter_wall_thickness;
adapter_height = profile_size + 2 * adapter_wall_thickness;
adapter_depth = 35;
adapter_thickness = 5;
adapter_corner_radius = 2;
adapter_split_height = 1;

difference() {
  //union() {
  unionRoundMask( r=1.5 , detail=5 , q=64, includeOperands=true) {
    roundedcube([adapter_width, adapter_depth, adapter_height], true, adapter_corner_radius);
    translate([0, 0, adapter_height / 2 - adapter_thickness + magnet_height / 2])  magnet(height=magnet_height * 1.1);

    //mask
    translate([0, 0, adapter_height / 2]) cube([adapter_width, adapter_depth, 3], center=true);
  }

  // pipe cutout
  pipe();

  // slice
  cube([adapter_width * 1.1, adapter_depth * 1.1, adapter_split_height], center = true);

  // magnet cutout
  translate([0, 0, adapter_height / 2 - adapter_thickness + magnet_height / 2])  magnet(height=magnet_height * 1.1);
}

//mask
//translate([0, 0, adapter_height / 2]) cube([adapter_width, adapter_depth, 3], center=true);
//      translate([adapter_depth / 2, 0, adapter_height / 2]) cube([adapter_width - magnet_width, magnet_width, 3], center=true);

/**
  unionRoundMask( r=1.5 , detail= 5 , q=70, includeOperands = true) {
  cube([10,10,2],true);
  rotate([20,-10,0])cylinder(5,1,1,$fn=12);
  translate([0,0,1.5])cube([1.5,10,3],center=true); //mask
  rotate(90)
  translate([0,0,1.5])cube([3,10,3],center=true); //mask
  }
 **/
