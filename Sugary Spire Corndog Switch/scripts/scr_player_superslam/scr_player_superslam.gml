function state_player_superslam()
{
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 0;
    }
    
    move = key_left + key_right;
    
    if (move != 0)
        xscale = move;
    
    hsp = move * movespeed;
    movespeed = (move == 0) ? 0 : 5;
    
    if (vsp >= 2)
    {
        vsp += 0.5;
        
        if (vsp > 17 && !instance_exists(obj_piledrivereffect))
        {
            instance_create(x, y, obj_piledrivereffect, 
            {
                playerID: id
            });
        }
    }
    
    vsp = min(vsp, 40);
    
    if (vsp > 0)
        freeFallSmash++;
    else if (vsp < 0)
        freeFallSmash = -14;
    
    machTwo = 0;
    
    if (sprite_index == spr_player_PZ_pileDriver_intro && animation_end())
    {
        sprite_index = spr_piledriver;
        image_index = 0;
    }
    
    move = 0;
    hsp = 0;
    
    if (sprite_index == spr_player_PZ_pileDriver_intro || sprite_index == spr_piledriver)
    {
        move = key_left + key_right;
        hsp = move * movespeed;
    }
    
    if ((sprite_index == spr_piledriver || sprite_index == spr_player_PZ_pileDriver_intro) && grounded && !place_meeting(x, y + 1, obj_destructibles) && vsp > 0)
    {
        sprite_index = spr_piledriverland;
        event_play_oneshot("event:/SFX/player/groundpound", x, y);
        jumpAnim = true;
        jumpStop = false;
        image_index = 0;
        camera_shake_add(20, 40);
        hsp = 0;
        create_particle(x, y, spr_bangEffect);
        instance_create(x, y, obj_landcloud);
        freefallstart = 0;
        
        with (obj_parent_baddie)
        {
            if (bbox_in_camera(id, view_camera[0]) && grounded)
            {
                image_index = 0;
                vsp = -7;
                hsp = 0;
            }
        }
        
        scr_piledriverEnd(baddieGrabbedID);
        baddieGrabbedID = -4;
    }
    
    jumpAnim = true;
    landAnim = false;
    machSlideAnim = true;
    crouchAnim = true;
    
    if (sprite_index == spr_piledriverland && floor(image_index) == (image_number - 1))
    {
        vsp = -9;
        state = UnknownEnum.Value_55;
        
        if (character == UnknownEnum.Value_0)
            sprite_index = spr_player_PZ_freeFallSpin;
    }
    
    if (move != 0)
    {
        if (movespeed < 6)
            movespeed += 0.25;
        else if (floor(movespeed) == 5)
            movespeed = 6;
    }
    else
    {
        movespeed = 0;
    }
    
    if (movespeed > 6)
        movespeed -= 0.1;
    
    image_speed = 0.35;
}
