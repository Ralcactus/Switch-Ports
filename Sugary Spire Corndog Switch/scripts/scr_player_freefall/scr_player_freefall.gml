function state_player_freefall()
{
    if (place_meeting(x, y, obj_vertical_hallway))
        exit;
    
    landAnim = true;
    
    if (vsp >= 2)
    {
        vsp += 0.5;
        
        if (verticalMovespeed > 17 && !instance_exists(obj_piledrivereffect))
        {
            instance_create(x, y, obj_piledrivereffect, 
            {
                playerID: id
            });
        }
    }
    
    if (vsp > 0)
        freeFallSmash++;
    else if (vsp < 0)
        freeFallSmash = -14;
    
    move = key_left + key_right;
    
    if (!grounded)
    {
        hsp = (sprite_index == spr_player_PZ_fall_outOfControl) ? 0 : (move * movespeed);
        
        if (move != xscale && momemtum && movespeed != 0)
            movespeed -= 0.05;
        
        if (movespeed == 0)
            momemtum = false;
        
        if ((move == 0 && !momemtum) || scr_solid(x + hsp, y))
        {
            movespeed = 0;
            machTwo = 0;
        }
        
        if (move != 0 && movespeed < 7)
            movespeed += 0.25;
        
        if (movespeed > 7)
            movespeed -= 0.05;
        
        if (scr_solid(x + move, y) && move != 0)
            movespeed = 0;
        
        if (dir != xscale)
        {
            machTwo = 0;
            dir = xscale;
            movespeed = 0;
        }
        
        if (move == -xscale)
        {
            machTwo = 0;
            movespeed = 0;
            momemtum = false;
        }
        
        if (move != 0)
            xscale = move;
    }
    
    if (sprite_index != spr_player_PZ_fall_outOfControl)
    {
        if (global.treat)
            sprite_index = spr_player_donutSlam;
        else if (sprite_index == spr_bodyslamstart)
            sprite_index = spr_bodyslamfall;
    }
    
    if (sprite_index == spr_bombdropstart && animation_end())
    {
        image_index = 0;
        sprite_index = spr_bombdropfall;
    }
    
    if (grounded && (freeFallSmash < 10 || !place_meeting(x, y + vsp, obj_metalblock)) && !place_meeting(x, y + vsp, obj_destructibles))
    {
        if (slopeCheck(x, y) && !place_meeting(x, y, obj_dashpad))
        {
            state = UnknownEnum.Value_28;
            sprite_index = spr_crouchslip;
            movespeed = (freeFallSmash > 20) ? 12 : 8;
            xscale = -slopeMomentum_direction();
            
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale;
        }
        else
        {
            event_play_oneshot("event:/SFX/player/groundpound", x, y);
            image_index = 0;
            state = UnknownEnum.Value_70;
            jumpAnim = true;
            jumpStop = false;
            
            with (obj_parent_baddie)
            {
                if (bbox_in_camera(id, view_camera[0]) && grounded)
                {
                    vsp = -7;
                    hsp = 0;
                }
            }
            
            camera_shake_add(10, 30);
            combo = 0;
            instance_create(x, y, obj_landcloud);
            freefallstart = 0;
            image_index = 0;
            var landing_sprite_transitions = [[spr_bodyslamfall, spr_bodyslamland], [spr_player_PZ_fall_outOfControl, spr_bodyslamland], [spr_player_donutSlam, spr_player_donutSlam_land], [spr_bombdropfall, spr_bombdropland], [spr_bombdropstart, spr_bombdropland]];
            
            for (var i = 0; i < array_length(landing_sprite_transitions); i++)
            {
                if (sprite_index == landing_sprite_transitions[i][0])
                    sprite_index = landing_sprite_transitions[i][1];
            }
        }
    }
    
    image_speed = 0.35;
    
    if (freeFallSmash >= 10)
    {
        if (!instance_exists(groundpoundEffect))
        {
            groundpoundEffect = instance_create(x, y + 32, obj_groundPoundEffect, 
            {
                playerID: id
            });
        }
    }
}
