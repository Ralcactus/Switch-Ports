function state_player_trick()
{
    hsp = movespeed * xscale;
    
    if (sprite_index != spr_player_PZ_trick_intro && sprite_index != spr_player_PZ_trick)
    {
        sprite_index = spr_player_PZ_trick_intro;
        image_index = 0;
    }
    else if (animation_end() && sprite_index == spr_player_PZ_trick_intro)
    {
        sprite_index = spr_player_PZ_trick;
    }
    
    if (key_attack && (!grounded || slopeCheck(x + xscale, y)) && scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && (character == UnknownEnum.Value_0 || character == UnknownEnum.Value_1))
    {
        verticalMovespeed = movespeed;
        
        if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
            verticalMovespeed -= vsp;
        
        grabClimbBuffer = 0;
        inputBufferJump = 0;
        state = UnknownEnum.Value_11;
    }
    else if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
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
            state = UnknownEnum.Value_67;
            image_index = 0;
            sprite_index = spr_splat;
            event_play_oneshot("event:/SFX/player/splat", x, y);
        }
    }
    
    if (grounded)
    {
        fmod_event_play(sndRollGetUp);
        image_index = 0;
        sprite_index = spr_rollgetup;
        state = UnknownEnum.Value_65;
    }
    
    image_speed = 0.5;
    
    if (image_index >= 11 && image_index < 12)
        image_speed = 0;
}
