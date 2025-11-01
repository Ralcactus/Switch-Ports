function get_cams(arg0 = 0)
{
    camx = camera_get_view_x(view_camera[arg0]);
    camy = camera_get_view_y(view_camera[arg0]);
    camw = camera_get_view_width(view_camera[arg0]);
    camh = camera_get_view_height(view_camera[arg0]);
}
