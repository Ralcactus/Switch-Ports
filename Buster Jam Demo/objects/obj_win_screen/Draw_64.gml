testvariablenothing = false;

if (!ready)
{
    draw_set_color(c_black);
    draw_rectangle(0, 0, 1920, 1080, false);
    draw_set_color(c_white);
}

var _x = 1840;
var _y = 1010;
draw_set_font(global.font_dialogue_outline);
draw_set_halign(fa_right);
draw_set_alpha(glyph_alpha);
draw_text(_x - 70, _y - 40, "Continue");
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_sprite_ext(scr_get_glyph(spr_glyph_gp_cross), global.keyboard, _x, _y, 1, 1, 0, c_white, glyph_alpha);
