if (y > (controller.game_height + 600))
    instance_destroy();

x += ((hspd + controller.microgame_hspd) * global.delta_game_factor);
y += (vspd * global.delta_game_factor);
vspd += grav;
image_angle += (8 * dir);
