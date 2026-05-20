if (oSoul.Seed == "EndPattern")
    instance_destroy();

draw_self();
Tyme += 1;

if ((round(Tyme / 2) * 2) == Tyme)
    speed = 20;
else
    speed = 0;

x += oSoul.MoveX;
y += oSoul.MoveY;

if (HIT)
    speed = 0;

if (y < -100 || y > 580 || x < -100 || x > 740)
    Destroy = true;

if (Destroy)
{
    if (Way == 1)
    {
        oSoul.W_bul -= 1;
        instance_destroy();
    }
    
    if (Way == 2)
    {
        oSoul.S_bul -= 1;
        instance_destroy();
    }
    
    if (Way == 3)
    {
        oSoul.A_bul -= 1;
        instance_destroy();
    }
    
    if (Way == 4)
    {
        oSoul.D_bul -= 1;
        instance_destroy();
    }
}

if (sprite_index == sBullet_destroy && image_index == 4)
    instance_destroy();
