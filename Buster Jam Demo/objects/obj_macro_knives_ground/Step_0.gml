testvariablenothing = false;
get_cams();

if (global.microgame_hspd != 0)
    x -= (30 * global.delta_game_factor);

if (bbox_right <= camx)
    x += (sprite_width * 3);
