x += (hspd * global.delta_game_factor * mult);
y += (vspd * global.delta_game_factor * mult);
vspd += (grav * global.delta_game_factor * mult);
image_angle -= (sign(hspd) * 4 * mult);
