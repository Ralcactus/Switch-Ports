if ((scrACp("BulletDie") && BigHP > 0) || scrACp("Destroy_Projectile"))
{
    if (scrACp("BulletDie"))
    {
        audio_stop_sound(snd_damage_ch1);
        sou(88);
        Var5 = 20;
        Var8 = 50;
        
        if (oAlways.MultiShot == 0)
            BigHP -= 10;
        else
            BigHP -= 5;
        
        if (BigHP <= 5)
        {
            Var5 = 0;
            BigHP = 0;
        }
    }
    
    if (!scrACp("LMH"))
    {
        with (other)
            instance_destroy();
    }
    
    if (scrACp("Sun"))
    {
        audio_stop_sound(snd_damage_ch1);
        sou(88);
        Var1 = 0;
        oPattern.Var1 = 20;
        oPattern.Var11 = irandom_range(3, 4);
        Var2 = 0;
        Var3 += 20;
    }
    
    if (scrACp("MailShot"))
    {
        Var6 -= 1;
        audio_stop_sound(snd_damage_ch1);
        sou(88);
        
        if (Var5 >= 0 && Var6 >= 0)
        {
            _R = 0;
            _G = 255;
            _B = 0;
        }
    }
    
    if (scrACp("BigHeart"))
    {
        audio_stop_sound(snd_damage_ch1);
        sou(88);
        Var3 = 25;
        oPattern.L1 -= 40;
        
        if (oMakeUI.Debug)
            oPattern.L1 -= 320;
        
        if (oPattern.L1 < 0)
            oPattern.L1 = 0;
    }
    
    if (scrACp("LMH"))
    {
        BigHP = 0;
        audio_stop_sound(snd_damage_ch1);
        sou(88);
    }
}
