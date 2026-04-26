function state_player_crouch()
{
    var room_to_jump = !(place_meeting_solid(x, y - 16) || place_meeting_solid(x, y - 32));
    move = key_left + key_right;
    hsp = move * movespeed;
    scr_conveyorBeltKinematics();
    mask_index = spr_crouchmask;
    turning = 0;
    movespeed = (character == UnknownEnum.Value_4) ? 0 : 4;
    
    if (!grounded && !key_jump)
    {
        jumpAnim = false;
        state = UnknownEnum.Value_61;
        movespeed = 4;
        crouchAnim = true;
        image_index = 0;
    }
    
    if (key_jump && grounded && room_to_jump)
    {
        fmod_event_play(sndJump);
        vsp = -8;
        state = UnknownEnum.Value_61;
        movespeed = 4;
        image_index = 0;
        crouchAnim = true;
        jumpAnim = true;
    }
    
    if (key_shoot2 && global.treat)
    {
        if (move == 0)
            movespeed = 0;
        
        state = UnknownEnum.Value_143;
        image_index = 0;
        sprite_index = spr_player_PZ_donut_throw;
        
        with (instance_create(x, y + 16, obj_donutThrowable))
        {
            image_xscale = other.xscale;
            
            if (other.key_up)
            {
                movespeed = 7;
                vsp = -14;
            }
            else
            {
                movespeed = 8;
                vsp = -5;
            }
        }
    }
    
    if (grounded && !key_down && !key_jump && room_to_jump)
    {
        state = UnknownEnum.Value_1;
        movespeed = 0;
        crouchAnim = true;
        jumpAnim = true;
        image_index = 0;
        mask_index = spr_player_mask;
    }
    
    if (!crouchAnim && sprite_index != spr_coneboy_slidekick)
    {
        if (move == 0)
            sprite_index = shotgunAnim ? spr_shotgun_duck : spr_crouch;
        else
            sprite_index = spr_crawl;
    }
    
    if (crouchAnim && sprite_index != spr_coneboy_slidekick && move == 0)
    {
        sprite_index = shotgunAnim ? spr_shotgun_goduck : spr_couchstart;
        
        if (floor(image_index) == (image_number - 1))
            crouchAnim = false;
    }
    
    if (move != 0)
    {
        xscale = move;
        crouchAnim = false;
    }
    
    if (room_to_jump)
        do_taunt();
    
    if (inputBufferSlap > 0 && grounded)
    {
        grav = 0.5;
        inputBufferSlap = 0;
        
        if (character == UnknownEnum.Value_4)
        {
            state = UnknownEnum.Value_62;
            movespeed = 7;
            sprite_index = spr_coneboy_slidekick;
            fmod_event_play(sndCrouchslide);
        }
        else
        {
            fmod_event_play(sndCrouchslide);
            suplexMove = true;
            vsp = 0;
            instance_create(x, y, obj_jumpdust);
            sprite_index = spr_crouchslipintro;
            image_index = 0;
            state = UnknownEnum.Value_28;
            
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale;
            
            movespeed = 12;
            crouchSlipBuffer = 25;
            crouchSlipAntiBuffer = 0;
        }
    }
    
    image_speed = 0.3;
}
