if (idraw)
{
    var cam_width = camw;
    var cam_height = camh;
    var cam_x = camx;
    var cam_y = camy;
    var cam_middle = obj_player.x - cam_x;
    
    if (!surface_exists(darkSurf))
        darkSurf = surface_create(cam_width, cam_height);
    else
    {
        surface_set_target(darkSurf);
        draw_clear_alpha(c_black, 0.6);
        draw_set_blend_mode(bm_subtract);
        draw_triangle_color(cam_middle, -150, cam_middle - 250, cam_height, cam_middle + 250, cam_height, c_black, 0, 0, 0);
        draw_set_blend_mode(bm_normal);
        draw_set_alpha(1);
        surface_reset_target();
    }
    
    draw_surface(darkSurf, cam_x, cam_y);
}
