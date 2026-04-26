function scr_player_gumbobroll()
{
    if (sprite_index == spr_player_GB_bounce_mach3_intro)
    {
        image_speed = 0.35;
        
        if (floor(image_index) == (image_number - 1))
            image_index = image_number - 1;
        
        if (grounded)
        {
            hsp = 0;
            vsp = 0;
            
            if (floor(image_index) == (image_number - 1))
                state = UnknownEnum.Value_1;
        }
    }
    else
    {
        image_speed = abs(movespeed / 15);
        hsp = movespeed * xscale;
        move = key_left + key_right;
        
        if (key_down)
        {
            if (move == 0 || hsp == 0)
            {
                image_index = 0;
                sprite_index = spr_bodyslamstart;
                freeFallSmash = 2;
                vsp = 6;
                state = UnknownEnum.Value_69;
            }
            else if (vsp < terminalVelocity)
            {
                vsp += 0.4;
            }
        }
        
        if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock))
        {
            image_index = 0;
            flash = false;
            image_speed = 0.35;
            instance_create(x + (10 * xscale), y + 10, obj_bumpEffect);
            
            if (key_slap)
            {
                vsp = key_up ? -9 : -11;
                movespeed *= 0.9;
                xscale *= -1;
            }
            else
            {
                var _ledge = 0;
                _ledge -= slope_check_up(x + xscale, y, 32);
                _ledge += slope_check_down(x + xscale, y, 3);
                
                if (_ledge != 0)
                {
                    y += _ledge;
                }
                else
                {
                    if (movespeed >= 12)
                    {
                        event_play_oneshot("event:/SFX/player/groundpound", x, y);
                        camera_shake_add(20, 40);
                        
                        with (obj_parent_baddie)
                        {
                            if (bbox_in_camera(id, view_camera[0]) && grounded)
                            {
                                stun = 1;
                                alarm[0] = 200;
                                ministun = 0;
                                vsp = -5;
                                hsp = 0;
                            }
                        }
                    }
                    
                    sprite_index = spr_player_GB_bounce_mach3_intro;
                    hsp = -3 * xscale;
                    vsp = -4;
                    machTwo = 0;
                }
            }
        }
        
        if (!key_slap && grounded)
        {
            if (!key_attack)
            {
                if (sprite_index != spr_machdashpad)
                {
                    if (move != 0)
                        xscale = move;
                    
                    event_play_oneshot("event:/SFX/player/break", x, y);
                    image_index = 0;
                    state = UnknownEnum.Value_1;
                }
            }
            else if (move != 0)
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
        else if (grounded)
        {
            if (slopeCheck(x, y))
                player_slopeMomentum(0.4, 0.25);
            
            if ((inputBufferJump > 0 && can_jump) || (vsp > 0.5 && gumbobRollBounceBuff == 1))
            {
                var jump_pitch = clamp((gumbobBounceCounter / 3) * 2, 0.6, 2);
                fmod_event_setPitch(event_play_oneshot("event:/SFX/player/gumbobbounceJump", x, y), jump_pitch);
                inputBufferJump = 0;
                vsp = -(9 + gumbobBounceCounter);
                gumbobRollBounceBuff = 1;
                gumbobBounceCounter++;
                
                if (gumbobBounceCounter > 3)
                    gumbobBounceCounter = 3;
            }
        }
    }
}
