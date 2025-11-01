testvariablenothing = false;
time_xmove += (xmove_spd * global.delta_game_factor);
time_ymove += (ymove_spd * global.delta_game_factor);
scroll_x += (scroll_xspd * global.delta_game_factor);

if (scroll_x < -1920 || scroll_x > 1920)
    scroll_x -= scroll_x;

xmove = sin(time_xmove * pi) * xmove_length;
ymove = cos(time_ymove * pi) * ymove_length;

if (bounce)
{
    bounce_vspd += (bounce_grav * bounce_mult * global.delta_game_factor);
    bounce_y += (bounce_vspd * global.delta_game_factor);
    
    if ((bounce_y + bounce_vspd) > 100 && bounce_vspd > 0)
        bounce_vspd = bounce_height * bounce_mult;
}

timer_logic(6);
jumpcut_off = approach(jumpcut_off, 0, 0.1);

for (var i = 0; i < 2; i++)
{
    screenshake_draw[i] = random_range(-screenshake[i], screenshake[i]);
    screenshake[i] = approach(screenshake[i], 0, screenshake_dec);
}
