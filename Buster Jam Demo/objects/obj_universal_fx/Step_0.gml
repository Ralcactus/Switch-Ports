anim_logic();

if (bbox_top > (room_height + 400) || bbox_right < -400 || bbox_left > (room_width + 400) || bbox_bottom < -400)
    instance_destroy();

image_angle += rot_spd;
x += (hspd * global.delta_game_factor);
y += (vspd * global.delta_game_factor);
vspd += (grav * global.delta_game_factor);

if (fadeout)
{
    image_alpha = approach(image_alpha, 0, fade_spd);
    
    if (image_alpha <= 0)
        instance_destroy();
}
