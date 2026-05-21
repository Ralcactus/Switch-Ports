if (!instance_exists(ID) || (obj_player.state == states.mach3 || obj_player.state == states.pizzanoshoulderbash || obj_player.state == states.pizzanosidejump || obj_player.state == states.minecart))
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
            case obj_melon:
                if (state != baddiestate.idle && state != baddiestate.walk)
                {
                    hitboxcreate = 0;
                    instance_destroy(other.id);
                }
                
                break;
            
            case obj_sluggy:
                if (state != baddiestate.slugjump)
                {
                    hitboxcreate = 0;
                    instance_destroy(other.id);
                }
                
                break;
            
            case obj_charger:
                if (state != baddiestate.charge && sprite_index != spr_banana_charge)
                {
                    hitboxcreate = 0;
                    instance_destroy(other.id);
                }
                
                break;
            
            case obj_swedishfish:
                if (state != baddiestate.hit)
                {
                    hitboxcreate = 0;
                    instance_destroy(other.id);
                }
                
                break;
        }
    }
}
