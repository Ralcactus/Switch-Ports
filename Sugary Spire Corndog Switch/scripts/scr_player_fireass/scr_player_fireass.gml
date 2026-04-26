function state_player_fireass()
{
    static fire_afterimage_timer = 7;
    
    image_speed = 0.35;
    alarm[5] = 2;
    alarm[7] = 60;
    var my_button_1 = get_control_string(global.key_slap);
    scr_controlprompt("[spr_buttonfont]" + my_button_1 + "[spr_promptfont] Dash");
    
    if (sprite_index == spr_player_PZ_fireAss_intro || sprite_index == spr_player_PZ_fireAss_fall)
    {
        move = key_left + key_right;
        hsp = movespeed;
        
        if (move != 0)
        {
            if (move == xscale)
                movespeed = approach(movespeed, xscale * 8, 0.5);
            else
                movespeed = approach(movespeed, 0, 0.5);
            
            if (movespeed <= 0)
                xscale = move;
        }
        else
        {
            movespeed = approach(movespeed, 0, 0.1);
        }
        
        if (place_meeting_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_chocofrog))
            movespeed = 0;
        
        if (grounded && vsp > 0 && !place_meeting(x, y + sign(vsp), obj_chocofrog))
        {
            movespeed = 6;
            sprite_index = spr_player_PZ_fireAss_ground;
            image_index = 0;
        }
        
        if (inputBufferSlap > 0)
        {
            inputBufferSlap = 0;
            sprite_index = spr_player_PZ_fireAss_dash;
            image_index = 0;
            state = UnknownEnum.Value_108;
            
            if (move != 0)
                xscale = move;
            
            movespeed = 12;
            vsp = 0;
        }
        
        if (animation_end() && sprite_index == spr_player_PZ_fireAss_intro)
            sprite_index = spr_player_PZ_fireAss_fall;
    }
    
    if (sprite_index == spr_player_PZ_fireAss_ground)
    {
        scr_conveyorBeltKinematics();
        hsp = xscale * movespeed;
        
        if (movespeed > 0)
            movespeed -= 0.25;
        
        if (animation_end())
        {
            state = UnknownEnum.Value_1;
            hsp = 0;
            image_index = 0;
            hurted = 1;
            landAnim = 0;
        }
    }
    
    fire_afterimage_timer = max(fire_afterimage_timer - 1, 0);
    
    if (fire_afterimagetimer <= 0 && sprite_index != spr_player_PZ_fireAss_ground)
    {
        create_afterimage(UnknownEnum.Value_3, xscale);
        fire_afterimagetimer = 7;
    }
}

function state_player_fireassdash()
{
    static fire_afterimagetimer = 7;
    
    hsp = movespeed * xscale;
    movespeed = approach(movespeed, 11, 0.15);
    
    if (floor(image_index) < 12)
        vsp = 0;
    
    sprite_index = spr_player_PZ_fireAss_dash;
    
    if (animation_end() || grounded)
    {
        image_index = 0;
        sprite_index = spr_fall;
        state = UnknownEnum.Value_55;
        
        if (key_attack)
        {
            sprite_index = spr_secondjump2;
            state = UnknownEnum.Value_64;
        }
    }
    
    if (place_meeting_collision(x + xscale, y, UnknownEnum.Value_1) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_chocofrog))
    {
        var test_y = 0;
        test_y -= slope_check_up(x + xscale, y, 32);
        test_y += slope_check_down(x + xscale, y, 3);
        
        if (test_y != 0)
        {
            y += test_y;
        }
        else
        {
            sprite_index = spr_player_PZ_fall_outOfControl;
            state = UnknownEnum.Value_55;
            vsp = -12;
            jumpStop = true;
            movespeed = 0;
        }
    }
    
    if (fire_afterimagetimer > 0)
        fire_afterimagetimer--;
    
    if (fire_afterimagetimer <= 0)
    {
        create_afterimage(UnknownEnum.Value_3, xscale);
        fire_afterimagetimer = 7;
    }
    
    image_speed = 0.4;
}
