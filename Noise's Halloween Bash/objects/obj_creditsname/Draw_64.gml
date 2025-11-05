draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(global.namefont);
__draw_text_transformed_hook(x, y, name, image_xscale, image_yscale, 0);
