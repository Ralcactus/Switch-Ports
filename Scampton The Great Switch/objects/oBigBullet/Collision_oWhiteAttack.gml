if (WhiteDeath == 0)
{
    other.BulletIDget = MyID;
    
    with (other)
    {
        if (BulletIDget != "#")
        {
            if (scrACp("Wall"))
            {
                with (oBigBullet)
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
        image_xscale = 2;
        image_yscale = 2;
        HIT = true;
    }
}
