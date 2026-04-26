debug = false
depth = 101
dbgXComp = 0
dbgYComp = 0
offset = 0
wormSurface = surface_create(abs(sprite_width), abs(sprite_height))
image_speed = 0.35
segments = [spr_gummyWormHead, spr_gummyWormSegment, spr_gummyWormTail]
segmentIndices = [0, 0, 0]
x_direction = dcos(image_angle + ((sign(image_xscale) == -1) ? 0 : 180))
y_direction = dsin(image_angle + ((sign(image_xscale) == -1) ? 0 : 180))
hasBump = false
