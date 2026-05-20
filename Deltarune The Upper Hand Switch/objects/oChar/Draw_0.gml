if (shake > 0)
{
    shake--;
    
    if (shakeX == 0 || shakeX < 0)
        shakeX = shakePower;
    else
        shakeX = -shakePower;
}
else
{
    shakeX = 0;
}

if (ty > 0)
{
    if (room == rSockTransformation)
    {
        if (oCC.i3 > 180)
        {
            if (numb == "k")
            {
                wobY = dsin((op.ti * 2) + 0) * 2;
                ext(sRock, 0, x + shakeX, y + wobY, 2, 2);
            }
            
            if (numb == "s")
            {
                wobY = dsin((op.ti * 2) + 120) * 2;
                ext(sRock, 1, x + shakeX, y + wobY, 2, 2);
            }
            
            if (numb == "r")
            {
                wobY = dsin((op.ti * 2) + 240) * 2;
                ext(sRock, 2, x + shakeX, y + wobY, 2, 2);
            }
        }
    }
    
    ext(sprite_index, image_index, x + shakeX, y + ey + wobY, image_xscale, image_yscale, image_angle, image_blend, image_alpha, 0);
}
