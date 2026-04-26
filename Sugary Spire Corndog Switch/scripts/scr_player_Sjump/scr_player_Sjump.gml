function state_player_Sjump()
{
    hsp = 0;
    sJumpCanDoubleJump = false;
    machTwo = 0;
    jumpAnim = true;
    landAnim = false;
    crouchAnim = false;
    move = key_left + key_right;
    
    if (move != 0)
        xscale = move;
    
    if (sprite_index == spr_player_PZ_superJump || sprite_index == spr_player_PZ_fall_outOfControl || sprite_index == spr_player_PN_superjump || sprite_index == spr_player_PZ_superSpring)
    {
        vsp = verticalMovespeed;
        verticalMovespeed -= 0.1;
    }
    
    if (sprite_index == spr_player_PN_superJump_prep || sprite_index == spr_player_PZ_superJump_cancel_intro)
        vsp = 0;
    
    if (sprite_index == spr_player_PN_superJump_prep && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_player_PN_superjump;
        vsp = -10;
    }
    
    if (scr_solid(x, y + vsp) && !place_meeting(x, y + vsp, obj_boxofpizza) && !place_meeting(x, y + vsp, obj_metalblock) && !place_meeting(x, y + vsp, obj_destructibles) && sprite_index != spr_player_PZ_superJump_cancel_intro)
    {
        event_play_oneshot("event:/SFX/player/groundpound", x, y);
        sprite_index = (sprite_index == spr_player_PZ_superSpring) ? spr_player_PZ_superSpring_land : spr_player_PZ_superJump_land;
        camera_shake_add(10, 30);
        
        with (obj_parent_baddie)
        {
            if (bbox_in_camera(id, view_camera[0]) && grounded)
            {
                image_index = 0;
                state = UnknownEnum.Value_0;
                vsp = -7;
                hsp = 0;
            }
        }
        
        image_index = 0;
        state = UnknownEnum.Value_50;
    }
    else if ((key_attack2 || inputBufferSlap > 0) && character == UnknownEnum.Value_0 && sprite_index != spr_player_PZ_superSpring && sprite_index != spr_player_PZ_superJump_cancel_intro)
    {
        event_play_oneshot("event:/SFX/player/superjumpcancel", x, y);
        image_index = 0;
        image_speed = 0.5;
        vsp = 0;
        sprite_index = spr_player_PZ_superJump_cancel_intro;
        inputBufferSlap = 0;
    }
    
    if (sprite_index == spr_player_PZ_superJump_cancel_intro && animation_end())
    {
        if (move != 0)
            xscale = move;
        
        movespeed = 13;
        state = UnknownEnum.Value_65;
        flash = true;
        jumpStop = true;
        vsp = -4;
        image_index = 0;
        sprite_index = spr_player_PZ_superJump_cancel;
        
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale;
    }
    
    if ((key_attack2 || inputBufferSlap > 0) && !grounded && vsp < -10 && character == UnknownEnum.Value_1)
    {
        inputBufferSlap = 0;
        event_play_oneshot("event:/SFX/player/superjumpcancel", x, y);
        flash = true;
        charged = false;
        sprite_index = spr_player_PN_sideSuperJump_prep;
        image_index = 0;
        movespeed = 0;
        vsp = 0;
        machTwo = 0;
        state = UnknownEnum.Value_103;
    }
    
    image_speed = 0.5;
    
    if (sprite_index == spr_player_PZ_superJump_cancel_intro)
        image_speed = 0.55;
}
