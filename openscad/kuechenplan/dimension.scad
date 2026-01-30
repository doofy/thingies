module dimension(length, width=20, height=1, left_marker=true, right_marker=true, marker_length=120, marker_width=20, label="above", textsize=150) {
  module marker() {
    cube([marker_width, marker_length, height]);
  }

  verticalalign = label == "below" ? "top" : "bottom";
  verticaloffset = label == "below" ? -50 : 50;
  verticalmarkeroffset = label == "below" ? 0 : marker_width-marker_length;

  //line
  cube([length, width, height]);
  //left end marker
  translate([0, verticalmarkeroffset, 0]) marker();
  //right end marker
  translate([length-marker_width, verticalmarkeroffset, 0]) marker();
  //text
  translate([length/2, verticaloffset, 0]) text(text=str(length/10, "cm"), size=textsize, halign="center", valign=verticalalign);
}
