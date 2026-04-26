function state_player_run()
{
    move = key_left + key_right;
    hsp = xscale * movespeed;
    scr_conveyorBeltKinematics();
    
    if (hsp != 0 && grounded && vsp > 0)
    {
        stepBuffer--;
        
        if (stepBuffer <= 0 && grounded && vsp > 0)
        {
            stepBuffer = 16;
            instance_create(x, y + 43, obj_puffEffect);
            event_play_oneshot("event:/SFX/player/step", x, y + 46);
        }
    }
    
    if (!(animation_end() && sprite_index == spr_mach1))
        sprite_index = (movespeed < 12) ? spr_mach2 : spr_mach3player;
    
    if (move != 0 && key_attack)
    {
        if (move == xscale)
        {
            movespeed = approach(movespeed, 12, 0.35);
        }
        else if (movespeed > 2)
        {
            xscale = move;
            state = UnknownEnum.Value_66;
            sprite_index = spr_runskid;
        }
        else
        {
            xscale = move;
            movespeed = 0;
        }
    }
    else
    {
        movespeed = approach(movespeed, 0, 0.5);
        
        if (grounded && movespeed <= 7)
            state = UnknownEnum.Value_1;
    }
    
    if (!key_jump2 && !jumpStop && vsp < 0.5)
    {
        vsp /= 20;
        jumpStop = true;
    }
    
    if (grounded && vsp > 0)
        jumpStop = false;
    
    if (inputBufferJump > 0 && can_jump && move != -xscale)
    {
        if (character == UnknownEnum.Value_3)
        {
            state = UnknownEnum.Value_119;
        }
        else
        {
            image_index = 0;
            sprite_index = spr_mach3jump;
            inputBufferJump = 0;
            fmod_event_play(sndJump);
            vsp = -11;
        }
    }
    
    if (movespeed >= 12)
    {
        if (!instance_exists(obj_chargeEffect))
        {
            instance_create(x, y, obj_chargeEffect, 
            {
                playerID: id
            });
        }
        
        if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock))
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
                event_play_oneshot("event:/SFX/player/groundpound", x, y);
                camera_shake_add(20, 40);
                image_speed = 0.35;
                
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
                
                flash = false;
                combo = 0;
                sprite_index = spr_mach3hitwall;
                state = UnknownEnum.Value_67;
                hsp = -2.5 * xscale;
                vsp = -3;
                machTwo = 0;
                image_index = 0;
                instance_create(x + (10 * xscale), y + 10, obj_bumpEffect);
            }
        }
    }
    else if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        movespeed = 0;
        state = UnknownEnum.Value_1;
    }
    
    if (movespeed > 4)
        image_speed = movespeed / 12;
    else
        image_speed = 0.35;
    
    if (!instance_exists(dashCloudID) && grounded && movespeed > 2)
    {
        with (instance_create(x, y, obj_dashCloud, 
        {
            playerID: id
        }))
        {
            playerID.dashCloudID = id;
            
            if (playerID.movespeed >= 8)
                sprite_index = spr_dashcloud2;
            else
                sprite_index = spr_dashCloud;
        }
    }
    
    do_grab();
    do_taunt();
}
