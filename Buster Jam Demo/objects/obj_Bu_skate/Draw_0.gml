draw_sprite_ext(spr_Bu_skate_actionlines, action_sub, 0, 0, 1, 1, 0, c_white, action_alpha);
var _xoff;

if (anim_sprite == spr_Bu_skate_josh_idle || anim_sprite == spr_Bu_skate_josh_ollie)
    _xoff = 54;
else
    _xoff = 0;

draw_sprite_ext(anim_sprite, anim_index, (x + _xoff) - SCREEN_L, (y + yoff) - SCREEN_U, xscale, yscale, angle, c_white, 1);
