Tyme += 1;

if (Seed == "Star")
{
    if (Tyme == 1)
    {
        Var1 = irandom_range(-4, -1);
        image_index = 0;
        Var2 = irandom_range(-10, 10);
        Var3 = irandom_range(1, 3);
        x += irandom_range(-10, 10);
        y += irandom_range(-10, 10);
        image_speed = irandom_range(10, 20) / 10;
    }
    
    x += Var3;
    Var3 *= 0.95;
    y += Var1;
    Var1 *= 0.95;
    image_angle += Var2;
    
    if (image_index > 6)
        instance_destroy();
    
    if (Tyme >= 30)
        image_alpha -= 0.025;
}

if (Seed == "BlackB2")
{
    oAlways.BlackB2 += 0.05;
    
    if (Tyme == 15)
    {
        oAlways.BlackB2 = 0.75;
        instance_destroy();
    }
}

if (Seed == "BlackB2_2")
{
    oAlways.BlackB2 -= 0.05;
    
    if (Tyme == 15)
    {
        oAlways.BlackB2 = 0;
        instance_destroy();
    }
}

if (Seed == "FightStar")
{
    if (Tyme == 1)
    {
        Var1 = irandom_range(3, 5);
        x += (100 + irandom_range(-20, 20));
        y -= (50 + irandom_range(-20, 20));
    }
    
    x += Var1;
    image_alpha -= 0.025;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if ((Seed == "FightEEF_1" && image_index == 3) || (Seed == "FightEEF_2" && image_index == 4))
    instance_destroy();

if (Seed == "SoulOutSpawner")
{
    if ((round(Tyme / 5) * 5) == Tyme)
    {
        with (instance_create_depth(80, 300, -9999, oEEF))
        {
            Seed = "SoulOutGlow";
            sprite_index = sHeartOut;
            image_xscale = 1;
            image_yscale = 0.5;
        }
    }
    
    if (Tyme >= 15)
        instance_destroy();
}

if (Seed == "SoulOutGlow")
{
    image_xscale += 0.3;
    image_yscale += 0.3;
    image_alpha -= 0.075;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (Seed == "4Die")
{
    with (instance_create_depth(x, y, -20000, oEEF))
    {
        Seed = "4DieP";
        sprite_index = other.sprite_index;
        image_index = 0;
        direction = 135;
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
    }
    
    with (instance_create_depth(x, y, -20000, oEEF))
    {
        Seed = "4DieP";
        sprite_index = other.sprite_index;
        image_index = 1;
        direction = 45;
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
    }
    
    with (instance_create_depth(x, y, -20000, oEEF))
    {
        Seed = "4DieP";
        sprite_index = other.sprite_index;
        image_index = 2;
        direction = -45;
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
    }
    
    with (instance_create_depth(x, y, -20000, oEEF))
    {
        Seed = "4DieP";
        sprite_index = other.sprite_index;
        image_index = 3;
        direction = -135;
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
    }
    
    instance_destroy();
}

if (Seed == "4DieP")
{
    if (Tyme == 1)
        speed = 4 * image_yscale;
    
    speed *= 0.8;
    
    if (Tyme >= 2)
        image_alpha -= 0.1;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (Seed == "ChestBall")
{
    if (Tyme == 1)
    {
        Var1 = irandom_range(3, 7);
        Var2 = irandom_range(-5, -1);
        Var3 = irandom_range(-3, 1);
        Var4 = 127.5;
    }
    
    x += Var2;
    y += Var3;
    Var3 += 0.5;
    
    if (Tyme >= 100)
        instance_destroy();
}

if (Seed == "MoveSpamton")
{
    Var1 += 0.5;
    oSpamtonRig.BodY -= Var1;
    
    if (Var1 >= 20)
        instance_destroy();
}

if (Seed == "Smoke")
{
    image_xscale = 1;
    image_yscale = 1;
    x += Var1;
    y += Var2;
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (Seed == "Pipis_B")
{
    if (Tyme == 1)
    {
        Var1 = irandom_range(-14, 14) / 2;
        Var2 = irandom_range(-12, -2);
        depth -= 10000;
    }
    
    Var2 += 0.25;
    
    if ((round(Tyme / 2) * 2) == Tyme)
    {
        x += Var1;
        y += Var2;
        image_alpha -= 0.05;
    }
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (Seed == "BallBye")
{
    if (image_index == 4)
        instance_destroy();
}

if (Seed == "BlastRing")
{
    if (Var1 == 1)
        Var2 += 2.5;
    
    if (Var1 == 2)
        Var2 += 5;
    
    if (Var1 == 3)
        Var2 += 7.5;
    
    if (Var2 >= 600)
        instance_destroy();
}

if (Seed == "BlastRing2")
{
    Var2 += 5;
    image_xscale += 0.25;
    image_yscale += 0.25;
    
    if (Var2 >= 600)
        instance_destroy();
}

if (Seed == "4sDel")
{
    if (image_index == 3)
        instance_destroy();
}

if (Seed == "StarDown")
{
    if (Tyme == 1)
    {
        Var1 = irandom_range(-6, 6) / 2;
        Var2 = irandom_range(0, 4);
    }
    
    x += Var1;
    y += Var2;
    Var2 += 0.5;
    image_alpha -= 0.02;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (Seed == "FadeOut")
{
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (Seed == "DelayShakeSound")
{
    if (Tyme == 75)
    {
        oAlways.ShakePower = 5;
        oAlways.ShakeTyme = 5;
        sou(96);
        des(0);
    }
}
