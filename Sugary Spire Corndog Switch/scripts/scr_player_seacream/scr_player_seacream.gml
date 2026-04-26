function state_player_seacream()
{
    move = key_left + key_right;
    hsp = movespeed;
    grav = 0.4;
    image_speed = 0.35;
    sprite_index = (move != 0) ? spr_player_seacream_walk : spr_player_seacream_idle;
    
    if (sign(hsp) != 0)
        xscale = sign(hsp);
    
    var mvsp = 5;
    var accel = 0.4;
    
    if (place_meeting(x, y + 1, obj_seacreamgoop_floor))
    {
        mvsp = 12;
        accel = 0.6;
    }
    
    if (move == -xscale)
        accel += 0.3;
    
    movespeed = approach(movespeed, move * mvsp, accel);
    
    if (key_jump && grounded)
    {
        sprite_index = spr_player_seacream_jump;
        image_index = 0;
        state = UnknownEnum.Value_147;
        vsp = -12;
        jumpStop = false;
    }
    else if (!grounded && !key_jump)
    {
        state = UnknownEnum.Value_147;
        jumpStop = true;
    }
    
    if (place_meeting_solid(x + hsp, y) && !place_meeting(x + hsp, y, obj_destructibles) && (!place_meeting(x + hsp, y, obj_metalblock) || abs(movespeed) < 12))
    {
        movespeed = 0;
        hsp = 0;
    }
}

function state_player_seacreamjump()
{
    move = key_left + key_right;
    hsp = movespeed;
    grav = 0.4;
    image_speed = 0.35;
    
    if (sprite_index != spr_player_seacream_walljump)
    {
        if (sprite_index != spr_player_seacream_jump || animation_end())
            sprite_index = spr_player_seacream_fall;
    }
    
    seacreamStickBuffer = max(seacreamStickBuffer - 1, 0);
    var mvsp = key_attack ? 6 : 4;
    var accel = 0.5;
    
    if ((move == -1 && movespeed > -mvsp) || (move != 1 && movespeed < mvsp))
        movespeed = approach(movespeed, move * mvsp, accel);
    
    if (grounded)
        state = UnknownEnum.Value_146;
    
    if (place_meeting_solid(x + hsp, y) && !place_meeting(x, y, obj_seacreamgoop) && !place_meeting(x + hsp, y, obj_destructibles) && (!place_meeting(x + hsp, y, obj_metalblock) || abs(movespeed) < 12))
    {
        movespeed = 0;
        hsp = 0;
    }
    
    if (place_meeting(x, y, obj_seacreamgoop) && place_meeting(x, y, obj_seacreamgoop) && (place_meeting_collision(x + sign(hsp), y, UnknownEnum.Value_1) || place_meeting_collision(x + xscale, y, UnknownEnum.Value_1)))
    {
        verticalMovespeed = 0;
        state = UnknownEnum.Value_148;
        seacreamStickBuffer = 20;
    }
    
    if (!key_jump2 && !jumpStop && vsp < 0.5 && !stompAnim)
    {
        vsp /= 20;
        jumpStop = true;
    }
}

function state_player_seacreamstick()
{
    move = key_left + key_right;
    hsp = xscale;
    vsp = 0;
    image_speed = 0.35;
    sprite_index = spr_player_seacream_stick;
    
    if (key_jump)
    {
        vsp = -10;
        state = UnknownEnum.Value_147;
        sprite_index = spr_player_seacream_walljump;
        xscale *= -1;
        movespeed = xscale * 10;
        seacreamStickBuffer = 1;
    }
    else if (!place_meeting_collision(x + xscale, y))
    {
        state = UnknownEnum.Value_147;
        hsp = 0;
        movespeed = 0;
    }
    
    if (move != 0 && move != xscale)
    {
        if (seacreamStickBuffer > 0)
        {
            seacreamStickBuffer--;
        }
        else
        {
            state = UnknownEnum.Value_146;
            xscale *= -1;
            movespeed = xscale * 4;
            seacreamStickBuffer = 10;
        }
    }
    else
    {
        seacreamStickBuffer = 20;
    }
}
