if (Seed == "Star" || Seed == "FightStar" || Seed == "FightEEF_1" || Seed == "FightEEF_2" || Seed == "SoulOutGlow" || Seed == "4DieP" || Seed == "Smoke" || Seed == "Pipis_B" || Seed == "BallBye" || Seed == "4sDel" || Seed == "StarDown" || Seed == "FadeOut" || Seed == "Title" || Seed == "WhiteFade_1")
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, RGB, image_alpha);

if (Seed == "Hand Big")
{
    if (Tyme == 1)
        sou(82);
    
    Var1 = 0;
    
    while (Var1 < 6)
    {
        if (Tyme == 1)
        {
            Var3 = 0.7;
            image_alpha = 0;
        }
        
        if (Tyme > 10)
            image_alpha += 0.01;
        
        Var2 += Var3;
        Var3 -= 0.002;
        Var4 += Var7;
        Var7 += 0.00001;
        Var5 = sin((Var1 + Var4) * 1.05) * Var2;
        Var6 = cos((Var1 + Var4) * 1.05) * Var2;
        draw_sprite_ext(sHandEEF, 0, x + Var5, y + Var6, 2, 2, 10 + point_direction(x + Var5, y + Var6, x, y), RGB, image_alpha);
        Var1 += 0.5;
    }
    
    if (Tyme > 200)
        instance_destroy();
}

if (Seed == "Fade")
{
    draw_self();
    image_alpha -= 0.025;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (Seed == "ChestBall")
{
    draw_circle_color(x, y, Var1, RGB, RGB, false);
    RGB = make_color_rgb(Var4, Var4, Var4);
    Var4 -= 3;
}

if (Seed == "BlastRing")
    draw_circle_color(x, y, Var2, make_color_rgb(6, 184, 255), make_color_rgb(6, 184, 255), true);

if (Seed == "BlastRing2")
    draw_circle_color(x, y, Var2, make_color_rgb(255, 235, 0), make_color_rgb(255, 235, 0), true);

if (Seed == "InBall")
{
    draw_circle(x, y, Var3 / Var4, false);
    x += Var1;
    y += Var2;
    Var3 -= 1;
    
    if (Var3 <= 0)
        instance_destroy();
}

if (Seed == "BallFadeIU")
{
    if (Tyme == 1)
        Var2 = irandom_range(7, 11);
    
    Var1 += Var2;
    Var2 -= 0.5;
    draw_circle(x, y, Var1, false);
    
    if (Var1 <= 0 && Tyme > 10)
        instance_destroy();
}

if (Seed == "WhiteFade_1")
{
    if (Var1 == 0)
        image_alpha += 0.005;
    
    if (Var1 == 20)
    {
        image_alpha -= 0.02;
        
        if (image_alpha <= 0)
        {
            with (instance_create_depth(0, 0, 0, oCC))
                Seed = "SpamtonFinal_1";
            
            instance_destroy();
        }
    }
    
    if (image_alpha >= 1 && Var1 < 20)
        Var1 += 1;
    
    if (Var1 == 1)
    {
        image_alpha = 1;
        instance_destroy(oPattern);
        instance_destroy(oWhiteAttack);
        instance_destroy(oBlueAttack);
        
        with (oTextEngine)
        {
            if (Spez == "Final_HP")
                instance_destroy();
        }
        
        oSoul.x = 320;
        oSoul.y = 1239;
        oMakeUI.Box_Xscale = 8;
        oMakeUI.Box_Yscale = 8;
        oMakeUI.Box_Y = 1071;
        oKris.image_alpha = 1;
        oSusie.image_alpha = 1;
        oRalsei.image_alpha = 1;
        oSpamtonRig.BodX = 750;
        oSpamtonRig.BodY = 150;
        oSpamtonRig.Alpha = 1;
        oAlways.BlackB2 = 0;
        oSoul.CanMove = false;
        oSoul.CanShot = false;
    }
}

if (Seed == "ActUP")
{
    if (Tyme < 0)
        image_alpha = 0;
    
    if (Tyme == 1)
    {
        image_alpha = 1;
        i2 = 3;
    }
    
    if (Tyme == 5)
        i2 = 1.5;
    
    if (Tyme == 9)
        i2 = 2.25;
    
    if (Tyme == 13)
        i2 = 2;
    
    if (rTyme(2, Tyme) && i1 == 0 && Tyme > 12)
        y -= 4;
    
    if (rTyme(8, Tyme) && Tyme >= 30)
    {
        image_alpha -= 0.25;
        
        if (image_alpha <= 0)
            des(0);
    }
    
    DrawOutline(113, i1, x, y, i2, i2, 0, Var1, image_alpha);
}

if (Seed == "IceMake")
{
    if (Tyme > 10)
        draw_sprite_ext(sFrost, 0, x - 35, y - 35, 2, 2, 0, c_white, 1);
    
    if (Tyme > 20)
        draw_sprite_ext(sFrost, 0, x + 35, y - 35, 2, 2, 0, c_white, 1);
    
    if (Tyme > 30)
        draw_sprite_ext(sFrost, 0, x, y + 35, 2, 2, 0, c_white, 1);
    
    if (Tyme >= 40)
    {
        with (instance_create_depth(x - 35, y - 35, 0, oEEF))
            Seed = "IceMake2";
        
        with (instance_create_depth(x + 35, y - 35, 0, oEEF))
            Seed = "IceMake2";
        
        with (instance_create_depth(x, y + 35, 0, oEEF))
            Seed = "IceMake2";
        
        Damage = 175;
        
        if (oMakeUI.Stat[4] != 0)
            Damage = round(Damage * 1.5);
        
        oMakeUI.SpamtonHP -= Damage;
        scrNumber(320, 125, 288, make_color_rgb(255, 235, 59), 0, Damage, 0);
        oSpamtonRig.LimbShake = 10;
        des(0);
    }
}

if (Seed == "IceMake2")
{
    with (instance_create_depth(x, y, 0, oEEF))
    {
        Seed = "IceMake3";
        i1 = 0;
    }
    
    with (instance_create_depth(x, y, 0, oEEF))
    {
        Seed = "IceMake3";
        i1 = 60;
    }
    
    with (instance_create_depth(x, y, 0, oEEF))
    {
        Seed = "IceMake3";
        i1 = 120;
    }
    
    with (instance_create_depth(x, y, 0, oEEF))
    {
        Seed = "IceMake3";
        i1 = 180;
    }
    
    with (instance_create_depth(x, y, 0, oEEF))
    {
        Seed = "IceMake3";
        i1 = 240;
    }
    
    with (instance_create_depth(x, y, 0, oEEF))
    {
        Seed = "IceMake3";
        i1 = 300;
    }
    
    des(0);
}

if (Seed == "IceMake3")
{
    if (Tyme == 1)
        image_alpha = 0.5;
    
    direction = i1;
    speed = 4;
    i1 += 7;
    image_angle += 5;
    draw_sprite_ext(sFrost, 0, x, y, 1, 1, image_angle, c_white, image_alpha);
    
    if (Tyme <= 25)
    {
        if (rTyme(3, Tyme))
            image_alpha += 0.1;
    }
    else
    {
        if (rTyme(3, Tyme))
            image_alpha -= 0.2;
        
        if (image_alpha <= 0)
            des(0);
    }
}

if (Seed == "SmokePop")
{
    if (Tyme == 0)
    {
        i1 = 0.5;
        i2[0] = iRan(-3, 3) * 2;
        i2[1] = iRan(-3, 3) * 2;
        i2[2] = iRan(-3, 3) * 2;
        i3[0] = 0;
        i3[1] = 0;
        i3[2] = 0;
    }
    
    i3[0] += i2[0];
    i3[1] += i2[1];
    i3[2] += i2[2];
    draw_sprite_ext(sSmoke, 0, (x + 10) - ((Tyme / 1.75) * 2), y - (Tyme * 0.75 * 2), 1, 1, i3[0], c_white, i1);
    draw_sprite_ext(sSmoke, 0, (x + 10) - (Tyme * 0.75 * 2), y, 1.5, 1.5, i3[1], c_white, i1);
    draw_sprite_ext(sSmoke, 0, (x + 10) - ((Tyme / 1.75) * 2), y + (Tyme * 0.75 * 2), 1, 1, i3[2], c_white, i1);
    
    if (rTyme(2, Tyme))
        i1 -= 0.05;
    
    if (i1 <= 0 && Tyme > 5)
        des(0);
}

if (Seed == "CupFU")
{
    i1 = 0;
    
    repeat (oPattern.i1)
    {
        x = oPattern.BoxX - 175;
        y = oPattern.BoxY;
        RotSka(Var1 + -350 + ((360 / oPattern.i1) * i1), oPattern.k1, oPattern.k2);
        draw_sprite_ext(sCup, 12, x, y, 2, 2, 0, c_white, 1);
        i1++;
    }
}

if (Seed == "BombCloud")
{
    if (Tyme == 0)
    {
        j1 = 5;
        j2 = 0;
        j3 = 0;
        image_alpha = 0;
    }
    
    if (Tyme < 25)
    {
        image_alpha += 0.1;
    }
    else
    {
        image_alpha -= 0.1;
        
        if (image_alpha <= 0)
            des(0);
    }
    
    i1 = 0;
    j2 += j1;
    j1 -= 0.15;
    j3 += 10;
    
    repeat (10)
    {
        draw_sprite_ext(sSmoke, 0, x + RotMx(i1, j2), y + RotMy(i1, j2), 2, 2, j3, c_white, image_alpha);
        i1 += 36;
    }
}

if (Seed == "BallBallBall")
{
    with (oCC2)
    {
        if (StringContains(Seed, "(PepIn2)"))
            other.i1 = i3[5];
    }
    
    if (i1 < 17)
        i2 += 25.5;
    
    if (i2 >= 255)
        des(0);
    
    draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, 0, rgb(255 - i2, 255 - i2, 255 - (i2 * 0.95)), 1);
}

