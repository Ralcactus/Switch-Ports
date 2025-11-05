function scr_player_outhouse()
{
    static endState = function()
    {
        x = outhousestartx;
        y = outhousestarty;
        z = nonplatZ;
        sprite_index = spr_player_idle;
        image_index = 0;
        state = states.normal;
    };
    
    var _outhouse = instance_place(x, y, obj_outhouse);
    
    if (_outhouse == noone)
        endState();
    else if (sprite_index != spr_player_platformhop)
    {
        x = _outhouse.x + 4;
        y = outhousestarty - 9;
        z = nonplatZ + 20;
        sprite_index = spr_player_turnaround;
        image_index = 0;
    }
    else
    {
        var _lerpval = image_index - 2;
        _lerpval = clamp(_lerpval, 0, 4);
        _lerpval /= (sprite_get_number(sprite_index) - 7);
        
        if (!outhousegoin)
            _lerpval = 1 - _lerpval;
        
        x = lerp(outhousestartx, _outhouse.x + 2, _lerpval);
        y = lerp(outhousestarty, outhousestarty - 9, _lerpval);
        z = lerp(nonplatZ, nonplatZ + 20, _lerpval);
        
        if (sprite_animation_end())
        {
            if (outhousegoin)
            {
                sprite_index = spr_player_turnaround;
                image_index = 0;
                x = _outhouse.x + 4;
                y = outhousestarty - 9;
                z = nonplatZ + 20;
                _outhouse.alarm[0] = 20;
            }
            else
                endState();
        }
    }
    
    image_speed = 0.35;
    hsp = 0;
    vsp = 0;
    movespeed = 0;
}
