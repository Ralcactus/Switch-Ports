if (!ready)
    exit;

draw_set_font(global.font_dialogue_outline);
var _y = -113 + (137 * name_percent);
scr_draw_dialogue(45, _y, 1920, map_name);
time += (0.1 * global.delta_game_factor);
