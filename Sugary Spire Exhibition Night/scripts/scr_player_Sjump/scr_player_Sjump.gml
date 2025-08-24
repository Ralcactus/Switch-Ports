function state_player_Sjump()
{
    static piledrivereffect = 2;
    static cloudeffect = 2;
    
    hsp = 0;
    sJumpCanDoubleJump = false;
    machTwo = 0;
    jumpAnim = true;
    landAnim = false;
    crouchAnim = false;
    move = key_left + key_right;
    
    if (move != 0 && sprite_index != spr_superspring)
    {
        if (global.playerCharacter == 0)
        {
            if (xscale != move)
            {
                movespeed = 0;
                xscale = move;
            }
        }
        
        hsp = movespeed * sign(move);
        movespeed = approach(movespeed, 3, 0.5);
    }
    else
    {
        movespeed = 0;
    }
    
    if (sprite_index == spr_superjump)
    {
        if (!piledrivereffect--)
        {
            instance_create(x, y, obj_verticalHoopEffect, 
            {
                playerID: id,
                image_angle: 90
            });
            piledrivereffect = 15;
        }
        
        if (!cloudeffect--)
        {
            create_particle(x + irandom_range(-25, 25), y + irandom_range(-10, 35), spr_cloudEffect);
            cloudeffect = 8;
        }
    }
    
    if (sprite_index == spr_superjump || sprite_index == spr_player_PZ_fall_outOfControl || sprite_index == spr_player_PN_fall_outOfControl || sprite_index == spr_superspring)
    {
        vsp = verticalMovespeed;
        verticalMovespeed -= 0.1;
    }
    
    if (sprite_index == spr_superjumpCancelIntro)
        vsp = 0;
    
    if (scr_solid(x, y + vsp) && !place_meeting(x, y + vsp, obj_transportBox) && !place_meeting(x, y + vsp, obj_metalblock) && !place_meeting(x, y + vsp, obj_destructibles) && sprite_index != spr_superjumpCancelIntro)
    {
        event_play_oneshot("event:/SFX/player/groundpound", x, y);
        sprite_index = (sprite_index == spr_superspring || sprite_index == spr_player_PZ_fall_outOfControl) ? spr_superspringLand : spr_superjumpLand;
        camera_shake_add(10, 30);
        
        with (obj_parent_enemy)
        {
            if (bbox_in_camera(id, view_camera[0]) && grounded)
            {
                vsp = -7;
                hsp = 0;
            }
        }
        
        image_index = 0;
        state = 20;
    }
    else if ((key_attack2 || inputBufferSlap > 0) && sprite_index != spr_player_PZ_fall_outOfControl && sprite_index != spr_superspring && sprite_index != spr_superjumpCancelIntro)
    {
        event_play_oneshot("event:/SFX/player/superjumpcancel", x, y);
        image_index = 0;
        image_speed = 0.5;
        vsp = 0;
        sprite_index = spr_superjumpCancelIntro;
        inputBufferSlap = 0;
    }
    
    if (sprite_index == spr_superjumpCancelIntro)
    {
        if (global.playerCharacter == 0)
        {
            hsp = 0;
            movespeed = 0;
        }
        else
        {
            movespeed = 4;
        }
        
        if (sprite_animation_end())
        {
            if (move != 0)
                xscale = move;
            
            movespeed = 12;
            
            if (global.playerCharacter == 1)
            {
                state = 32;
                vsp = -7;
            }
            else
            {
                state = 33;
                vsp = -4;
            }
            
            flash = true;
            jumpStop = true;
            image_index = 0;
            sprite_index = spr_superjumpCancel;
            
            if (global.playerCharacter == 0)
                fmod_studio_event_instance_start(sndMachStart);
            
            with (create_particle(x, y, spr_crazyRunHoopEffect))
                image_xscale = other.xscale;
        }
    }
    
    image_speed = 0.5;
    
    if (sprite_index == spr_superjumpCancelIntro)
    {
        image_speed = 0.55;
    }
    else if (sprite_index != spr_superjumpCancelIntro)
    {
        if (!instance_exists(superJumpEffect))
        {
            superJumpEffect = instance_create(x, y - 35, obj_superJumpEffect, 
            {
                playerID: id
            });
        }
    }
}
