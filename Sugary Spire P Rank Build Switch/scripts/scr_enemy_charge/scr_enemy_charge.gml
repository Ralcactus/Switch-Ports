function scr_enemy_charge()
{
    if (object_index == obj_swedishfish)
    {
        hsp = image_xscale * movespeed;
        
        if (place_meeting(x + hsp, y, obj_solid))
        {
            state = baddiestate.stun;
            stunned = 100;
        }
    }
    
    if (object_index == obj_charger)
    {
        hsp = image_xscale * movespeed;
        
        if (substate == 0)
        {
            if (sprite_index != spr_banana_chargestart)
                movespeed = 8;
            else
                movespeed = 0;
            
            if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope))
                image_xscale *= -1;
            
            var dir = sign(obj_player.x - x);
            
            if (eliteEnemy && image_xscale == -dir && point_distance(x, 0, obj_player.x, 0) >= 50)
            {
                substate = 1;
                sprite_index = spr_banana_machturn;
                image_index = 0;
            }
        }
        
        if (substate == 1)
        {
            movespeed = (1 - (image_index / image_number)) * 8;
            
            if (animation_end() || movespeed == 0)
            {
                image_xscale *= -1;
                movespeed = 8;
                substate = 0;
                sprite_index = spr_banana_charge;
            }
        }
    }
}
