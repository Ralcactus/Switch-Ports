function scr_player_platformlocked()
{
    if (sprite_index != spr_player_platformhop)
        sprite_index = spr_player_idle;
    else
    {
        var _lerpval = image_index - 2;
        _lerpval = clamp(_lerpval, 0, 4);
        _lerpval /= (sprite_get_number(sprite_index) - 7);
        x = lerp(platformstartpos, platformtargetpos, _lerpval);
        
        if (sprite_animation_end())
        {
            sprite_index = spr_player_idle;
            x = platformtargetpos;
        }
    }
    
    image_speed = 0.35;
    hsp = 0;
    vsp = 0;
    movespeed = 0;
}
