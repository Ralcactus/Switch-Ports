if (!surface_exists(surf))
    surf = surface_create(640, 480);

var i = 0;
var data = [];

with (oPuppet)
    array_push(data, [sprite_index, image_index, x + eX + shakeXY[0] + ((-320 + x) * 0.1 * !array_contains(atribute, "lockShadow")), y + eY + shakeXY[1] + ((-400 + y) * 0.1), image_xscale, image_yscale, image_angle + eAngle, 0, image_alpha * 0.25]);

surface_set_target(surf);
draw_clear_alpha(c_white, 0);
i = 0;

repeat (array_length(data))
{
    ext(data[i][0], data[i][1], data[i][2], data[i][3], data[i][4], data[i][5], data[i][6], data[i][7], 1);
    i++;
}

surface_reset_target();
var alpha = 0.25;
draw_surface_ext(surf, 0, 0, 1, 1, 0, c_black, alpha);
