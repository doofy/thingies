wemos_width=25.5;
wemos_length=34.5;
wemos_height=1.2;
wemos_usb_width=9;
wemos_usb_length=7.5;
wemos_usb_height=4.5-1.2;
wemos_hole=2;

module wemos() {
  difference() {
    cube([wemos_width, wemos_length, wemos_height]);
    translate([3, wemos_length - 3, -wemos_height]) cylinder(h=wemos_height*3, d=wemos_hole);
    translate([wemos_width - 3, wemos_length - 3, -wemos_height]) cylinder(h=wemos_height*3, d=wemos_hole);
  }
  translate([wemos_width/2, -40, wemos_height]) translate([-wemos_usb_width/2, 0, 0]) cube([wemos_usb_width, wemos_usb_length, wemos_usb_height]);
}
