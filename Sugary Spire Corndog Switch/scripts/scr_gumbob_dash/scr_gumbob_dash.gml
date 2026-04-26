function state_player_gumbob_dash()
{
    image_speed = movespeed / 12;
    hsp = movespeed * xscale;
    move = key_left + key_right;
    sprite_index = spr_player_GB_bounce_mach2;
    
    if (grounded)
        movespeed = approach(movespeed, 4, 0.1);
    
    gumbobDashTimer--;
    
    if (gumbobDashTimer < 0 && (!key_slap || gumbobHitWall))
    {
        sprite_index = spr_player_GB_walk;
        image_index = 0;
        
        if (hsp != 0)
        {
            dir = sign(hsp);
            xscale = dir;
        }
        
        if (key_attack && move != 0)
        {
            xscale = move;
            sprite_index = spr_mach2;
            state = UnknownEnum.Value_3;
            image_index = 0;
            movespeed = max(movespeed, 12);
        }
        else
        {
            state = UnknownEnum.Value_1;
        }
    }
    
    if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_destructibles))
    {
        gumbobDashTimer = 10;
        movespeed /= 1.5;
        xscale *= -1;
        gumbobHitWall = true;
        
        if (key_attack)
        {
            state = UnknownEnum.Value_119;
            gumbobBounceCounter = 0;
            sprite_index = spr_player_GB_bounceSide_mach2_intro;
            xscale *= -1;
            image_index = 0;
        }
    }
    
    if ((key_down && grounded && !gumbobHitWall) || scr_solid(x, y, true))
    {
    }
    
    if (key_down && !grounded && !gumbobHitWall)
    {
    }
    
    if (can_jump && inputBufferJump > 0 && !key_down && !key_attack)
    {
        fmod_event_play(sndJump);
        instance_create(x, y, obj_highJumpCloud1, 
        {
            playerID: id
        });
        vsp = -11;
    }
}
