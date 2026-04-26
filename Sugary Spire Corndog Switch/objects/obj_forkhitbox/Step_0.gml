var target_player = instance_nearest(x, y, obj_parent_player);

if (!instance_exists(ID) || (target_player.state == UnknownEnum.Value_65 || target_player.state == UnknownEnum.Value_108 || target_player.state == UnknownEnum.Value_125 || target_player.state == UnknownEnum.Value_103 || target_player.state == UnknownEnum.Value_100 || target_player.state == UnknownEnum.Value_79))
    instance_destroy();

if (instance_exists(ID))
{
    x = ID.x;
    y = ID.y;
    image_xscale = ID.image_xscale;
    image_index = ID.image_index;
    
    with (ID)
    {
        switch (object_index)
        {
            case obj_knight:
                if (state != UnknownEnum.Value_0 && state != UnknownEnum.Value_1)
                {
                    hitboxcreate = 0;
                    instance_destroy(other.id);
                }
                
                break;
            
            case obj_beeWorker:
                if (state != UnknownEnum.Value_0 && state != UnknownEnum.Value_1)
                {
                    hitboxcreate = 0;
                    instance_destroy(other.id);
                }
                
                break;
            
            case obj_sluggy:
                if (state != UnknownEnum.Value_16 && state != UnknownEnum.Value_22)
                {
                    hitboxcreate = 0;
                    instance_destroy(other.id);
                }
                
                break;
            
            case obj_charger:
            case obj_gumbanana:
                if (state != UnknownEnum.Value_2 && sprite_index != spr_banana_charge)
                {
                    hitboxcreate = 0;
                    instance_destroy(other.id);
                }
                
                break;
            
            case obj_swedishfish:
                if (state != UnknownEnum.Value_5)
                {
                    hitboxcreate = 0;
                    instance_destroy(other.id);
                }
                
                break;
            
            case obj_executioner:
                if (state != UnknownEnum.Value_5)
                {
                    hitboxcreate = 0;
                    instance_destroy(other.id);
                }
                
                break;
            
            case obj_melon:
                if (state != UnknownEnum.Value_17)
                {
                    hitboxcreate = 0;
                    instance_destroy(other.id);
                }
                
                break;
            
            case obj_doggy:
                if (sprite_index != spr_badmarsh_rage)
                    instance_destroy(other.id);
                
                break;
            
            case obj_babyBearOLD:
                if (state != UnknownEnum.Value_22 && state != UnknownEnum.Value_0)
                    instance_destroy(other.id);
                
                break;
            
            case obj_betonbacon:
                if (state != UnknownEnum.Value_22 && state != UnknownEnum.Value_0)
                    instance_destroy(other.id);
                
                break;
        }
    }
}
