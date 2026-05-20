if (oSoul.Seed == "EndPattern")
    instance_destroy();

draw_self();
Tyme += 1;
Speed += 1;

if (Speed > 20)
    Speed = 20;

if ((round(Tyme / 2) * 2) == Tyme)
    speed = Speed;
else
    speed = 0;

x += oSoul.MoveX;
y += oSoul.MoveY;

if (WhiteDeath != 0)
{
    speed = 0;
}
else
{
    image_xscale = SaveScaleX;
    image_yscale = SaveScaleY;
    
    if (image_xscale != 1)
        image_xscale += 0.1;
    
    if (image_yscale != 1)
        image_yscale -= 0.1;
    
    SaveScaleX = image_xscale;
    SaveScaleY = image_yscale;
}

if (y < -100 || y > 580 || x < -100 || x > 740)
    instance_destroy();

if (sprite_index == sBullet_destroy && image_index == 4)
    instance_destroy();

image_xscale = 1;
image_yscale = 1;

if ((place_meeting(x, y, oGoldenPipis) || place_meeting(x - 9, y, oGoldenPipis) || place_meeting(x + 9, y, oGoldenPipis) || place_meeting(x, y - 15, oGoldenPipis) || place_meeting(x, y + 15, oGoldenPipis)) && oGoldenPipis.y == oMakeUI.Box_Y)
{
    sou(88);
    oGoldenPipis.Die = true;
}

image_xscale = SaveScaleX;
image_yscale = SaveScaleY;
