if (!HIT && !HitBig)
{
    with (other)
    {
        HP -= 1;
        
        if (image_yscale < 2 && HP <= 0)
        {
            if (sprite_index == sSpamHead)
            {
                with (instance_create_depth(x, y, depth, oBA_Destroy))
                {
                    direction = 135;
                    
                    if (other.Xscale == -1)
                        direction = 45;
                    
                    image_index = 0;
                    image_xscale = other.image_xscale;
                    image_yscale = other.image_yscale;
                }
                
                with (instance_create_depth(x, y, depth, oBA_Destroy))
                {
                    direction = 45;
                    
                    if (other.Xscale == -1)
                        direction = 135;
                    
                    image_index = 1;
                    image_xscale = other.image_xscale;
                    image_yscale = other.image_yscale;
                }
                
                with (instance_create_depth(x, y, depth, oBA_Destroy))
                {
                    direction = -45;
                    
                    if (other.Xscale == -1)
                        direction = -135;
                    
                    image_index = 2;
                    image_xscale = other.image_xscale;
                    image_yscale = other.image_yscale;
                }
                
                with (instance_create_depth(x, y, depth, oBA_Destroy))
                {
                    direction = -135;
                    
                    if (other.Xscale == -1)
                        direction = -45;
                    
                    image_index = 3;
                    image_xscale = other.image_xscale;
                    image_yscale = other.image_yscale;
                }
            }
            
            if (sprite_index == sPipis)
            {
                sou(88);
                oTP.TP += 1;
                
                with (instance_create_depth(x, y, depth, oEEF))
                {
                    Seed = "Pipis_B";
                    sprite_index = sPipis_B;
                }
                
                with (instance_create_depth(x, y, depth, oEEF))
                {
                    Seed = "Pipis_B";
                    sprite_index = sPipis_B;
                }
                
                with (instance_create_depth(x, y, depth, oEEF))
                {
                    Seed = "Pipis_B";
                    sprite_index = sPipis_B;
                }
                
                with (instance_create_depth(x, y, depth - 1000, oEEF))
                {
                    Seed = "BallBye";
                    sprite_index = sBallBye;
                }
            }
            
            oSoul.SmallHead += 1;
            instance_destroy();
        }
        
        if (HP > 0)
        {
            if (image_yscale < 2)
                sou(88);
            
            if (sprite_index == sPipis)
            {
                image_index += 1;
                
                with (instance_create_depth(x, y, depth, oEEF))
                {
                    Seed = "Pipis_B";
                    sprite_index = sPipis_B;
                    image_xscale = 1;
                    image_yscale = 1;
                }
            }
        }
    }
    
    if (other.image_yscale > 1.9)
    {
        HitBig = true;
        audio_stop_sound(snd_bing);
        sou(104);
        audio_sound_pitch(snd_bing, irandom_range(1, 3) / 2);
        
        if (irandom_range(0, 1) == 1)
            direction += 135;
        else
            direction -= 135;
    }
    else
    {
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
