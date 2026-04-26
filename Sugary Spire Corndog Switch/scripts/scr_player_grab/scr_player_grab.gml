function state_player_grab()
{
    grav = 0.5;
    move = key_left + key_right;
    
    if (grounded)
    {
        scr_conveyorBeltKinematics();
        
        if (dir != xscale && sprite_index != spr_player_PZ_swingDing)
        {
            dir = xscale;
            movespeed = 2;
            faceHurt = false;
        }
        
        jumpStop = false;
        anger = 100;
        hsp = move * movespeed;
        
        if (move == 0)
            movespeed = 0;
        else if (movespeed < 6)
            movespeed += 0.5;
        else if (floor(movespeed) == 6)
            movespeed = 6;
        
        if (movespeed > 6)
            movespeed -= 0.1;
        
        if (move != 0 && sprite_index != spr_player_PZ_swingDing)
            xscale = move;
        
        if (move != 0)
        {
            if (movespeed < 3 && move != 0)
                image_speed = 0.35;
            else if (movespeed > 3 && movespeed < 6)
                image_speed = 0.45;
            else
                image_speed = 0.6;
        }
        else
        {
            image_speed = 0.35;
        }
    }
    else
    {
        if (dir != xscale && sprite_index != spr_player_PZ_swingDing)
        {
            dir = xscale;
            movespeed = 2;
            faceHurt = false;
        }
        
        if (move != xscale)
            movespeed = 2;
        
        hsp = move * movespeed;
        
        if (momemtum)
            hsp = xscale * movespeed;
        
        if (move != xscale && momemtum && movespeed != 0)
            movespeed -= 0.05;
        
        if (movespeed <= 0)
            momemtum = false;
        
        if (move != 0 && movespeed < 6)
            movespeed += 0.5;
        
        if (movespeed > 6)
            movespeed -= 0.5;
        
        if (move != 0 && place_meeting_collision(x + move, y))
            movespeed = 0;
        
        if (dir != xscale && sprite_index != spr_player_PZ_swingDing)
        {
            dir = xscale;
            movespeed = 2;
            faceHurt = false;
        }
        
        if (move == -xscale)
        {
            machTwo = 0;
            momemtum = false;
        }
        
        landAnim = 1;
        
        if (!key_jump2 && !jumpStop && vsp < 0.5 && !stompAnim)
        {
            vsp /= 20;
            jumpStop = true;
        }
        
        ladderBuffer = max(ladderBuffer - 1, 0);
        
        if (scr_solid(x, y - 1) && !jumpStop && jumpAnim)
        {
            vsp = grav;
            jumpStop = true;
        }
        
        if (move != 0 && sprite_index != spr_player_PZ_swingDing)
            xscale = move;
    }
    
    scr_conveyorBeltKinematics();
    
    if (can_jump && inputBufferJump > 0 && !key_down && !key_attack && vsp > 0 && sprite_index != spr_player_PZ_swingDing)
    {
        fmod_event_play(sndJump);
        inputBufferJump = 0;
        sprite_index = spr_player_PZ_hauling_jump;
        instance_create(x, y, obj_highJumpCloud1, 
        {
            playerID: id
        });
        vsp = -11;
        image_index = 0;
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
    
    if (move != 0 && move != lastMove && swingDingBuffer < 300)
    {
        lastMove = move;
        swingDingBuffer += 50;
    }
    
    swingDingBuffer = max(swingDingBuffer - 1, 0);
    
    if (inputBufferSlap > 0)
    {
        if (move != 0)
            move = xscale;
        
        inputBufferSlap = 0;
        movespeed = clamp(movespeed, 0, 6);
        state = UnknownEnum.Value_86;
        
        if (sprite_index == spr_player_PZ_swingDing)
            sprite_index = spr_player_PZ_swingDing_end;
        else if (key_up)
            sprite_index = spr_player_PZ_finishingBlow_uppercut;
        else
            sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
        
        image_index = 0;
    }
    
    if (key_attack)
    {
        sprite_index = spr_player_PZ_swingDing;
        movespeed = max(movespeed, 10);
        state = UnknownEnum.Value_5;
        instance_create(x, y, obj_jumpdust);
    }
    
    if (key_down && !grounded)
    {
        sprite_index = spr_player_PZ_pileDriver_intro;
        vsp = -6;
        state = UnknownEnum.Value_33;
        image_index = 0;
        image_speed = 0.35;
    }
    
    if (!instance_exists(obj_puffEffect) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
        instance_create(x, y + 43, obj_puffEffect);
    
    if (key_down && grounded)
    {
        if (instance_exists(baddieGrabbedID))
        {
            with (baddieGrabbedID)
            {
                state = UnknownEnum.Value_4;
                image_index = 0;
                x = other.x;
                y = other.y;
            }
        }
        
        state = UnknownEnum.Value_60;
        landAnim = false;
        crouchAnim = true;
        image_index = 0;
        idle = 0;
    }
    
    if (move != 0)
        steppy = floor(image_index) == 3 || floor(image_index) == 8;
    
    if (sprite_index != spr_player_PZ_swingDing)
        image_speed = 0.35;
    else
        image_speed = swingDingBuffer / 600;
}
