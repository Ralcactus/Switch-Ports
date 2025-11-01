camera_set_view_size(view_camera[view], game_width, game_height);
camera_set_view_pos(view_camera[view], 0, 0);
view_visible[view] = true;
surface_should_create = true;
splash_go = true;

if (has_splash)
{
    splash_go = false;
    timer[timer_splashgo] = 14;
}

if (scale_inout)
    scale_in = 0;

timer[8] = jumpcut_delay;
