draw_set_halign(fa_center);
draw_set_font(global.font);
draw_sprite_tiled(bg_options, 0, bgx, bgy);
draw_sprite_ext(spr_arrow, -1, 250, CursorY + 24, 1, 1, 0, c_white, 1);

if (!selected)
{
    draw_option(150, 30, "BACK", optionselected == UnknownEnum.Value_0);
    draw_option(480, 100, "AUDIO CONFIG", optionselected == UnknownEnum.Value_1);
    draw_option(480, 200, "VIDEO CONFIG", optionselected == UnknownEnum.Value_2);
    draw_option(480, 300, "CONTROL CONFIG", optionselected == UnknownEnum.Value_3);
    draw_set_font(global.smallfont);
    var _string_width = string_width(subtitle) + 32;
    
    if (string_length(subtitle) >= 1)
        draw_sprite_ext(spr_optionSubtitle, 0, 480, 521, _string_width / 32, 1, 0, c_white, 1);
    
    draw_text(480, 512, subtitle);
}
