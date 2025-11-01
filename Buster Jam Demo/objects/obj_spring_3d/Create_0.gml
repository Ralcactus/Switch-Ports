event_inherited();
z = 0;
height = 48;
alarm[0] = 1;
scr_create_shadow();
my_shadow.xoff = 61;
my_shadow.yoff = 45;
anim_init();
xscale = 1;
yscale = 1;

draw = function()
{
    var _xoff = sprite_get_xoffset(spr_spring_draw) - sprite_get_xoffset(spr_spring);
    var _yoff = sprite_get_yoffset(spr_spring_draw) - sprite_get_yoffset(spr_spring);
    draw_sprite_ext(spr_spring_draw, anim_index, x + _xoff, y + _yoff + z, xscale, yscale, 0, c_white, image_alpha);
};
