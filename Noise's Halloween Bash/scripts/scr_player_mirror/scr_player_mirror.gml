function scr_player_mirror()
{
    static playSfx = false;
    
    static endState = function()
    {
        x = outhousestartx;
        y = outhousestarty;
        z = nonplatZ;
        sprite_index = spr_player_idle;
        image_index = 0;
        state = states.normal;
        playSfx = false;
    };
    
    var _mirror = instance_place(x, y, obj_mirror);
    
    if (_mirror == noone)
        endState();
    else
    {
        if (sprite_index == spr_player_platformhop)
        {
            var _lerpval = image_index - 2;
            _lerpval = clamp(_lerpval, 0, 4);
            _lerpval /= (sprite_get_number(sprite_index) - 7);
            x = lerp(outhousestartx, _mirror.x, _lerpval);
            y = lerp(outhousestarty, outhousestarty, _lerpval);
            z = lerp(nonplatZ, _mirror.depth, _lerpval);
            
            if (sprite_animation_end())
            {
                sprite_index = spr_player_turnaround;
                image_index = 0;
                _mirror.alarm[0] = 20;
            }
        }
        
        if (sprite_index != spr_player_platformhop)
        {
            sprite_index = spr_player_turnaround;
            image_index = 0;
            x = _mirror.x;
            y = outhousestarty;
            z = _mirror.depth;
        }
        
        if (z >= _mirror.depth)
        {
            if (!playSfx)
            {
                scr_createparticle(true, x, y, _mirror.depth - 4, spr_gemeffect);
                event_play_oneshot("event:/sfx/misc/mirrorenter");
                playSfx = true;
            }
            
            visible = false;
        }
        else
            playSfx = false;
    }
    
    image_speed = 0.35;
    hsp = 0;
    vsp = 0;
    movespeed = 0;
}
