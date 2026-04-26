function state_player_ufofloat()
{
    static shoot_buffer = 0;
    
    var maxspeed = 10;
    var hspaccel = 0.5;
    var vspaccel = 0.5;
    
    if (sprite_index != spr_player_PZ_ufo_shoot)
    {
        move = key_right + key_left;
        move2 = key_down - key_up;
    }
    else
    {
        move = 0;
        move2 = 0;
    }
    
    if (sprite_index != spr_player_PZ_ufo_shoot && sprite_index != spr_player_PZ_ufo_shoot_hold)
        sprite_index = (ufoTimer <= 125) ? spr_player_PZ_ufo_low : spr_player_PZ_ufo;
    
    if (move != 0 && sprite_index != spr_player_PZ_ufo_shoot)
        xscale = move;
    
    if (key_attack && sprite_index != spr_player_PZ_ufo_shoot)
    {
        image_index = 0;
        sprite_index = spr_player_PZ_ufo_shoot;
    }
    
    if (!key_attack && sprite_index == spr_player_PZ_ufo_shoot)
    {
        image_index = 0;
        sprite_index = spr_player_PZ_ufo;
    }
    
    if (sprite_index == spr_player_PZ_ufo_shoot)
    {
        hsp = movespeed * xscale;
        movespeed = approach(movespeed, 10 * xscale, 0.75);
        verticalMovespeed = 0;
        vsp = 0;
    }
    
    if (sprite_index == spr_player_PZ_ufo_shoot && image_index == (image_number - 1))
        state = UnknownEnum.Value_46;
    
    movespeed = approach(movespeed, move * maxspeed, hspaccel);
    verticalMovespeed = approach(verticalMovespeed, move2 * maxspeed, vspaccel);
    hsp = movespeed;
    vsp = verticalMovespeed;
    
    if (place_meeting_collision(x + sign(hsp), y, UnknownEnum.Value_1) && !place_meeting(x + sign(hsp), y, obj_destructibles))
        movespeed = 0;
    
    if (place_meeting_collision(x, y + sign(vsp), UnknownEnum.Value_1) && !place_meeting(x, y + sign(vsp), obj_destructibles))
        verticalMovespeed = 0;
    
    if (hsp != 0 || vsp != 0)
    {
        with (create_afterimage(UnknownEnum.Value_0, xscale))
        {
            gonealpha = 0.85;
            alarm[0] = 1;
            alarm[1] = 60;
        }
    }
    
    if (key_slap2)
    {
        image_index = 0;
        state = UnknownEnum.Value_47;
    }
    
    image_speed = 0.35;
}

function state_player_ufodash()
{
    var maxspeed = 12;
    var hspaccel = 0.5;
    var vspaccel = 0.5;
    sprite_index = spr_player_PZ_ufo_speedUp;
    var _angle = (xscale > 0) ? 0 : 180;
    
    if (move != 0 || move2 != 0)
        _angle = point_direction(0, 0, move, move2);
    
    if (floor(image_index) < 4)
    {
        var _speed = 14;
        movespeed = lengthdir_x(_speed, _angle);
        hsp = movespeed;
        verticalMovespeed = lengthdir_y(_speed, _angle);
        vsp = verticalMovespeed;
    }
    else
    {
        move = key_right + key_left;
        move2 = key_down - key_up;
        
        if (move != 0)
            movespeed = approach(movespeed, move * maxspeed, hspaccel);
        
        if (move2 != 0)
            verticalMovespeed = approach(verticalMovespeed, move2 * maxspeed, vspaccel);
        
        hsp = movespeed;
        vsp = verticalMovespeed;
        
        if (place_meeting_collision(x + sign(hsp), y, UnknownEnum.Value_1) && !place_meeting(x + sign(hsp), y, obj_destructibles))
            movespeed = 0;
        
        if (place_meeting(x + sign(hsp), y, obj_honeybumperufo) && !place_meeting(x + sign(hsp), y, obj_destructibles))
            state = UnknownEnum.Value_46;
        
        if (place_meeting_collision(x, y + sign(vsp), UnknownEnum.Value_1) && !place_meeting(x, y + sign(vsp), obj_destructibles))
            verticalMovespeed = 0;
    }
    
    create_afterimage(choose(UnknownEnum.Value_1, UnknownEnum.Value_2), xscale);
    
    if (animation_end() && sprite_index == spr_player_PZ_ufo_speedUp)
        state = UnknownEnum.Value_45;
    
    image_speed = 0.5;
}

function state_player_ufospinout()
{
    hsp = movespeed * xscale;
    sprite_index = spr_player_PZ_ufo_low;
    movespeed = approach(movespeed, 10, 0.75);
    image_speed = 0.5;
    
    if (bumpedWallOrFloor == false && bumpedCeiling == false)
        vsp = 0;
    
    if (place_meeting_collision(x + sign(hsp), y, UnknownEnum.Value_1) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_beeblock))
    {
        xscale *= -1;
        movespeed = 5;
        bumpCounter += 1;
        
        if (bumpedCeiling)
        {
            bumpedWallOrFloor = false;
            bumpedCeiling = true;
        }
        else
        {
            bumpedWallOrFloor = true;
            bumpedCeiling = false;
        }
    }
    
    if (place_meeting(x + sign(hsp), y, obj_honeybumperufo) || place_meeting(x, y - 2, obj_honeybumperufo) || place_meeting(x, y + 2, obj_honeybumperufo))
        bumpCounter = 1;
    
    if (place_meeting_collision(x, y - 2, UnknownEnum.Value_1) && !place_meeting(x + sign(hsp), y, obj_beeblock))
    {
        bumpedWallOrFloor = false;
        bumpedCeiling = true;
        
        if (!place_meeting(x, y - 2, obj_honeybumperufo))
            bumpCounter += 1;
    }
    else if (place_meeting_collision(x, y + 2, UnknownEnum.Value_1) && !place_meeting(x + sign(hsp), y, obj_beeblock))
    {
        bumpedWallOrFloor = true;
        bumpedCeiling = false;
        
        if (!place_meeting(x, y - 2, obj_honeybumperufo))
            bumpCounter += 1;
    }
    
    if (bumpedWallOrFloor)
        vsp = -8;
    else if (bumpedCeiling)
        vsp = 8;
    
    if (bumpCounter >= 2)
    {
        state = UnknownEnum.Value_45;
        bumpedCeiling = false;
        bumpedWallOrFloor = false;
        movespeed = 0;
        hsp = 0;
        vsp = 0;
        bumpCounter = 0;
    }
}
