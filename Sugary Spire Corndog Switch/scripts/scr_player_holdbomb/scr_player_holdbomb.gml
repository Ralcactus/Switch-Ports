function state_player_holdbomb()
{
    var bomb_obj = -4;
    
    if (instance_exists(bombID))
    {
        bomb_obj = bombID;
    }
    else
    {
        state = UnknownEnum.Value_1;
        exit;
    }
    
    if (substate == 0)
    {
        bomb_obj.countdown -= 0.5;
        move = key_left + key_right;
        
        if (dir != xscale)
        {
            dir = xscale;
            movespeed = 2;
            faceHurt = false;
        }
        
        if (grounded)
        {
            hsp = move * movespeed;
            
            if (move != 0)
                movespeed = approach(movespeed, 6, 0.5);
            else
                movespeed = 0;
            
            if (move != 0)
                xscale = move;
        }
        else
        {
            hsp = xscale * movespeed;
            
            if (move != 0)
                movespeed = approach(movespeed, 6, 0.5);
            else
                movespeed = approach(movespeed, 0, 0.1);
            
            if (move != 0)
                xscale = move;
            
            if (!key_jump2 && !jumpStop && vsp < 0.5 && !stompAnim)
            {
                vsp /= 20;
                jumpStop = true;
            }
        }
        
        if (can_jump && inputBufferJump > 0 && !key_down && !key_attack)
        {
            fmod_event_play(sndJump);
            sprite_index = spr_player_PZ_hauling_jump;
            instance_create(x, y, obj_highJumpCloud1, 
            {
                playerID: id
            });
            vsp = -11;
            image_index = 0;
            inputBufferJump = 0;
        }
        
        if (inputBufferSlap > 0 && grounded)
        {
            hsp = 0;
            movespeed = 0;
            vsp = 0;
            substate = 1;
            inputBufferSlap = 0;
        }
        
        if (grounded)
            sprite_index = (move == 0) ? spr_player_PZ_hauling_idle : spr_player_PZ_hauling_walk;
        
        if (sprite_index == spr_player_PZ_hauling_intro && floor(image_index) == (image_number - 1))
            sprite_index = spr_player_PZ_hauling_idle;
        
        if ((sprite_index == spr_player_PZ_hauling_jump && floor(image_index) == (image_number - 1)) || (!grounded && (sprite_index == spr_player_PZ_hauling_walk || sprite_index == spr_player_PZ_hauling_idle)))
            sprite_index = spr_player_PZ_hauling_fall;
        
        if (grounded && vsp > 0 && (sprite_index == spr_player_PZ_hauling_fall || sprite_index == spr_player_PZ_hauling_jump))
        {
            sprite_index = spr_player_PZ_hauling_land;
            movespeed = 2;
        }
        
        if (sprite_index == spr_player_PZ_hauling_land && floor(image_index) == (image_number - 1))
            sprite_index = spr_player_PZ_hauling_idle;
    }
    
    if (substate == 1)
    {
        var angle_to = (xscale == -1) ? 180 : 0;
        angle = wave(angle_to - 70, angle_to + 70, 2, 0);
        sprite_index = spr_suplexmash1;
        
        if (key_jump)
            substate = 0;
    }
}
