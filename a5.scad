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
b = 21.6;
c = 1.35;
d = 2;
angle = 10;
hh = wall / (sin(angle) * tan(angle) + cos(angle));

module all() {
    intersection() {

        // second quadrant mask (looking at XY plane from positive Z)
        translate([-size, 0, -size/2]) {
            cube(size);
        }

        translate([0, wall, 0]) {
            translate([-b, 0, 0]) {

                // clip opposing side
                translate([wall + c, 0, 0]) {
                    rotate([0, 0, 180 - angle]) {
                        cube([hh, hh, d]);
                    }
                }

                // underside/clip
                translate([0, -wall, 0]) {
                    cube([c + wall, wall, d]);
                }

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