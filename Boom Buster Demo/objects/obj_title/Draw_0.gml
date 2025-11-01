if (!loaded)
    exit;

var _xmove = 2 * sin(time * 0.013333333333333334 * pi);
var _ymove = 2 * sin(time * 0.01 * pi);
gpu_set_texfilter(true);
bg_yoff_lerp = lerp(bg_yoff_lerp, bg_yoff, 0.2);
draw_sprite_ext(bgr_title, 0, _xmove - 2, (_ymove - 2) + bg_yoff_lerp, 1.01, 1.01, 0, c_white, 1);

if (state == 3)
{
    gpu_set_texfilter(false);
    exit;
}

draw_sprite_ext(spr_logo, 0, 960, 395, 0.88 + logo_scale, 0.88 + logo_scale, 0, c_white, 1);
draw_sprite_ext(spr_press_blur, 0, 0, 868, 2100 * any_scale, any_scale, 0, c_white, 0.3);
draw_sprite_ext(spr_press_any, 0, 960, 868, any_scale, any_scale, _xmove * 0.5, c_white, 1);
draw_set_font(fnt_splatter_55);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_black);
draw_text_transformed(964, 1072, "Kickstarter 2024 Public Demo v1.0.3", 0.5, 0.5, 0);
draw_set_color(c_white);
draw_text_transformed(960, 1068, "Kickstarter 2024 Public Demo v1.0.3", 0.5, 0.5, 0);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
gpu_set_texfilter(false);
