scr_collide();
hsp = image_xscale * movespeed;
var _attr = new Fmod3DAttributes();
_attr.position.x = x;
_attr.position.y = y;
_attr.position.z = 0;
_attr.forward.z = 1;
_attr.up.y = 1;

if (!event_isplaying(slithersnd))
    fmod_studio_event_instance_start(slithersnd);

event_set_3d_position_struct(slithersnd, _attr);

if (killed)
    event_stop(slithersnd, true);

if ((scr_solid(x + image_xscale, y) && !place_meeting(x + sign(hsp), y, obj_slope)) || !(scr_solid(x + (image_xscale * 15), y + 31) || place_meeting(x + (image_xscale * 15), y + 31, obj_platform)))
    image_xscale *= -1;