if (Seed == "ScisEEF")
{
    x -= 2;
    
    if (rTyme(6, Tyme))
        image_alpha -= 0.25;
    
    if (image_alpha <= 0)
        des(0);
    
    draw_self();
}

if (Seed == "Fadein_in_in")
{
    if (Tyme == 1)
        i1 = 1;
    
    draw_sprite_ext(sWhite, 0, 0, 0, 100, 100, 0, c_black, i1);
    
    if (rTyme(20, Tyme) && Tyme > 25)
        i1 -= 0.25;
    
    if (i1 == 0)
        des(0);
}

if (Seed == "Fadein_in_normal")
{
    if (Tyme == 1)
        i1 = 1;
    
    draw_sprite_ext(sWhite, 0, 0, 0, 100, 100, 0, c_black, i1);
    
    if (rTyme(20, Tyme))
        i1 -= 0.25;
    
    if (i1 == 0)
        des(0);
}

if (Seed == "SparkelSpa")
{
    if (Tyme == 1)
        i1 = iRan(-10, 10);
    
    i2 += i1;
    image_xscale = sin(Tyme * 0.1);
    image_yscale = sin(Tyme * 0.1);
    
    if (Tyme > 10 && image_xscale <= 0)
        des(0);
    else
        draw_sprite_ext(sShine, 0, x, y, image_xscale * 0.5, image_yscale * 0.5, i2, c_white, 1);
}
