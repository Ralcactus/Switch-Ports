function scr_bg_city_sunset()
{
    get_cams();
    var _dome;
    
    if (global.stage == 7)
        _dome = bgr_city_sunset_dome_wizard;
    else
        _dome = bgr_city_sunset_dome;
    
    draw_sprite_ext(bgr_city_sunset, 0, camx - 64, camy, 1, 1, 0, c_white, 1);
    draw_sprite_ext(bgr_city_sunset_clouds, 0, camx + clouds_x, camy, 1, 1, 0, c_white, 1);
    draw_sprite_ext(bgr_city_sunset_clouds, 0, camx + clouds_x + sprite_get_width(bgr_city_sunset_clouds), camy, 1, 1, 0, c_white, 1);
    draw_sprite_ext(bgr_city_sunset, 1, (camx * 0.9) - 64, camy, 1, 1, 0, c_white, 1);
    draw_sprite_ext(_dome, 0, (camx * 0.85) - 64, camy - 20, 1, 1, 0, c_white, 1);
    
    if (global.dome_ind != -1)
        draw_sprite_ext(_dome, global.dome_order[global.dome_ind], (camx * 0.85) - 64, camy - 20, 1, 1, 0, c_white, global.dome_alpha);
    
    draw_sprite_ext(bgr_city_sunset, 2, (camx * 0.72) - 55, camy, 1, 1, 0, c_white, 1);
    draw_sprite_ext(bgr_city_sunset, 3, (camx * 0.64) - 32, camy, 1, 1, 0, c_white, 1);
    
    if (!exit_freeze())
    {
        clouds_x -= 0.15;
        timer_logic(0);
        global.dome_alpha = approach(global.dome_alpha, global.dome, 0.01);
    }
    
    if (clouds_x <= -sprite_get_width(bgr_city_sunset_clouds))
        clouds_x -= clouds_x;
}
