Ttyme += 1;

if (rTyme(10, Ttyme))
{
    if (HitAnA == 0)
        HitAnA = -4;
    else
        HitAnA = 0;
}

if (HitAnT > 0)
    HitAnT--;

if (HitAnT == 1)
{
    AnMode = HitAnMemb;
    image_index = 0;
}

if (Ttyme > 10 && TM != 30)
    TM += 0.5;

if (oAlways.GameON)
{
    if (oMakeUI.Spare >= 30 && NedEX[0] < 1000)
    {
        NedEX[0] += NedEX[3];
        NedEX[3] += 0.5;
    }
    
    if (oMakeUI.Spare >= 60 && NedEX[1] < 1000)
    {
        NedEX[1] += NedEX[4];
        NedEX[4] += 1;
    }
    
    if (oMakeUI.Spare >= 100 && NedEX[2] < 1000)
    {
        NedEX[2] += NedEX[5];
        NedEX[5] += 0.5;
    }
    
    if (oMakeUI.Spare >= 100)
    {
        L_ArmStringScale += ((0 - L_ArmStringScale) / 5);
        R_ArmStringScale += ((0 - R_ArmStringScale) / 5);
    }
}

if (AnSpeed != 0)
    Tyme1 += 1;

if (oMakeUI.LoopGoop)
    Rainbow = true;

if (Rainbow)
{
    RM += 0.05;
    
    if (rTyme(3, round(RM)))
    {
        _R += ((255 - _R) / 10);
        _G += ((150 - _G) / 10);
        _B += ((150 - _B) / 10);
    }
    
    if (rTyme(3, round(RM) + 1))
    {
        _R += ((150 - _R) / 10);
        _G += ((255 - _G) / 10);
        _B += ((150 - _B) / 10);
    }
    
    if (rTyme(3, round(RM) + 2))
    {
        _R += ((150 - _R) / 10);
        _G += ((150 - _G) / 10);
        _B += ((255 - _B) / 10);
    }
}

RGB = make_color_rgb(_R, _G, _B);

