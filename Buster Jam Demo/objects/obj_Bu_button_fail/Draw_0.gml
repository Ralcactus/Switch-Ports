if (!draw_me)
    exit;

var _data = video_draw();
var _status = _data[0];

if (_status == 0)
{
    var _surface = _data[1];
    var _xscale = controller.game_width / 640;
    var _yscale = controller.game_height / 360;
    draw_surface_ext(_surface, x, y, _xscale, _yscale, 0, c_white, 1);
}
