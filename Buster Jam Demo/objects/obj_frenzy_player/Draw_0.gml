draw_sprite_ext(anim_sprite, anim_index, x, y + z, 1, 1, 0, c_white, 1);
var _bomspr = undefined;

if (anim_sprite == anim_aim)
    _bomspr = anim_bom_aim;
else if (anim_sprite == anim_aim_beat)
    _bomspr = anim_bom_beat;

if (_bomspr != undefined)
    draw_sprite_ext(_bomspr, anim_index, x, y + z, 1, 1, 0, c_white, 1);
