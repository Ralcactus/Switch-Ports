function scr_pizzano_kungfu()
{
    move = key_left + key_right;
    hsp = xscale * movespeed;
    var kungfu_air_sprites = [spr_player_PN_kungfuAir_1, spr_player_PN_kungfuAir_2, spr_player_PN_kungfuAir_3];
    var kungfu_air_start_sprites = [spr_player_PN_kungfuAir_1_intro, spr_player_PN_kungfuAir_2_intro, spr_player_PN_kungfuAir_3_intro];
    var kungfu_air = array_contains(kungfu_air_sprites, sprite_index) || array_contains(kungfu_air_start_sprites, sprite_index);
    
    if (grounded)
    {
        if (move != 0)
        {
            if (move == xscale && movespeed < 12)
                movespeed += 0.5;
            
            if (move != xscale && movespeed > -12)
                movespeed -= 0.4;
        }
        else if (kungTime <= 15 && movespeed > 0 && !key_attack)
        {
            movespeed -= 0.15;
        }
        
        if (animation_end() || kungfu_air)
        {
            if (key_attack || (kungBuffer >= 0 && kungfu_air))
                state = UnknownEnum.Value_64;
            else
                state = UnknownEnum.Value_1;
            
            if (kungBuffer > 0)
            {
                movespeed++;
                kungBuffer = 15;
            }
            
            movespeed = max(movespeed, 6);
        }
        
        if (inputBufferJump > 0 && can_jump)
        {
            jumpStop = false;
            vsp = -12;
            sprite_index = choose(spr_player_PN_kungfuAir_1_intro, spr_player_PN_kungfuAir_2_intro, spr_player_PN_kungfuAir_3_intro);
            image_index = 0;
            inputBufferJump = 0;
        }
    }
    else
    {
        if (move != 0)
        {
            if (move == xscale && movespeed < 12)
                movespeed += 0.5;
            else if (move != xscale && movespeed > -12)
                movespeed -= 0.4;
        }
        
        if (array_contains(kungfu_air_start_sprites, sprite_index) && animation_end())
            sprite_index = kungfu_air_sprites[array_get_index(kungfu_air_start_sprites, sprite_index)];
        
        if (key_down)
        {
            kungBuffer = 10;
            vsp = 12;
        }
        
        if (grounded)
        {
            if (key_attack || kungBuffer >= 0)
                state = UnknownEnum.Value_64;
            else
                state = UnknownEnum.Value_1;
            
            if (kungBuffer > 0)
                movespeed = min(movespeed + 1, 6);
        }
    }
    
    image_speed = 0.35;
    
    if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        if ((!grounded || slopeCheck(x + xscale, y)) && key_attack)
        {
            verticalMovespeed = movespeed;
            
            if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
                verticalMovespeed -= round(vsp * 1.25);
            else if (vsp > 0 && character == UnknownEnum.Value_1)
                verticalMovespeed -= vsp;
            
            grabClimbBuffer = 0;
            inputBufferJump = 0;
            state = UnknownEnum.Value_11;
        }
        else
        {
            state = UnknownEnum.Value_67;
            hsp = -2.5 * xscale;
            vsp = -3;
            machTwo = 0;
            image_index = 0;
            instance_create(x + (10 * xscale), y + 10, obj_bumpEffect);
        }
    }
}
