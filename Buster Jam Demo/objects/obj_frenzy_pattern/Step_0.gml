if (!scr_frenzy_freeze())
{
    pattern_bar_x += (1 * global.delta_game_factor);
    pattern_bar_x_back += (0.6 * global.delta_game_factor);
}

var _w = sprite_get_width(spr_map_frenzy_pattern);

if (pattern_bar_x >= _w)
    pattern_bar_x -= pattern_bar_x;

if (pattern_bar_x_back >= _w)
    pattern_bar_x_back -= pattern_bar_x_back;

bars_out = easy_smooth(bars_out, 0, 8);
