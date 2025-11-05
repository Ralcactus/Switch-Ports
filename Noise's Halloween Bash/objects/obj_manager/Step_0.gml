if (game_paused())
    exit;

update_cycle();
global.combo = approach(global.combo, 0, 0.025);
