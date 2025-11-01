testvariablenothing = false;
cube_y = y - (side * 30);
event_user(0);

if (glyph)
{
    var _y;
    
    if (side == -1)
        _y = (y - 120) + 20;
    else
        _y = y + 120 + 20;
    
    draw_sprite_ext(scr_get_glyph(spr_glyph_gp_cross), global.keyboard, x, _y - 20, 1.25, 1.25, 0, c_white, 1);
}
