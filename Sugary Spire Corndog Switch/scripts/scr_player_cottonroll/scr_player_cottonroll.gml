function state_player_cottonroll()
{
    static cotton_afterimage_timer = 6;
    
    var room_to_jump = !(place_meeting_solid(x, y - 16) || place_meeting_solid(x, y - 32));
    sprite_index = (movespeed < 12) ? spr_player_PZ_cotton_roll : spr_player_PZ_cotton_rollMax;
    hsp = xscale * movespeed;
    dir = xscale;
    momemtum = true;
    
    if (place_meeting_solid(x + xscale, y) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_chocofrog))
    {
        state = UnknownEnum.Value_87;
        sprite_index = spr_player_PZ_cotton_splat_intro;
        image_index = 0;
        movespeed = 0;
        create_particle(x, y, spr_bangEffect);
    }
    
    movespeed = max(movespeed, 8);
    
    if (movespeed > 8 && movespeed < 14)
        player_slopeMomentum(0.1, 1);
    
    if (grounded && !key_down && movespeed <= 8 && room_to_jump)
    {
        state = UnknownEnum.Value_87;
        sprite_index = spr_cottonidle;
        momemtum = true;
    }
    
    if (inputBufferJump > 0 && !can_jump)
    {
        momemtum = true;
        state = UnknownEnum.Value_87;
        vsp = -10;
        grav = 0.025;
        image_index = 0;
        sprite_index = spr_player_PZ_cotton_doubleJump;
        
        with (instance_create(x, y, obj_highJumpCloud1, 
        {
            playerID: id
        }))
        {
            image_xscale = other.xscale;
            sprite_index = spr_cottonpoof;
        }
        
        event_play_oneshot("event:/SFX/cotton/doublejump", x, y);
        inputBufferJump = 0;
    }
    
    if (inputBufferJump > 0 && grounded && !place_meeting_solid(x, y - 16) && !place_meeting_solid(x, y - 32))
    {
        momemtum = true;
        state = UnknownEnum.Value_87;
        vsp = -14;
        grav = 0.025;
        image_index = 0;
        sprite_index = spr_player_PZ_cotton_jump;
        instance_create(x, y, obj_highJumpCloud1, 
        {
            playerID: id
        });
        event_play_oneshot("event:/SFX/cotton/jump", x, y);
        inputBufferJump = 0;
    }
    
    if (inputBufferSlap > 0)
    {
        inputBufferSlap = 0;
        flash = true;
        image_index = 0;
        sprite_index = spr_player_PZ_cotton_attack;
        movespeed = max(movespeed, 12);
        vsp = grounded ? 0 : -5;
        grav = 0.2;
        grounded = false;
        state = UnknownEnum.Value_87;
        event_play_oneshot("event:/SFX/cotton/attack", x, y);
        groundedCot = false;
    }
    
    cotton_afterimage_timer = max(cotton_afterimage_timer - 1, 0);
    
    if (cotton_afterimage_timer <= 0)
    {
        instance_create(x, y, obj_cottonAfterEffect, 
        {
            playerID: id
        });
        cotton_afterimage_timer = 6;
    }
    
    dir = xscale;
    image_speed = ((movespeed / 12) + 1) * 0.35;
}
