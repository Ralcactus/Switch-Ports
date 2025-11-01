if (y >= (ystart - 4) && vspd > 0)
    instance_destroy();

var _mult = 1.55;
y += (vspd * global.delta_game_factor * _mult);
vspd += (grav * global.delta_game_factor * _mult);
image_angle += (rotate_dir * 10);
