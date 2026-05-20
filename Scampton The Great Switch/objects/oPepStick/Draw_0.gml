y = oMakeUI.HUDy + 294;
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, make_color_rgb(i, i, 255), image_alpha);

if (image_alpha <= 0)
    instance_destroy();

Walk += 0.0075;

if (Seed == "L")
    x += Walk;
else
    x -= Walk;

Tyme += 1;

if (Tyme > 10)
{
    image_alpha -= 0.0125;
    i -= 2;
}
