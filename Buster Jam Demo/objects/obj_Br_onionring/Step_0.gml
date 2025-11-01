anim_logic();

if (obj_Br_onionring_bridget.done)
    exit;

time += (0.035 * global.delta_game_factor * 1.45);
y = ystart + 5 + (sin(pi * time) * 5);
x = (xstart - 130) + (sin(pi * (time * 0.6)) * 150);
