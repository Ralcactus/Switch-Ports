function state_player_mini_normal()
{
    grav = 0.35;
    move = key_left + key_right;
    hsp = xscale * movespeed;
    scr_conveyorBeltKinematics();
    image_speed = 0.35;
    
    if (move == xscale)
        movespeed = approach(movespeed, 7, 0.6);
    else
        movespeed = approach(movespeed, 0, (move == -xscale) ? 0.5 : 0.4);
    
    if (abs(movespeed) <= 0 && move != 0)
        xscale = move;
    
    if (grounded)
    {
        if (move != 0)
        {
            image_speed = 0.35;
            
            if (abs(movespeed >= 6))
                image_speed = 0.6;
            else if (abs(movespeed > 3))
                image_speed = 0.45;
        }
        
        if ((sprite_index != spr_miniTransform && sprite_index != spr_miniLand) || animation_end())
        {
            sprite_index = spr_miniIdle;
            
            if (abs(movespeed) > 0)
                sprite_index = (abs(movespeed) >= 7) ? spr_miniMach : spr_miniWalk;
        }
    }
    else if (!grounded)
    {
        image_speed = 0.45;
        
        if ((sprite_index != spr_miniTransform && sprite_index != spr_miniJump) || animation_end())
            sprite_index = spr_miniFall;
    }
    
    if (grounded && (sprite_index == spr_miniFall || sprite_index == spr_miniJump))
    {
        image_index = 0;
        sprite_index = spr_miniLand;
    }
    
    if (place_meeting_solid(x + sign(hsp), y))
        movespeed = 0;
    
    if (!key_jump2 && !jumpStop && vsp < 0.5)
    {
        vsp /= 20;
        jumpStop = true;
    }
    
    if (can_jump && inputBufferJump > 0)
    {
        fmod_event_play(sndJump);
        sprite_index = spr_miniJump;
        instance_create(x, y, obj_highJumpCloud1, 
        {
            playerID: id
        });
        stompAnim = 0;
        vsp = -11;
        jumpStop = false;
        image_index = 0;
        inputBufferJump = 0;
    }
    
    if (inputBufferSlap > 0)
    {
        inputBufferSlap = 0;
        sprite_index = spr_miniPunch;
        image_index = 0;
    }
    
    if (sprite_index == spr_miniTransform)
    {
        hsp = 0;
        vsp = 0;
        
        with (create_afterimage(UnknownEnum.Value_0, xscale))
        {
            vsp = -3;
            gonealpha = 0.8;
            alarm[0] = 1;
            alarm[1] = 60;
        }
    }
}
