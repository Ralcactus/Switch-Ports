if (!ready)
    exit;

if (!controller.win)
    controller.microgame_hspd = easy_smooth(controller.microgame_hspd, 0, 100);

bg_x += (controller.microgame_hspd * 0.2 * global.delta_game_factor);
var _w = sprite_get_width(spr_micro_karatedodge_bg_hills);

if (bg_x > _w)
    bg_x -= _w;

time += (1.8 * global.delta_game_factor);
