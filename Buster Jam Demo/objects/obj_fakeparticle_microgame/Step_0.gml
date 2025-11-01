anim_logic();
sprite_index = anim_sprite;
image_index = anim_index;
vspd += (grav * global.delta_game_factor);
x += (hspd * global.delta_game_factor);
y += (vspd * global.delta_game_factor);
x += (dsin(spd_dir) * spd * global.delta_game_factor);
y += (dcos(spd_dir) * spd * global.delta_game_factor);
spd = easy_smooth(spd, spd_to, spd_lag);

if (fadeout)
{
    image_alpha = approach(image_alpha, 0, fade_spd);
    
    if (image_alpha <= 0)
        instance_destroy();
}

image_angle += rot_spd;
