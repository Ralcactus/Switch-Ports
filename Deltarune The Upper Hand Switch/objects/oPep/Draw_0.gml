ty++;

if (ty == 1)
{
    realName = op.party[numb];
    pepAn(numb, 10, "stop");
}

if (ty == 40)
{
    get_stats(realName);
    
    if (sprite_index == jam2[10])
        pepAn(numb, 2, "idle");
}

glowWhite = 0;

if (oBUI.pNamesT && oBUI.cur == numb)
    glowWhite = 0.5 + (sin(op.ti * 0.05) * 0.5);

if (popWhite > 0)
    popWhite -= 0.1;

if (anMode == "stop")
{
    if (imageCount < image_index)
        imageCount = image_index;
    
    if (imageCount > image_index)
        image_index = imageCount;
}

if (knockX < 0)
{
    knockX++;
    
    if (knockX == 0 && op.hp[numb] > 0 && oBUI.actions[numb][3] != 5)
        pepAn(numb, 2, "idle");
}

mw = glowWhite + popWhite;
mx = x + eX + knockX;
my = y + eY;
my += (dsin((op.ti * 2) + (numb * 120)) * 2);
ext(sRock, numb + (op.superMode * 3), mx - knockX, my, 2, 2, undefined, undefined, image_alpha);
ext(sprite_index, image_index, mx, my, 2, 2, image_angle, 16777215, image_alpha, mw);

if (op.benMode)
    ext(sBen, 0, mx + 10, my - 50, -0.5, 0.5);
