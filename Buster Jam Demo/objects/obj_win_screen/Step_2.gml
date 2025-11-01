testvariablenothing = false;
cam_xoff = sin(time * pi) * 3;
cam_yoff = cos((time * pi) + 0.05) * 2;
cam_xoff = 0;
cam_yoff = 0;
var _zoomXoff = (960 * (1 - zoom)) + cam_xoff;
var _zoomYoff = (540 * (1 - zoom)) + cam_yoff;
camera_set_view_size(view_camera[0], 1920 * zoom, 1080 * zoom);
var _x = 0 + _zoomXoff;
var _y = 0 + _zoomYoff;
var _xoff, _yoff;

if (boss)
{
    _xoff = sin(pi * time) * 3;
    _yoff = sin(pi * time * 1.5) * -3;
}
else
{
    _xoff = 0;
    _yoff = 0;
}

camera_set_view_pos(view_camera[0], _x + _xoff, _y + _yoff);

if (!ready)
    exit;

if (boss)
    zoom = easy_smooth(zoom, 0.98, 5);
else
    zoom = easy_smooth(zoom, 1, 5);
