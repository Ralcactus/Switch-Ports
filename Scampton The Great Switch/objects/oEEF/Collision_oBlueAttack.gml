if (Seed == "BlastRing2" && Var2 <= 200)
{
    with (other)
    {
        instance_destroy();
        audio_stop_sound(snd_damage_ch1);
        sou(88);
        
        if (Scale > 1.9)
            oSoul.BigHead += 1;
        else
            oSoul.SmallHead += 1;
    }
}
