event_inherited();
scr_fmod_soundeffectONESHOT("event:/sfx/misc/explosion", x, y);
shakecam(80 * clamp(1 - (distance_to_object(obj_player) / 500), 0, 1), 7);
pow = false;
palettespr = spr_explosionpal;
curpalette = pow;
image_speed = 0.5;
instance_create_depth(x, y, depth - 5, obj_explosionring);
