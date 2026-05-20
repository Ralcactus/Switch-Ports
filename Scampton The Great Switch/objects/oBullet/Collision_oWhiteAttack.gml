if (!HIT)
{
    other.BulletIDget = MyID;
    WhiteDeath = 0;
    
    with (other)
    {
        if (BulletIDget != "#")
        {
            if (scrACp("Wall"))
            {
                with (oBullet)
                {
                    if (other.BulletIDget == MyID)
                        WhiteDeath = 1;
                }
            }
        }
    }
    
    if (WhiteDeath != 0)
    {
        audio_stop_sound(snd_bing);
        sou(104);
        audio_sound_pitch(snd_bing, 1);
        sprite_index = sBullet_destroy;
        image_index = 0;
        HIT = true;
        
        if (Way == 1)
            oSoul.W_bul -= 1;
        
        if (Way == 2)
            oSoul.S_bul -= 1;
        
        if (Way == 3)
            oSoul.A_bul -= 1;
        
        if (Way == 4)
            oSoul.D_bul -= 1;
    }
}
