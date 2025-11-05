if (game_paused())
    exit;

squish = min(squish + 0.05, 1);
curpalette = wave(1, 2, 1, 0, global.game_cycleMS);
