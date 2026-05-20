image_angle = oSoul.ROT;
x = oSoul.x;
y = oSoul.y;
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, make_color_rgb(BLUE, BLUE + ((oAlways.PointyGuard - 5) * 51), 255 + ((oAlways.PointyGuard - 5) * 51)), image_alpha);
image_xscale += (ScaleSpeed + (sin(oAlways.Tyme * 0.1) * 0.02));
image_yscale += (ScaleSpeed + (sin(oAlways.Tyme * 0.1) * 0.02));
Alpha -= 0.05;
image_alpha = Alpha;

if (oAlways.Chield != 0)
{
    if (oSoul.ChieldBlink <= 10)
        image_alpha = 0;
}

BLUE -= 3;
ScaleSpeed *= 0.95;

if (Alpha <= 0)
    instance_destroy();
