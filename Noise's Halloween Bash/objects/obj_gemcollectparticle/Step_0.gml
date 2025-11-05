if (game_paused())
    exit;

prog += 0.15;
x = lerp(xstart, xend, prog);
y = lerp(ystart, yend, prog);

if (prog >= 1)
    instance_destroy();
