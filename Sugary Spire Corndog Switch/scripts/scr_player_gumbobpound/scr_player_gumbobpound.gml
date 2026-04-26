function state_player_gumbob_pound()
{
    if (sprite_index == spr_player_GB_bounce_mach2 && vsp > 0)
    {
        vsp += 0.5;
        
        if (vsp > 12 && !instance_exists(obj_piledrivereffect))
        {
            instance_create(x, y, obj_piledrivereffect, 
            {
                playerID: id
            });
        }
    }
    
    var hit_wall = place_meeting_collision(x + xscale, y, UnknownEnum.Value_1) && !place_meeting(x + xscale, y, obj_destructibles) && (gumbobBounceCounter < 3 || !place_meeting(x + xscale, y, obj_metalblock));
    var hit_floor = place_meeting_collision(x, y + yscale, UnknownEnum.Value_1) && !place_meeting(x, y + yscale, obj_destructibles) && (gumbobBounceCounter < 3 || !place_meeting(x, y + yscale, obj_metalblock));
    
    if (key_attack && key_jump2 && (hit_wall || hit_floor))
    {
        state = UnknownEnum.Value_119;
        
        if (hit_wall)
            sprite_index = spr_player_GB_bounceSide_mach2_intro;
        else
            sprite_index = spr_player_GB_bounce_mach2_intro;
        
        image_index = 0;
    }
    else if (sprite_index == spr_player_GB_bounce_mach3_intro)
    {
        move = key_left + key_right;
        hsp = movespeed;
        movespeed = approach(movespeed, 0, 1);
        
        if (floor(image_index) == (image_number - 1))
        {
            if (hsp != 0)
                xscale = sign(hsp);
            
            state = UnknownEnum.Value_1;
        }
    }
    else
    {
        hsp = movespeed;
        move = key_left + key_right;
        
        if (move != 0)
            movespeed = approach(movespeed, 8 * move, 0.5);
        else
            movespeed = approach(movespeed, 0, 0.5);
        
        do_grab();
        
        if (grounded && vsp > 0 && !place_meeting(x, y + vsp, obj_destructibles))
        {
            sprite_index = spr_player_GB_bounce_mach3_intro;
            image_index = 0;
            event_play_oneshot("event:/SFX/player/groundpound", x, y);
            jumpAnim = true;
            jumpStop = false;
            image_index = 0;
            camera_shake_add(20, 40);
            hsp = 0;
            create_particle(x, y, spr_bangEffect);
            instance_create(x, y, obj_landcloud);
            freefallstart = 0;
        }
    }
    
    do_taunt();
}
