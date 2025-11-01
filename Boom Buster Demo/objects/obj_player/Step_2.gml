if (state == state_cannon && !cannon_shot)
{
    x = my_cannon.x;
    y = my_cannon.y;
}

if (recording)
{
    var _hello = 
    {
        f: recording_frame
    };
    
    if (anim_sprite != last_recording_spr)
        _hello.spr = sprite_get_name(anim_sprite);
    
    if (anim_index != last_recording_ind)
        _hello.ind = floor(anim_index);
    
    if (facing != last_recording_facing)
        _hello.facing = facing;
    
    if (x != last_recording_x)
        _hello.x = x;
    
    if (x != last_recording_y)
        _hello.y = y;
    
    array_push(recorded_movements, _hello);
    last_recording_spr = anim_sprite;
    last_recording_ind = anim_index;
    last_recording_facing = facing;
    last_recording_x = x;
    last_recording_y = y;
    recording_frame++;
}
