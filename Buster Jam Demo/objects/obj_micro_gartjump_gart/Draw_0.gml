var _w = controller.game_width;
get_cams(1);
draw_set_halign(fa_center);
draw_set_font(global.font_score);
draw_text_transformed(camx + (_w / 2), camy + 20, string("{0}", round(game_score * 0.1)), 0.5, 0.5, 0);
draw_set_halign(fa_left);

if (dead)
    exit;

draw_sprite_ext(sprite_index, image_index, x - _w, y, xscale * xscale_fall, yscale * yscale_fall, angle, c_white, 1);
draw_sprite_ext(sprite_index, image_index, x, y, xscale * xscale_fall, yscale * yscale_fall, angle, c_white, 1);
draw_sprite_ext(sprite_index, image_index, x + _w, y, xscale * xscale_fall, yscale * yscale_fall, angle, c_white, 1);
