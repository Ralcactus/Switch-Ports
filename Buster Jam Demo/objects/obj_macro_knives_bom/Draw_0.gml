testvariablenothing = false;
draw_sprite_ext(anim_sprite, anim_index, x, y, 1, -side, 0, c_white, 1);

if (glyph)
{
    var _y;
    
    if (side == -1)
        _y = y - 220;
    else
        _y = y + 40;
    
    draw_sprite_ext(scr_get_glyph(spr_glyph_gp_cross), global.keyboard, x, _y - 20, 1.25, 1.25, 0, c_white, 1);
}
