if (x < (controller.game_width / 2))
    image_angle -= (16 * global.delta_game_factor);
else
    image_angle += (16 * global.delta_game_factor);

if (!controller.win)
    exit;

y -= (2.78 * global.delta_game_factor);
