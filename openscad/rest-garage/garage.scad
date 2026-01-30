wallheight = 2500;
color([0.85, 0.85, 0.85]) {
  // Wand Süden
  cube([6600, 175, wallheight]);
  // Wand Osten
  translate([6600, 0, 0]) rotate([0, 0, 90]) cube([6365, 240, wallheight]);
  // Wand Norden
  translate([0, 6365-240, 0]) cube([6600, 240, wallheight]);
  // Wand Westen
  cube([350, 490, wallheight]);
  translate([0, 490+5010, 0]) cube([350, 955, wallheight]);
}
// Dach
color([0.15, 0.15, 0.15]) translate([0, 0, wallheight]) cube([6600, 6365, 200]);
// Sattelit
translate([2100, 6365 + 200, 2000]) {
  cylinder(h = 2500, d = 150);
  translate([0, -500, 2250]) rotate([65, 0, 0]) cylinder(h = 50, d = 1500);
}

//panels einseitig schräg
module panels1(maxi = 2, maxj = 4) {
  for ( i = [0 : maxi] ){
    for ( j = [0 : maxj] ){
      translate([j * 1250, i * 2050, 0])
        rotate([30, 0, 0])
        cube([1133, 1724, 35]);
    }
  }
}
//panels einseitig schräg
module panels2(maxi = 2, maxj = 2) {
  for ( i = [0 : maxi] ){
    for ( j = [0 : maxj] ){
      translate([j * 2550, i * 2050, 0]) {
        rotate([0, -10, 0])
          cube([1133, 1724, 35]);
      }
    }
  }
  for ( i = [0 : maxi] ){
    for ( j = [0 : maxj-1] ){
      translate([j * 2550, i * 2050, 0]) {
        translate([1133*2 + 50, 1724, 0])
          rotate([0, -10, 180])
          cube([1133, 1724, 35]);
      }
    }
  }
}
translate([200, 300, wallheight + 200]) panels1();
//translate([200, 300, wallheight + 200]) panels2();

//checks
//innenmaß nord süd
//color("red") translate([2000, 175, 0]) cube([20, 5950, wallheight]);
//innenmaß west ost
//color("green") translate([350, 2000, 0]) cube([6010, 20, wallheight]);
