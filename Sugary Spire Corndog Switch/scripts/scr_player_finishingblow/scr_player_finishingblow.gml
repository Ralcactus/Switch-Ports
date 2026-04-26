function state_player_finishingblow()
{
    move = key_right + key_left;
    hsp = movespeed;
    
    if (floor(image_index) < 5 && sprite_index != spr_player_PZ_swingDing_end)
        movespeed = approach(movespeed, 0, 0.25);
    else
        movespeed = approach(movespeed, move * 8, 0.5);
    
    if (animation_end())
    {
        state = UnknownEnum.Value_1;
        movespeed = abs(movespeed);
    }
    
    var throw_frame = 6;
    
    if (sprite_index == spr_player_PN_lungeHit)
        throw_frame = 4;
    else if (sprite_index == spr_player_PZ_lungeHit)
        throw_frame = 2;
    else if (sprite_index == spr_player_PZ_swingDing_end)
        throw_frame = 0;
    
    if (animation_end(undefined, throw_frame) && instance_exists(baddieGrabbedID))
    {
        movespeed = xscale * -3;
        vsp = -5;
        event_play_oneshot("event:/SFX/player/punch", x, y);
        event_play_oneshot("event:/SFX/enemies/killingblow", x, y);
        camera_shake_add(5, 20);
        scr_finishingBlow(baddieGrabbedID, id);
        baddieGrabbedID = -4;
        
        if (sprite_index == spr_player_PZ_lungeHit)
        {
            state = UnknownEnum.Value_156;
            movespeed = xscale * -8;
            hsp = movespeed;
            vsp = 0;
        }
    }
    
    image_speed = 0.4;
    landAnim = false;
}
