if (other.DamageTime == 0 && !other.ChieldProof)
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
        instance_destroy();
    }
}
