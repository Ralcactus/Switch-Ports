anim_logic();

if (controller.win)
    hspd = approach(hspd, -0.9, 1.5);

x += (hspd * global.delta_game_factor);
