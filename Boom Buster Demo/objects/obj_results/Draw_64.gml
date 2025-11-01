draw_sprite_ext(spr_results_text, 0, 0, 0, 1, 1, 0, c_white, results_alpha);
draw_sprite_ext(spr_ui_dollars, 1, 980 + xoff, 52, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_ui_topdollars, 1, 976 + xoff, 345, 2, 2, 0, c_white, 1);
draw_set_font(obj_persistent.font_alarm);

if (dollars_flash)
    draw_set_color(make_colour_rgb(200, 255, 163));
else
    draw_set_color(make_colour_rgb(94, 209, 15));

draw_text_transformed(1278 + xoff, 125, string_add_zeros(dollars, 4, 2), 2, 2, 0.8);
var _str;

if (highscore < dollars)
    _str = dollars;
else
    _str = highscore;

if (dollars_flash && highscore < dollars)
    draw_set_color(make_colour_rgb(255, 163, 102));
else
    draw_set_color(make_colour_rgb(255, 0, 0));

draw_text_transformed(1283 + xoff, 423, string_add_zeros(_str, 4, 2), 2, 2, 0);
draw_set_color(c_white);
shader_set(sha_flash);
draw_sprite_ext(spr_ui_topdollars, 1, 976 + xoff, 345, 2, 2, 0, c_white, highscore_flash);
shader_reset();
highscore_flash = approach(highscore_flash, 0, 0.04);

if (has_food)
{
    var _x = 998 + xoff;
    var _y = 641;
    draw_sprite_ext(spr_foodbar, 0, _x, _y, 2, 2, 0, c_white, 1);
    
    if (food[0] && food[1])
        draw_sprite_gui_ext(spr_foodbar, 4, _x, _y, 2, 2, 0, 16777215, 1);
    
    if (food[1] && food[2])
        draw_sprite_gui_ext(spr_foodbar, 5, _x, _y, 2, 2, 0, 16777215, 1);
    
    for (var i = 0; i < 3; i++)
    {
        if (food[i])
            draw_sprite_ext(spr_foodbar, i + 1, _x, _y, 2, 2, 0, c_white, 1);
        else if (food[i] != -4)
            draw_sprite_ext(spr_foodbar, 19 + i, _x, _y, 2, 2, 0, c_white, 1);
    }
    
    for (var i = 0; i < 3; i++)
    {
        var _xx, _yy;
        
        if (i == 0)
        {
            _xx = 1170;
            _yy = 788;
        }
        else if (i == 1)
        {
            _xx = 1448;
            _yy = 792;
        }
        else if (i == 2)
        {
            _xx = 1724;
            _yy = 789;
        }
        
        if (food[i])
        {
            var _ind = ((global.stage - 1) * 3) + i;
            draw_sprite_ext(spr_foodbar, 6 + i, _x, _y, 2, 2, 0, c_white, 1);
            draw_sprite_ext(spr_food_city, _ind, _xx + xoff, _yy, 2, 2, 0, c_white, 1);
        }
    }
}

part_system_drawit(global.part_gui);
_str = "BOOM! Buster";
name_scroll += 0.5;
draw_set_font(fnt_splatter_55);
draw_set_valign(fa_bottom);
draw_set_alpha(results_alpha);
draw_set_color(#FF5000);

for (var i = 0; i < 10; i++)
    draw_text_transformed((2020 + name_scroll) - (i * (string_width(_str) * 0.7)), 1072, _str, 0.7, 0.7, 0);

draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(1);

if (name_scroll >= (string_width(_str) * 0.7))
    name_scroll -= name_scroll;

draw_sprite_ext(spr_controls_bar, 0, 0, 0, 1, 1, 0, c_white, results_alpha);
draw_sprite_ext(spr_controls_bar, 1, 1920 - sprite_get_width(spr_controls_bar), 1080 - sprite_get_height(spr_controls_bar), 1, 1, 0, c_white, results_alpha);
