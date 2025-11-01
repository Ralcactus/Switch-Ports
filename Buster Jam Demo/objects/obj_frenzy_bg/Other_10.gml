var _xoff, _yoff;

if (instance_exists(obj_microgame_controller))
{
    _xoff = obj_microgame_controller.xmove * 0.3;
    _yoff = obj_microgame_controller.ymove * 0.3;
}
else
{
    _xoff = 0;
    _yoff = 0;
}

draw_sprite_tiled_ext(spr_frenzy_pattern, pattern_ind, time + _xoff, (time * 0.5) + _yoff, 3, 3, c_white, 1);
