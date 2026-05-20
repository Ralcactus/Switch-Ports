if (Seed == "Nail_1")
{
    draw_self();
    
    if (Tyme < 80)
    {
        draw_sprite_ext(sSpamRig, 11, x, y, 1, 60, point_direction(230, -100, x, y) + 90, c_white, 1);
    }
    else
    {
        with (oCC)
        {
            if (Seed == "Nail_1_String")
                instance_destroy();
        }
        
        with (instance_create_depth(oSpamtonRig.RightHandX, oSpamtonRig.RightHandY, -9999, oCC))
        {
            Var2 = point_direction(oSpamtonRig.RightHandX, oSpamtonRig.RightHandY, other.x, other.y);
            Seed = "Nail_1_String";
            sprite_index = sString;
        }
    }
}

if (Seed == "Nail_1_String")
{
    Var1 = true;
    image_angle = Var2;
    image_yscale = 2;
    
    while (Var1)
    {
        image_xscale += 1;
        
        if (place_meeting(x, y, oCC))
            Var1 = false;
    }
    
    image_xscale *= 0.5;
    image_xscale += 8;
    x += (cos(image_angle / 57) * image_xscale);
    y -= (sin(image_angle / 57) * image_xscale);
    draw_self();
}

if (Seed == "String_2" || Seed == "RB_EEF" || Seed == "RB_PLOD" || Seed == "InstaGone" || Seed == "WASD_BT" || Seed == "DrawSelf" || Seed == "FinalShot" || Seed == "Wish" || Seed == "SusFade" || Seed == "MarsEND")
    draw_self();

if (Seed == "AAA")
{
    if (Tyme > 80)
        image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
    
    Var1 += 0.5;
    Var2 = 0;
    x = StartX;
    y = StartY;
    sprite_index = sAAA;
    image_index = 0;
    image_xscale = 2;
    image_yscale = 2;
    
    while (round(Var1) != Var2)
    {
        Var2 += 1;
        
        if (Var2 > 4)
            image_index = 1;
        
        if (Var2 > 6)
            image_index = 2;
        
        y += irandom_range(-1, 1);
        x += irandom_range(-1, 1);
        draw_self();
        y -= 25;
        x -= (5 + (Var2 * 3.5));
        image_xscale += 0.1;
        image_yscale += 0.1;
    }
}

if (Seed == "FinHeart_1" || Seed == "FinHeart_2")
{
    image_angle += ((-90 - image_angle) / 10);
    Var1 = ((oSpamtonRig.BodX + irandom_range(-2, 2)) - x) / 10;
    Var2 = ((oSpamtonRig.BodY + irandom_range(-2, 2)) - y) / 10;
    Var3 = 0;
    Var5 += Var4;
    Var4 *= 0.8;
    
    if (Var5 != 0)
    {
        image_alpha -= 0.02;
        
        if (image_alpha <= 0)
            instance_destroy();
    }
    
    repeat (10)
    {
        Var3 += 1;
        draw_sprite_ext(sSpamBall, 0, x + (Var1 * Var3), y + (Var2 * Var3), 1, 1, 0, c_white, image_alpha);
    }
    
    draw_self();
    
    if (Seed == "FinHeart_1")
    {
        x += (((oKris.x + 275 + Var5) - x) / 10);
        y += ((((oKris.y - 60) + (sin(TymeFree * 0.05) * 5)) - y) / 10);
    }
    
    if (Seed == "FinHeart_2")
    {
        x += (((oRalsei.x + 275 + Var5) - x) / 10);
        y += ((((oRalsei.y - 60) + (cos(TymeFree * 0.05) * 5)) - y) / 10);
    }
    
    if (TymeFree == 1)
        sou(31);
    
    if (TymeFree == 75)
    {
        Var4 = 40;
        sou(61);
        oSpamtonRig.MovX = 5;
        
        with (instance_create_depth(x, y, -9999, oCC))
        {
            if (other.Seed == "FinHeart_1")
                Spez = 1;
            
            Seed = "FinalShot";
            sprite_index = sBigBulletBlue;
            image_angle = 180;
            image_xscale = 0;
            image_yscale = 3;
            Var1 = 10;
        }
    }
}

if (Seed == "FinalShot")
{
    Var1 += 0.25;
    x -= Var1;
    
    if (image_xscale != 2)
        image_xscale += 0.2;
    
    if (image_yscale != 2)
        image_yscale -= 0.1;
    
    if (x < -300)
        instance_destroy();
    
    if ((round(TymeFree / 2) * 2) == TymeFree)
    {
        with (instance_create_depth(x, y, -9999, oCC))
        {
            sprite_index = sBigBulletBlue;
            image_xscale = other.image_xscale;
            image_yscale = other.image_yscale;
            Seed = "Fade";
            image_angle = 180;
        }
    }
    
    if (TymeFree == 10 && Spez == 1)
    {
        sou(67);
        oMakeUI.StatusON = true;
        oAlways.ShakeTyme = 10;
        oAlways.ShakePower = 5;
        oMakeUI.HP[0] = -3;
        oMakeUI.HP[2] = -5;
        oKris.sprite_index = sKris_Down;
        scrNumber(oKris.x + 25, oKris.y - 30, 288, make_color_rgb(255, 0, 0), "DOWN", "#", 0);
        oRalsei.sprite_index = sRalsei_Down;
        scrNumber(oRalsei.x + 25, oRalsei.y - 30, 288, make_color_rgb(255, 0, 0), "DOWN", "#", 0);
        oSusie.sprite_index = sSusie_Ones;
        oSusie.image_index = 0;
        oSusie.SusieMouth = false;
        
        if (oMakeUI.Debug && false)
        {
            oMakeUI.HP[0] = 10;
            oMakeUI.HP[2] = 10;
        }
        
        if (oMakeUI.HP[1] < 30)
            oMakeUI.HP[1] = 30 + (irandom_range(1, 4) * 5);
    }
}

if (Seed == "Fade")
{
    draw_self();
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (Seed == "FinPower")
{
    if (TymeFree == 1)
    {
        Var1 = 0;
        
        repeat (array_length(oMakeUI.Items))
        {
            oMakeUI.Items[Var1] = "BurntPipis";
            Var1 += 1;
        }
    }
    
    if (oAlways.BCspeed != 0)
        oAlways.BCspeed -= 0.01;
    
    oSpamtonRig.BackBlackA += ((1 - oSpamtonRig.BackBlackA) / 10);
    oSpamtonRig.PowerAlpha += ((1 - oSpamtonRig.PowerAlpha) / 10);
    oTP.ExtraX += ((0 - oTP.ExtraX) / 10);
    oMakeUI.HUDy += ((0 - oMakeUI.HUDy) / 10);
    
    if (oMakeUI.Spare >= 100)
    {
        oSpamtonRig.Animation = "Dead";
        oSpamtonRig.Var1 = 0;
        oSpamtonRig.Var2 = 0;
        oSpamtonRig.PowerAlpha = 0;
        oSpamtonRig.WholeROT = 0;
        instance_destroy();
    }
}

if (Seed == "KeySoul")
{
    draw_sprite_ext(sSoul, 0, x, y, 1, 1, -90, make_color_rgb(255, 0, 0), 1);
    
    if (keyboard_check(vk_left))
        x = 270;
    
    if (keyboard_check(vk_right))
        x = 370;
    
    if ((keyboard_check(ord("Z")) || keyboard_check(vk_enter)) && x != 320)
    {
        if (x == 370)
            oP.KeyT = 2;
        
        oP.MM_KeyTyme = 50;
        room_goto(rBattle);
    }
}
