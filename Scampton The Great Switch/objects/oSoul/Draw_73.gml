depth = -20000;
Tyme += 1;

if (i_Frames > 0)
{
    I_Blink += 1;
    
    if (I_Blink <= 10)
    {
        if (SoulMode == 0)
        {
            _R = 255;
            _G = 255;
            _B = 255;
        }
        
        if (SoulMode == 1)
        {
            _R = 12;
            _G = 132;
            _B = 209;
        }
    }
    
    if (I_Blink == 20)
        I_Blink = 0;
}
else
{
    I_Blink = 0;
}

RGB = make_color_rgb(_R, _G, _B);

if (Seed == "Glide")
{
    glideTime++;
    RGB = make_color_rgb(0, 255, 255);
    TargetROT = 90;
    ROT = TargetROT;
    x += ((oMakeUI.Box_X - StartX) / 15);
    y += ((oMakeUI.Box_Y - StartY) / 15);
    
    if (glideTime == 15)
    {
        CanShot = true;
        CanMove = true;
        Seed = "Play";
        TargetROT = 90;
        x = oMakeUI.Box_X;
        y = oMakeUI.Box_Y;
    }
}

if (Seed == "EndPattern")
{
    BigTyme = 0;
    audio_stop_sound(snd_chargeshot_charge);
    RGB = make_color_rgb(0, 255, 255);
    TargetROT = 90;
    ROT = TargetROT;
    x += ((80 - EndX) / 25);
    y += ((300 - EndY) / 25);
    
    if (x <= 80)
    {
        oMakeUI.ResMemb = true;
        
        if (oMakeUI.Pattern != "L1")
        {
            with (instance_create_depth(0, 0, -9999, oEEF))
                Seed = "SoulOutSpawner";
        }
        
        instance_destroy();
    }
}

if (Seed == "AN")
{
    if (Tyme == 1)
        sou(10);
    
    if (Tyme == 120)
        sou(93);
    
    if (Tyme > 120 && Tyme < 130)
        ROT += 10;
    
    if (Tyme == 131)
        ROT += 8;
    
    if (Tyme == 132)
        ROT += 6;
    
    if (Tyme == 133)
        ROT += 4;
    
    if (Tyme == 134)
        ROT += 2;
    
    if (Tyme == 136)
        ROT -= 2;
    
    if (Tyme == 137)
        ROT -= 4;
    
    if (Tyme == sFont_HP)
        ROT -= 6;
    
    if (Tyme == 140)
        ROT -= 4;
    
    if (Tyme == 142 || Tyme == 93)
        ROT -= 2;
    
    if (Tyme == 180)
    {
        sou(68);
        CanShot = true;
        oAlways.ShakeTyme = 10;
        oAlways.ShakePower = 5;
        
        with (instance_create_depth(x, y, -9999, oCC))
        {
            sprite_index = sSoul;
            image_speed = 0;
            image_index = 3;
            Seed = "SoulPlod";
        }
    }
}

if ((!CanMove && !ForceSound) || !CanShot)
    audio_stop_sound(snd_chargeshot_charge);

ROT += ((TargetROT - ROT) / 5);
Size += ((1 - Size) / 5);

if (BigTyme >= (BigHoldTime - 5))
{
    BigAlpha += 0.1;
    
    if (BigAlpha > 1)
        BigAlpha = 1;
    
    _R = 0;
    _G = 255;
    _B = 255;
    ChargeSound += 1;
    
    if (ChargeSound == 1)
        audio_play_sound(snd_chargeshot_charge, 50, true);
    
    if ((ChargeSound / 50) <= 1)
        audio_sound_pitch(snd_chargeshot_charge, ChargeSound / 50);
    
    draw_sprite_ext(sSoul, 0, x, y, 1 + (sin(Tyme * 0.1) * (1 + (oAlways.MultiShot / 10))), 1 + (sin(Tyme * 0.1) * (1 + (oAlways.MultiShot / 10))), ROT, make_color_rgb(255, 200, 64), 0.25 * BigAlpha);
    draw_sprite_ext(sSoul, 0, x, y, 1 + (sin((20 + Tyme) * 0.1) * (1 + (oAlways.MultiShot / 10))), 1 + (sin((20 + Tyme) * 0.1) * (1 + (oAlways.MultiShot / 10))), ROT, make_color_rgb(255, 200, 64), 0.25 * BigAlpha);
    draw_sprite_ext(sSoul, 0, x, y, 1 + (sin((40 + Tyme) * 0.1) * (1 + (oAlways.MultiShot / 10))), 1 + (sin((40 + Tyme) * 0.1) * (1 + (oAlways.MultiShot / 10))), ROT, make_color_rgb(255, 200, 64), 0.25 * BigAlpha);
}
else
{
    BigAlpha -= 0.1;
    
    if (BigAlpha < 0)
        BigAlpha = 0;
    
    if (SoulMode == 0)
    {
        _R = 255;
        _G = 255;
        _B = 64;
    }
    
    if (SoulMode == 1)
    {
        _R = 0;
        _G = 255;
        _B = 255;
    }
}

if (HH)
    image_alpha = 0;

draw_sprite_ext(sSoul, 0, x, y, Size, Size, ROT, RGB, image_alpha);

if (CanShot && SoulMode == 0)
    draw_sprite_ext(sSoul, 4, x, y, Size, Size, ROT, c_white, 1);

if (I_Blink <= 10 && i_Frames > 0)
    draw_sprite_ext(sSoul, 5, x, y, 1, 1, ROT, make_color_rgb(225, 225, 255), image_alpha);
else
    draw_sprite_ext(sSoul, 5, x, y, Size, Size, ROT, c_white, image_alpha);

if (Tyme <= 5 && Seed == "AN")
    draw_sprite_ext(sSoul, 1, x, y, Size, Size, ROT, c_white, 0.75);
