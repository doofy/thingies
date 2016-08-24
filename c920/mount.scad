module mount() {
    $w = 20;
    $d = 7;
    $h = 15;

    $holew = 11.0;
    $holed = 4.13;
    $holeh = $h;

    $bored=6.5;

    $slitw = 11.5;
    $slitd = 1.1;
    $slith = $h * 2;

    translate([-$w/2, 0, 0]) {
        difference() {
            cube([$w, $d, $h]);
            translate([$w/2 - $holew/2, 0, $h/2 - $holew/2]) cube([$holew, $holed, $holeh]);
            translate([$w/2, $d/2, $h/2]) rotate([-90,0,0]) cylinder(d=$bored, h=$d);
            translate([$w/2 - $slitw/2, $d - $slitd + 0.1, -$h/2]) cube([$slitw, $slitd, $slith]);
        }
    }
}
