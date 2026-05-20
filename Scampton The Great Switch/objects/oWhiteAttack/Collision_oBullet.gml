if ((scrACp("BulletDie") && BigHP > 0) || scrACp("Destroy_Projectile"))
{
    if (scrACp("BulletDie"))
    {
        audio_stop_sound(snd_damage_ch1);
        sou(88);
        Var5 = 20;
        Var8 = 50;
        
        if (oAlways.MultiShot == 0)
            BigHP -= 2;
        else
            BigHP -= 1;
        
        if (BigHP <= 5)
        {
            Var5 = 0;
            BigHP = 0;
        }
    }
    
    with (other)
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
    
    if (scrACp("Sun"))
    {
        audio_stop_sound(snd_damage_ch1);
        sou(88);
        Var1 -= 0.34;
        Var2 -= 10;
        
        if (Var1 < 0)
        {
            Var1 = 0;
            oPattern.Var1 = 20;
            oPattern.Var11 = irandom_range(3, 4);
            Var3 += 20;
        }
        else
        {
            Var3 += 10;
        }
    }
    
    if (scrACp("MailShot"))
    {
        Var5 -= 1;
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
        Var3 = 7;
        oPattern.L1 -= 10;
        
        if (oPattern.L1 < 0)
            oPattern.L1 = 0;
    }
    
    if (scrACp("LMH"))
    {
        BigHP -= 1;
        Var1 = 15;
        audio_stop_sound(snd_damage_ch1);
        sou(88);
    }
}
