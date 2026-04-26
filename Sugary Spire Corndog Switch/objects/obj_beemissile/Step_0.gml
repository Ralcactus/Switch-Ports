x += (image_xscale * (4 + accel));
y = wave(ystart - 5, ystart + 5, 1, 2);
accel += 0.2;

if (place_meeting_collision(x + image_xscale, y, UnknownEnum.Value_1) && (!groundedSlope || place_meeting_collision(x + sign(hsp), y - 16, UnknownEnum.Value_1)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
    instance_destroy();
