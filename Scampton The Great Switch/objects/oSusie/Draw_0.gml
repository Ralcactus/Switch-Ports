Tyme += 1;

if (oAlways.PepSlide)
{
    x = StartX + (sin((Tyme + 30) * 0.05) * 10);
    y = StartY;
}
else
{
    x = StartX + Ax;
    y = StartY;
}

draw_sprite_ext(sSpamCar, 2, x + 59, y - 8, 2, 2, 0, c_white, image_alpha);
scrSha_RGBa(0.5 + White, 0.5 + White, 0.5 + White, 0);
White = -0.5;

if (Glow)
{
    if (GlowStage == 0)
    {
        GlowWhite += 0.2;
        
        if (GlowWhite == 1)
            GlowStage = 1;
    }
    
    scrSha_RGBa(GlowWhite, GlowWhite, GlowWhite, 0);
    
    if (GlowStage == 1)
    {
        GlowWhite -= 0.05;
        
        if (GlowWhite == 0)
        {
            Glow = false;
            GlowStage = 0;
        }
    }
}

draw_sprite_ext(sprite_index, image_index, x + KnockX + Ex, y, 2, 2, 0, c_white, image_alpha);

if (KnockX != 0)
    KnockX += 2;

if (SusieMouth && sprite_index == sSusie_Idle)
    draw_sprite_ext(sSusie_Ones, 1, x + KnockX, y, 2, 2, 0, c_white, image_alpha);

shader_reset();
draw_sprite_ext(sSpamCar, 1, x + 59, y - 8, 2, 2, 0, c_white, image_alpha);

if (sprite_index == sSusie_Rude && image_index == 23)
{
    image_index = 0;
    sprite_index = sSusie_Idle;
}

if (sprite_index == sSusie_Rude && image_index == 14)
{
    if (Shot)
    {
        Shot = false;
        
        if (_Rude)
            instance_create_depth(x + 125, y - 30, -9999, oRudeBuster);
    }
}
else
{
    Shot = true;
}

if (oAlways.GameON)
{
    if (sprite_index == sSusie_Rude && image_index == 16 && oMakeUI._Last && oMakeUI.End == "B")
    {
        sou(36);
        oSpamtonRig.persistent = true;
        oSpamtonRig.Animation = "Dead";
        oSpamtonRig.Var1 = 0;
        oSpamtonRig.Var2 = -10;
        oSpamtonRig.PowerAlpha = 0;
        oSpamtonRig.WholeROT = 0;
        oSpamtonRig.FallY = 5000;
        oSpamtonRig.BodX += 10;
        room_goto(rEnd);
    }
}

if ((sprite_index == sSusie_Fight && image_index == 5) || sprite_index == sSusie_Hit)
{
    image_speed = 0;
    FightTyme += 1;
}

if ((FightTyme == 23 && sprite_index == sSusie_Fight) || (FightTyme == 25 && sprite_index == sSusie_Hit))
{
    image_index = 0;
    image_speed = 1;
    FightTyme = 0;
    sprite_index = sSusie_Idle;
}

if (sprite_index == sSusie_Defend_P && image_index == 4)
    image_speed = 0;

if (sprite_index == sSusie_Act && image_index == 6)
    image_speed = 0;

if ((sprite_index == sSusie_Item && image_index == 6) || (sprite_index == sSusie_Spare && image_index == 8) || (sprite_index == sSusie_UnAct && image_index == 2))
    sprite_index = sSusie_Idle;

if (oAlways.GameON)
{
    if (oMakeUI.HP[1] > 0 && sprite_index == sSusie_Down)
    {
        sprite_index = sSusie_Idle;
        image_speed = 1;
        image_index = 0;
    }
    
    if (oMakeUI.StatusON && oMakeUI.HP[1] < 1)
        draw_sprite(sStunned, 0, x + 92 + (sin(Tyme * -0.05) * 20), (y - 80) + (cos(Tyme * 0.05) * 10));
}
