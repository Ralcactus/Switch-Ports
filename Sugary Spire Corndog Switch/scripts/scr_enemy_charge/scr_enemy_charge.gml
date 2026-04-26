function scr_enemy_charge()
{
    scr_conveyorBeltKinematics();
    
    if (object_index == obj_swedishfish || object_index == obj_executioner || object_index == obj_candyCorn)
    {
        hsp = image_xscale * movespeed;
        
        if (place_meeting_collision(x + sign(hsp), y, UnknownEnum.Value_1))
        {
            hsp = sign(image_xscale) * -3;
            vsp = -3;
            image_xscale *= -1;
            sprite_index = baddieSpriteStun;
            state = UnknownEnum.Value_4;
            baddieStunTimer = 100;
        }
    }
    
    if (object_index == obj_charger)
    {
        hsp = image_xscale * movespeed;
        
        if (substate == 0)
        {
            movespeed = (sprite_index == spr_banana_chargestart) ? 0 : 8;
            
            if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope))
                image_xscale *= -1;
            
            var dir = sign(obj_parent_player.x - x);
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
    
    if (object_index == obj_gumbanana)
    {
        hsp = image_xscale * movespeed;
        
        if (substate == 0)
        {
            movespeed = (sprite_index == spr_banana_chargestart) ? 0 : 10;
            
            if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope))
                image_xscale *= -1;
            
            var dir = sign(obj_parent_player.x - x);
            
            if (image_xscale == -dir && point_distance(x, 0, obj_parent_player.x, 0) >= 50)
            {
                substate = 1;
                sprite_index = spr_banana_machturn;
                image_index = 0;
            }
        }
        
        if (substate == 1)
        {
            movespeed = (1 - (image_index / image_number)) * 4;
            
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
