if (WhiteDeath == 0)
{
    with (other)
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
            audio_stop_sound(snd_damage_ch1);
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
        
        if (Scale > 1.9)
            oSoul.BigHead += 1;
        else
            oSoul.SmallHead += 1;
        
        instance_destroy();
    }
}
