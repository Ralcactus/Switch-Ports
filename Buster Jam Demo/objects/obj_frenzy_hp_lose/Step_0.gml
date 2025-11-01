testvariablenothing = false;
x += (hspd * global.delta_game_factor * mult);
y += (vspd * global.delta_game_factor * mult);
vspd += (grav * global.delta_game_factor * mult);
angle -= (hspd * 1.15);
image_alpha = approach(image_alpha, 0, 0.011111111111111112);

if (image_alpha <= 0)
    instance_destroy();

if (y > 1380)
    instance_destroy();
