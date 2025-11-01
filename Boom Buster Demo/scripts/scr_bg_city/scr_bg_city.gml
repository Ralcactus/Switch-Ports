function scr_bg_city()
{
    get_cams();
    var _yoff = 0;
    var _yoff_clouds = 0;
    draw_sprite_ext(bgr_city_sky, 0, camx, camy, camw, 1, 0, c_white, 1);
    draw_sprite_ext(bgr_city_clouds, 0, (camx + clouds_x) - sprite_get_width(bgr_city_clouds), camy + _yoff_clouds, 1, 1, 0, c_white, 1);
    draw_sprite_ext(bgr_city_clouds, 0, camx + clouds_x, camy, 1, 1, 0, c_white, 1);
    draw_sprite_ext(bgr_city_clouds, 0, camx + clouds_x + sprite_get_width(bgr_city_clouds), camy + _yoff_clouds, 1, 1, 0, c_white, 1);
    draw_sprite_ext(bgr_city_blue, 0, camx, camy + _yoff, 1, 1, 0, c_white, 1);
    
    if (exit_freeze())
        td_shake = false;
    
    var _shakex = irandom_range(-2, 2) * td_shake;
    td_y += (td_shake * 0.8);
    draw_sprite_ext(bgr_city_thosedirt, 0, (camx * 0.95) + _shakex, (camy * 0.95) + td_y, 1, 1, 0, c_white, 1);
    draw_bg_overlay(14285772, 0.255);
    draw_sprite_ext(bgr_city_orange, 0, camx * 0.9, (camy * 0.9) + _yoff, 1, 1, 0, c_white, 1);
    draw_sprite_ext(bgr_city_red, 0, camx * 0.8, (camy * 0.8) + _yoff, 1, 1, 0, c_white, 1);
    draw_sprite_ext(bgr_city_road, 0, camx * 0.65, (camy * 0.65) + _yoff, 1, 1, 0, c_white, 1);
    var _w = sprite_get_width(bgr_city_yellow);
    var _x = camx * 0.5;
    draw_sprite_ext(bgr_city_yellow, 0, _x + (1040 * obj_controller.zoom), (camy * 0.5) + _yoff, 1, 1, 0, c_white, 1);
    draw_bg_overlay(14285772, 0.325);
    
    if (!exit_freeze())
        clouds_x += 0.15;
    
    if (clouds_x >= sprite_get_width(bgr_city_clouds))
        clouds_x -= clouds_x;
}
