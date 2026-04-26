function scr_coneboy_inhale()
{
    move = key_left + key_right;
    
    if (substate == 0)
    {
        hsp = approach(hsp, 0, 1);
        vsp = 0;
        inhaling = true;
        sprite_index = spr_coneboy_inhaling;
        
        if (!key_attack || inhalingEnemy)
        {
            state = UnknownEnum.Value_1;
            inhaling = false;
        }
        
        inhaleStrength = gamepad_button_value(0, gp_shoulderlb) * 20;
        camera_shake_add(inhaleStrength, 20);
        p1Vibration(inhaleStrength + 1, 20);
    }
    
    if (substate == 1)
    {
        hsp = xscale * movespeed;
        movespeed = 10;
        sprite_index = spr_coneboy_sworddash;
        
        if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
        {
            vsp = -6;
            movespeed = -6;
            sprite_index = spr_player_PZ_hitWall_mach3;
            state = UnknownEnum.Value_67;
        }
    }
    
    if (substate == 2)
    {
        hsp = xscale * movespeed;
        
        if (!key_attack)
        {
            state = UnknownEnum.Value_1;
            sprite_index = spr_coneboy_idle;
        }
        
        if (!key_jump2 && !jumpStop && vsp < 0.5)
        {
            vsp /= 20;
            jumpStop = true;
        }
        
        if (key_jump)
            vsp = -9;
        
        if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
        {
            if (grounded)
            {
                vsp = -6;
                movespeed = -6;
                sprite_index = spr_player_PZ_hitWall_mach3;
                state = UnknownEnum.Value_67;
            }
            else
            {
                sprite_index = spr_coneboy_juicewallclimb;
                state = UnknownEnum.Value_11;
                inputBufferJump = 0;
                verticalMovespeed = max(3, -vsp);
            }
        }
        
        if (move == xscale)
            movespeed += 0.1;
    }
}
