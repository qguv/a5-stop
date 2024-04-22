// animation: fix camera in place
//$vpr = [$vpr[0], 0, $vpr[2]];
//$vpt = [0, 0, 0];

// animation: spin
//$vpr = [$vpr[0], 0, 360 * $t];

include <BOSL2/std.scad>

$fn = 90;
wall = 0.8;
fudge = 1;
size = 30;
a = 11.3;
b = 22.6;
c = 1.35;
d = 20;
clip_height = 0.7;
bumper_height = 8;

module under_clip() {
    // clip opposing side
    translate([c, 0, 0]) {
        cube([wall, clip_height, d]);
    }

    // underside/clip
    translate([0, -wall, 0]) {
        cube([c + wall, wall, d]);
    }
}

module all() {

    // bumper
    translate([-wall, a + wall, 0]) {
        cube([wall, bumper_height, d]);
    }

    intersection() {

        // second quadrant mask (looking at XY plane from positive Z)
        translate([-size, 0, 0]) {
            cube([size, size, d]);
        }

        translate([0, wall, 0]) {
            translate([-b, 0, 0]) {

                under_clip();

                // walls
                translate([0, a, 0]) {
                    translate([size / 2 - wall, -size / 2 + wall, 0]) {
                        rect_tube(size=size, wall=wall, rounding=3, h=d);
                    }
                }
            }
        }
    }
}

all();