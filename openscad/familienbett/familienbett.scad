pfosten_width = 200;
pfosten_height = 700;

balken_height = 150;
balken_length = 2000;
balken_width = 100;

traeger_width = 300;
traeger_thickness = 100;
traeger_length = 200;

rost_length = 2000;
rost_width = 900;
rost_height = 50;
rost_spacing = 20;
rost_latte_width = 30;
rost_floor_spacing = 100;
latte_width = 50;
latte_thickness = 10;
latte_length = rost_width;
latte_spacing = 20;

balken_length2 = 3 * rost_width + 4 * rost_spacing;
steg_height = pfosten_height - rost_floor_spacing - 2 * balken_height;
steg_width = 50;
steg_thickness = 20;
steg_spacing = 200;

module pfosten() {
  cube([pfosten_width, pfosten_width, pfosten_height]);
}

module rost() {
  cube([rost_latte_width, rost_length, rost_height]);
  translate([rost_width - rost_latte_width, 0, 0]) cube([rost_latte_width, rost_length, rost_height]);
  translate([0, latte_width/2, 0]) for (i = [0:27]) translate([rost_latte_width, i * (latte_width + latte_spacing), rost_height/2]) cube([latte_length - 2 * rost_latte_width, latte_width, latte_thickness]);
}

// Vertikale Pfosten
translate([0, 0, 0]) pfosten();
translate([pfosten_width + rost_spacing + 3 * (rost_width + rost_spacing), 0, 0]) pfosten();
translate([0, rost_length + pfosten_width, 0]) pfosten();
translate([pfosten_width + rost_spacing + 3 * (rost_width + rost_spacing), rost_length + pfosten_width, 0]) pfosten();

// Horizontale Balken oben
translate([0, 0, pfosten_height - balken_height]) {
  translate([pfosten_width - balken_width, pfosten_width, 0]) cube([balken_width, balken_length, balken_height]);
  translate([pfosten_width + 3 * rost_width + 4 * rost_spacing, pfosten_width, 0]) cube([balken_width, balken_length, balken_height]);
  translate([pfosten_width, pfosten_width - balken_width, 0]) cube([balken_length2, balken_width, balken_height]);
  translate([pfosten_width, pfosten_width + rost_length, 0]) cube([balken_length2, balken_width, balken_height]);
}
// Horizontale Balken unten
translate([0, 0, rost_floor_spacing]) {
  translate([pfosten_width - balken_width, pfosten_width, 0]) cube([balken_width, balken_length, balken_height]);
  translate([pfosten_width + 3 * rost_width + 4 * rost_spacing, pfosten_width, 0]) cube([balken_width, balken_length, balken_height]);
  translate([pfosten_width, pfosten_width - balken_width, 0]) cube([balken_length2, balken_width, balken_height]);
  translate([pfosten_width, pfosten_width + rost_length, 0]) cube([balken_length2, balken_width, balken_height]);
}

// Stegs
translate([pfosten_width + steg_spacing / 2, pfosten_width - balken_width / 2 - steg_thickness / 2, rost_floor_spacing + balken_height])
  for (i = [0:13]) translate([i * steg_spacing, 0, 0]) cube([steg_width, steg_thickness, steg_height]);

// 3 Rost nebeneinander mit Abstand
translate([pfosten_width + rost_spacing, pfosten_width, rost_floor_spacing]) {
  for (i = [0:2]) translate([i * (rost_width + rost_spacing), 0, 0]) rost();
}

/*
// 180cm Matratze + 90cm Matratze
translate([pfosten_width + rost_spacing, pfosten_width, rost_floor_spacing + rost_height + rost_spacing]) {
  cube([2 * rost_width + rost_spacing, rost_length, 200]); // 180cm Matratze
  translate([2 * rost_width + 2 * rost_spacing, 0, 0]) cube([rost_width, rost_length, 200]); // 90cm Matratze
}
*/