testvariablenothing = false;
bg_xspd = -68;
bg_x += (bg_xspd * global.delta_game_factor);

if (bg_x < -bg_w)
    bg_x += bg_w;

time += (0.05 * global.delta_game_factor);
y = ystart + (sin(pi * time) * 12);
