exit;

if (!ready)
    exit;

draw_set_font(fnt_editor);
var _yoff = 0;
var _str = ["UP", "DOWN", "RIGHT", "LEFT"];
var _ylast;

for (var i = 0; i < 4; i++)
{
    draw_text(5, _yoff + 5 + (50 * i), string("{0}:{1}", _str[i], myclamp[i]));
    draw_text(5, _yoff + 25 + (50 * i), string("{0} TO:{1}", _str[i], myclamp_to[i]));
    draw_text(5, _yoff + 45 + (50 * i), string("{0} DIR:{1}", _str[i], myclamp_dir[i]));
    _ylast = _yoff + 45 + (50 * i);
    _yoff += 25;
}

draw_text(5, _ylast + 50, string("Y_RADIUS:{0}", y_radius));
draw_text(5, _ylast + 100, string("pos:({0},{1})", x, y));
