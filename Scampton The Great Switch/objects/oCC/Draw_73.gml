if (Seed == "SoulPlod" || Seed == "FadeOut")
    draw_self();

if (Seed == "FF")
{
    draw_sprite_ext(sFightHuds, 1, 79, 403, 1, 1, 0, c_white, 1);
    draw_sprite_ext(sFightHuds, 9, 79, 403, 1, 1, 0, c_white, 1);
    
    if (Tyme == 50)
    {
        oSusie.sprite_index = sSusie_Fight;
        oSusie.image_index = 0;
        sou(52);
    }
    
    if (Tyme == 70)
    {
        oSusie._Rude = false;
        Var1 = 14;
        oMakeUI.DamUP += 0.25;
        Var1 = round(Var1 * oMakeUI.DamUP);
        sou(96);
        
        with (instance_create_depth(480, 140, -20000, oEEF))
        {
            Seed = "FightEEF_1";
            sprite_index = sFightEEF_Susie;
        }
        
        scrNumber(425, 175, 288, make_color_rgb(204, 153, 204), 0, Var1, 0);
        oAlways.ShakeTyme = 10;
        oAlways.ShakePower = 5;
        oSpamtonRig.LimbShake = 10;
        oTP.TP += round(4 * (Var1 / 150));
    }
    
    if (Tyme == 125)
    {
        instance_destroy();
        oActionSET.Stop = true;
    }
}
