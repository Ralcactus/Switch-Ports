if (scr_map_exit_freeze())
    exit;

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

if (die_outside_view)
{
    var camx = camera_get_view_x(view_camera[0]);
    var camy = camera_get_view_y(view_camera[0]);
    var camw = camera_get_view_width(view_camera[0]);
    var camh = camera_get_view_height(view_camera[0]);
    
    if (bbox_left < (camx - 100) || bbox_right > (camx + camw + 100) || bbox_bottom < (camy - 100) || bbox_top > (camy + camh + 100))
        instance_destroy();
}
