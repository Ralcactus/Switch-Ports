if (!draw_me || inside_solid)
    exit;

if (instance_exists(follow) && !follow.draw_me)
    exit;

draw_set_color(c_black);

if (scale_out)
    draw_set_alpha(image_alpha * 0.48 * scale);
else
    draw_set_alpha(image_alpha);

var _y = y - 2;
var _height = 0.4;
draw_ellipse(x - (width * scale), _y - (width * _height * scale), x + (width * scale), _y + (width * _height * scale), false);
draw_set_alpha(1);
draw_set_color(c_white);