if (Glow)
{
    if (GlowStage == 0)
    {
        GlowWhite += 0.2;
        
        if (GlowWhite == 1)
            GlowStage = 1;
    }
    
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

if (oAlways.BlackB2 != 0)
    draw_sprite_ext(sWhite, 0, -50, -50, 100, 100, 0, rgb(0, 0, 5), oAlways.BlackB2);

BodX += MovX;
MovX += ((0 - MovX) / 10);
scrShaderWh(0);

if (WholeROT >= 360)
    WholeROT -= 360;

if (WholeROT <= -360)
    WholeROT += 360;

if (!MoveMode)
{
    ScamE_x += ((0 - ScamE_x) / 6);
    ScamE_y += ((0 - ScamE_y) / 6);
}

if (AnMode == "P")
    draw_sprite_ext(sJunk, round(Ttyme / 20), ScamE_x + BodX + eS(), BodY + eS(), 1, 1, 0, RGB, Alpha);

if (AnMode == 0)
{
    sprite_index = sScampt_Body;
    
    if (rTyme(2, Ttyme))
    {
        if (MoveMode && !oMakeUI.EndGame)
            ScamE_x += (((sin(oP.Tyme * 0.05) * TM) - ScamE_x) / 2);
    }
    
    draw_sprite_ext(sScampt_Body, image_index, ScamE_x + BodX + eS(), BodY + eS(), 2, 2, 0, RGB, Alpha);
    draw_sprite_ext(sScampt_Head, Scam_Head, ScamE_x + BodX + eS(), BodY + eS(), 2, 2, 0, RGB, Alpha);
}

if (AnMode == 1)
{
    sprite_index = sScampt_Jump3;
    
    if (MoveMode && !oMakeUI.EndGame)
    {
        ScamE_x += (((sin(oP.Tyme * 0.05) * TT) - ScamE_x) / 2);
        ScamE_y += (((sin(oP.Tyme * 0.1) * (TT / 10)) - ScamE_y) / 2);
    }
    
    draw_sprite_ext(sScampt_Jump3, image_index, ScamE_x + BodX + eS(), ScamE_y + BodY + eS(), 2, 2, 0, RGB, Alpha);
}

if (AnMode == 2 || AnMode == 3 || AnMode == 4 || AnMode == 5 || AnMode == 6 || AnMode == 7 || AnMode == 8)
{
    sprite_index = sScampt_Body;
    
    if (rTyme(2, Ttyme))
    {
        if (MoveMode)
            ScamE_x += (((sin(oP.Tyme * 0.05) * TM) - ScamE_x) / 2);
    }
}

if (AnMode == 2)
{
    if (rTyme(2, Ttyme))
    {
        an2 = iRan(-1, 1) * 2;
        an3 = iRan(-1, 1) * 2;
    }
    
    draw_sprite_ext(sScampt_Body, image_index, an2 + ScamE_x + BodX + eS(), an3 + BodY + eS(), 2, 2, 0, RGB, Alpha);
    draw_sprite_ext(sScampt_Head, 2, an2 + ScamE_x + BodX + eS(), an3 + BodY + eS(), 2, 2, 0, RGB, Alpha);
}

if (AnMode == 3)
{
    if (rTyme(10, Ttyme))
    {
        if (an1 == 0)
            an1 = 2;
        else
            an1 = 0;
    }
    
    draw_sprite_ext(sScampt_Body, image_index, ScamE_x + BodX + eS(), BodY + eS(), 2, 2, 0, RGB, Alpha);
    draw_sprite_ext(sScampt_Head, 3, ScamE_x + BodX + eS(), (BodY + eS()) - an1, 2, 2, 0, RGB, Alpha);
}

if (AnMode == 4)
{
    draw_sprite_ext(sScampt_Body, image_index, ScamE_x + BodX + eS(), BodY + eS(), 2, 2, 0, RGB, Alpha);
    draw_sprite_ext(sScampt_Head, 4, ScamE_x + BodX + eS(), BodY + eS(), 2, 2, 0, RGB, Alpha);
}

if (AnMode == 5)
{
    if (rTyme(10, Ttyme))
    {
        if (an1 == 0)
            an1 = 2;
        else
            an1 = 0;
    }
    
    draw_sprite_ext(sScampt_Body, image_index, ScamE_x + BodX + eS(), BodY + eS(), 2, 2, 0, RGB, Alpha);
    draw_sprite_ext(sScampt_Head, 5, ScamE_x + BodX + eS(), (BodY + eS()) - an1, 2, 2, 0, RGB, Alpha);
}

if (AnMode == 6)
{
    draw_sprite_ext(sScampt_Body, image_index, ScamE_x + BodX + eS(), BodY + eS(), 2, 2, 0, RGB, Alpha);
    draw_sprite_ext(sScampt_Head, 6, ScamE_x + BodX + eS(), BodY + eS(), 2, 2, 0, RGB, Alpha);
}

if (AnMode == 7)
{
    draw_sprite_ext(sScampt_Body, image_index, ScamE_x + BodX + eS(), BodY + eS(), 2, 2, 0, RGB, Alpha);
    draw_sprite_ext(sScampt_Head, 7, ScamE_x + BodX + eS(), BodY + eS(), 2, 2, 0, RGB, Alpha);
}

if (AnMode == 8)
{
    if (rTyme(2, Ttyme))
    {
        an2 = iRan(-1, 1) * 2;
        an3 = iRan(-1, 1) * 2;
    }
    
    draw_sprite_ext(sScampt_Body, image_index, an2 + ScamE_x + BodX + eS(), an3 + BodY + eS(), 2, 2, 0, RGB, Alpha);
    draw_sprite_ext(sScampt_Head, 8, an2 + ScamE_x + BodX + eS(), an3 + BodY + eS(), 2, 2, 0, RGB, Alpha);
}

if (AnMode == 9)
{
    if (rTyme(2, Ttyme))
    {
        an2 = iRan(-1, 1) * 2;
        an3 = iRan(-1, 1) * 2;
    }
    
    draw_sprite_ext(sScampt_Body, image_index, an2 + ScamE_x + BodX + eS(), an3 + BodY + eS(), 2, 2, 0, RGB, Alpha);
    draw_sprite_ext(sScampt_Head, 9, an2 + ScamE_x + BodX + eS(), an3 + BodY + eS(), 2, 2, 0, RGB, Alpha);
}

if (AnMode == "HIT")
    draw_sprite_ext(sScampHit, HitRNG, HitAnA + an2 + ScamE_x + BodX + eS(), an3 + BodY + eS(), 2, 2, 0, RGB, Alpha);

if (LimbShake != 0)
    LimbShake -= 0.5;

White = -0.5;
shader_reset();
