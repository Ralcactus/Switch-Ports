function scr_enemy_rage()
{
    switch (object_index)
    {
        case obj_eyescream:
            var p = get_nearestPlayer();
            var _dir = point_direction(x, y, p.x, p.y);
            
            switch (sprite_index)
            {
                case spr_eyescreamsandwich_divestart:
                    if (animation_end())
                    {
                        hsp = lengthdir_x(10, _dir);
                        vsp = lengthdir_y(10, _dir);
                        ragereset = 50;
                        sprite_index = spr_eyescreamsandwich_dive;
                    }
                    
                    break;
                
                case spr_eyescreamsandwich_dive:
                    x += hsp;
                    y += vsp;
                    
                    if (ragereset <= 0)
                    {
                        state = UnknownEnum.Value_21;
                        ragereset = 200;
                    }
                    
                    if (place_meeting(x, y, obj_parent_player))
                    {
                        giveScore = false;
                        instance_destroy();
                        instance_create(x, y, obj_bombExplosionHarmful);
                    }
                    
                    break;
            }
            
            break;
        
        case obj_doggy:
            image_speed = 0.35;
            
            if (sprite_index == spr_badmarsh_ragestart)
            {
                hsp = 0;
                
                if (animation_end())
                {
                    sprite_index = spr_badmarsh_rage;
                    hsp = image_xscale * 5;
                    lunged = 50;
                    
                    with (instance_create(x, y, obj_forkhitbox, 
                    {
                        ID: other.id
                    }))
                    {
                        ID = other.id;
                        image_xscale = other.image_xscale;
                        depth = -1;
                    }
                }
            }
            else if (sprite_index == spr_badmarsh_rage)
            {
                hsp = approach(hsp, image_xscale * 8, 0.3);
                lunged--;
                
                if (lunged <= 0)
                {
                    hsp = image_xscale * 4;
                    movespeed = 4;
                    sprite_index = spr_badmarsh_rageend;
                }
                
                if (place_meeting_solid(x + image_xscale, y) && !place_meeting_slope(x, y + 1))
                {
                    lunged = 0;
                    hsp = image_xscale * 4;
                    movespeed = 4;
                    sprite_index = spr_badmarsh_rageend;
                }
            }
            else if (sprite_index == spr_badmarsh_rageend)
            {
                hsp = approach(hsp, 0, 0.1);
                
                if (animation_end())
                {
                    state = UnknownEnum.Value_1;
                    movespeed = 1;
                    bombreset = 200;
                }
            }
            
            break;
        
        case obj_babyBearOLD:
            if (animation_end(undefined, 10))
                hsp = image_xscale * 8;
            else
                hsp = 0;
            
            if (animation_end())
            {
                state = UnknownEnum.Value_1;
                sprite_index = baddieSpriteWalk;
            }
            
            break;
        
        case obj_betonbacon:
            if (animation_end(undefined, 10))
                hsp = 0;
            else
                hsp = 0;
            
            if (animation_end())
            {
                state = UnknownEnum.Value_1;
                sprite_index = baddieSpriteWalk;
            }
            
            break;
        
        case obj_sluggy:
            hsp = image_xscale * movespeed;
            
            if (animation_end())
                movespeed--;
            
            if (movespeed <= 0)
            {
                state = UnknownEnum.Value_1;
                sprite_index = baddieSpriteWalk;
                movespeed = 1;
                hsp = 0;
            }
            
            break;
        
        case obj_painter:
            scr_painter_dash();
            break;
        
        case obj_fancypancake:
            image_speed = 0.35;
            invisFrames = 100;
            
            if (sprite_index == spr_golfburger_golf)
            {
                with (obj_parent_player)
                {
                    if (state == UnknownEnum.Value_78 || state == UnknownEnum.Value_79)
                    {
                        movelocked = true;
                        xscale = other.image_xscale;
                        state = UnknownEnum.Value_82;
                        image_index = 0;
                        sprite_index = spr_player_PZ_dogMount_spin;
                        movespeed = abs(movespeed);
                        vsp = -5;
                        movespeed = 12;
                    }
                }
            }
            
            if (animation_end(undefined, 3))
            {
                if (point_in_rectangle(obj_parent_player.x, obj_parent_player.y, x - 200, y - 50, x + 200, y + 50) && obj_parent_player.state == UnknownEnum.Value_78)
                {
                    with (obj_parent_player)
                        sign(xscale);
                }
            }
            
            if (animation_end(undefined, 5))
            {
                movelocked = false;
                sprite_index = spr_golfburger_walk;
                state = UnknownEnum.Value_1;
                bombreset = 200;
            }
            
            break;
    }
}
