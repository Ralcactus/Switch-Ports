function state_player_charge()
{
    if (windingAnim < 2000)
        windingAnim++;
    
    hsp = xscale * movespeed;
    scr_conveyorBeltKinematics();
    
    if (!key_attack)
        movespeed -= 0.5;
    else if (movespeed < 10)
        movespeed += 1;
    else if (movespeed > 10)
        movespeed -= 0.15;
    
    move2 = key_right2 + key_left2;
    move = key_right + key_left;
    
    if (!key_jump2 && !jumpStop && vsp < 0.5)
    {
        vsp /= 20;
        jumpStop = true;
    }
    
    if (movespeed <= 0)
        state = UnknownEnum.Value_37;
    
    if (inputBufferSlap > 0)
    {
        sprite_index = spr_player_PZ_swingDing_end;
        state = UnknownEnum.Value_86;
        image_index = 0;
        movespeed /= 2;
        inputBufferSlap = 0;
    }
    
    if (grounded && vsp > 0)
        jumpStop = false;
    
    if (inputBufferJump > 0 && can_jump)
    {
        fmod_event_play(sndJump);
        vsp = -10;
        inputBufferJump = 0;
    }
    
    if (scr_solid(x + xscale, y, true))
        xscale *= -1;
    
    image_speed = 0.65;
    
    if (!instance_exists(obj_dashCloud) && grounded)
        instance_create(x, y, obj_dashCloud);
}
