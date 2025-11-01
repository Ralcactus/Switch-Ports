var _w = sprite_get_width(mask_index);
var _subtract = instance_find_micro(obj_Bu_defuse_spark).x - x - _w;

if (_subtract < 0)
    _w += _subtract;

draw_set_bounds(x, y - 20, x + _w, y + sprite_get_height(spr_Bu_defuse_fuse) + 20);
draw_sprite(spr_Bu_defuse_fuse, 1, instance_find_micro(obj_Bu_defuse_fuse).x, instance_find_micro(obj_Bu_defuse_fuse).y);
draw_reset_clip();
