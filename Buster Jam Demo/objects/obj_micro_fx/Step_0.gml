anim_logic();
x += (hspd * global.delta_game_factor);
vspd += (grav * global.delta_game_factor);
y += (vspd * global.delta_game_factor);
get_cams(1);

if (die_outside_view)
{
    if (x < (camx - 200) || x > (camx + camw + 200) || (y < (camy - 200) && die_outside_view_top) || y > (camy + camh + 200))
        instance_destroy();
}

image_angle -= (rotate_spd * global.delta_game_factor);
