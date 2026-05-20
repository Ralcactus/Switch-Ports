if (other.DamageTime == 0)
{
    oAlways.Chield = 25;
    oAlways.PointyGuard -= 1;
    
    if (oAlways.PointyGuard <= 0)
    {
        oAlways.PointyGuard = 0;
        
        with (oChield_2)
            instance_destroy();
    }
    
    with (other)
    {
        audio_stop_sound(snd_damage_ch1);
        sou(88);
        
        if (Scale > 1.9)
            oSoul.BigHead += 1;
        else
            oSoul.SmallHead += 1;
        
        instance_destroy();
    }
}
