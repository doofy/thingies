panellaenge=1762;
laengezuschlag=9; //mittelklemme pro panel zuschlag

// torschiene
color("red") translate([0, 3120, 0]) cube([3000, 80, 50]);
// Decke innen
color("gray") translate([0, 0, -100]) cube([5990, 5950, 100]);
// träger
color("red") translate([5990-90-3000, 0, 0]) cube([90, 5950, 100]);
translate([-1000, 5500, 0]) rotate([0, 0, -90]) text(text="GARAGENTOR", size=500);
module profil() {
  translate([0, 22.5/2, 0]) cube([5950, 43, 22.5]);
  cube([5950, 63, 2]);
  // loch links
  color("blue") translate([300, 63/2, 0]) cylinder(h=100, d=40);
  // loch rechts
  color("blue") translate([5950 - 300, 63/2, 0]) cylinder(h=100, d=40);
  // loch mitte
  color("blue") translate([5950 - 3000 + 300, 63/2, 0]) cylinder(h=100, d=40);
}
module panel() {
  cube([1762, 1134, 30]);
}

translate([0, 300, 0]) {
  verschieb = panellaenge + laengezuschlag;
  translate([20, 0*verschieb, 0]) profil();
  translate([20, 1*verschieb, 0]) profil();
  translate([20, 2*verschieb, 0]) profil();
  translate([20, 3*verschieb, 0]) profil();
}

//panel();
