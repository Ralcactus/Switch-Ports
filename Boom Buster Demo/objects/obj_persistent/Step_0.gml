if (keyboard_check_pressed(ord("P")) && global.debug)
{
    global.palette++;
    
    if (global.palette > (sprite_get_width(pal_buster) - 3))
        global.palette = 0;
}

if (keyboard_check_pressed(vk_f10) && global.debug)
    debug_event("ResourceCounts");

if (keyboard_check_pressed(vk_f4))
    window_set_fullscreen(!window_get_fullscreen());

for (var i = 0; i < ds_list_size(global.list_ignorefreeze); i++)
{
    if (!instance_exists(ds_list_find_value(global.list_ignorefreeze, i)))
        ds_list_delete(global.list_ignorefreeze, i);
}

for (var i = 0; i < ds_list_size(global.audio_queues); i++)
{
    var _audio = ds_list_find_value(global.audio_queues, i);
    var _time = _audio.time;
    
    if (_time > 0)
    {
        if (!exit_freeze() || _audio.ignore_freeze)
            _audio.time--;
    }
    else
    {
        audio_play_sound(_audio.audio, 0, 0);
        ds_list_delete(global.audio_queues, i);
    }
}

for (var c = 0; c < 2; c++)
{
    if (shake_strength[c] != 0)
    {
        global.screenshake[c] = irandom_range(-shake_strength[c], shake_strength[c]);
        shake_strength[c] = approach(shake_strength[c], 0, shake_speed[c]);
        
        if (shake_strength[c] == 0)
            shake_speed[c] = shake_default;
    }
}

if (!exit_freeze())
{
    map_keys = ds_map_keys_to_array(global.map_particles);
    
    for (var i = 0; i < array_length(map_keys); i++)
    {
        var _part = map_keys[i];
        var _timer = ds_map_find_value(global.map_particles, map_keys[i]);
        _timer--;
        
        if (_timer > 0)
        {
            ds_map_replace(global.map_particles, _part, _timer);
        }
        else
        {
            ds_map_delete(global.map_particles, _part);
            part_type_destroy(_part);
        }
    }
}

part_system_automatic_update(global.part_over, !exit_freeze());
part_system_automatic_update(global.part_behind, !exit_freeze());
part_system_automatic_update(global.part_gui, !exit_freeze());
