Tyme += 1;

if (oAlways.PepSlide)
{
    x = StartX + (sin(Tyme * 0.05) * 10);
    y = StartY;
}
else
{
    x = StartX + Ax;
    y = StartY;
}

draw_sprite_ext(sSpamCar, 2, x + 60, y - 8, 2, 2, 0, c_white, image_alpha);
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

draw_sprite_ext(sprite_index, image_index, x + KnockX, y, 2, 2, 0, c_white, image_alpha);

if (KnockX != 0)
    KnockX += 2;

shader_reset();
draw_sprite_ext(sSpamCar, 1, x + 60, y - 8, 2, 2, 0, c_white, image_alpha);

if ((sprite_index == sKris_Fight && image_index == 7) || sprite_index == sKris_Hit)
{
    image_speed = 0;
    FightTyme += 1;
}

if ((FightTyme == 25 && sprite_index == sKris_Fight) || (FightTyme == 25 && sprite_index == sKris_Hit))
{
    image_index = 0;
    image_speed = 1;
    FightTyme = 0;
    sprite_index = sKris_Idle;
}

if (sprite_index == sKris_Defend_P && image_index == 4)
    image_speed = 0;

if (sprite_index == sKris_Act && image_index == 5)
    image_speed = 0;

if ((sprite_index == sKris_Item && image_index == 10) || (sprite_index == sKris_Spare && image_index == 9) || (sprite_index == sKris_UnAct && image_index == 8))
    sprite_index = sKris_Idle;

if (oAlways.GameON)
{
    if (oMakeUI.HP[0] > 0 && sprite_index == sKris_Down)
    {
        sprite_index = sKris_Idle;
        image_speed = 1;
        image_index = 0;
    }
    
    if (oMakeUI.StatusON && oMakeUI.HP[0] < 1)
        draw_sprite(sStunned, 0, x + 92 + (sin(Tyme * -0.05) * 20), (y - 80) + (cos(Tyme * 0.05) * 10));
}
