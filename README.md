# a5 alignment stop

A5 alignment stop for the Dahle 507 paper cutter

## building

once you have the submodules (`git submodule update --init`), run `ninja` or `openscad -o a5.3mf a5.scad`

## animation

some animations are included at the beginning of pillstack.scad. you can uncomment them (one at a time) to view them. from the OpenSCAD GUI, select View → Animate, then set FPS to 30 and Steps to 360

note: this seems to prevent OpenSCAD from automatically updating the preview when the source changes
