if (array_contains(atribute, "gui"))
    ext(sprite_index, image_index, x + eX + shakeXY[0], y + eY + shakeXY[1], image_xscale, image_yscale, image_angle + eAngle, image_blend, image_alpha);

if (op.dateText && false)
{
    d_text(x, y - 65, string(numb));
    d_text(x, y - 50, atribute);
    d_text(x, y - 35, string(x) + "," + string(y));
}
