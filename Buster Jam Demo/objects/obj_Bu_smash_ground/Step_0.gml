x += (controller.microgame_hspd * global.delta_game_factor);

if (x <= -128)
    x += 128;
