fmod_listener_setPosition(0, camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2), camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2), 0);
var old_size = size;
size = ds_list_size(global.FMOD_OneShotList);

for (var i = 0; i < size; i++)
{
    var entry = ds_list_find_value(global.FMOD_OneShotList, i);
    
    if (showDebug)
        trace(entry);
    
    if (!is_undefined(entry) && entry != -4 && entry != -4)
    {
        var snd_id = entry.id;
        
        if (snd_id != -4 && !is_undefined(snd_id) && entry.one_shot && fmod_event_getPlaybackState(snd_id) == 2)
        {
            kill_sounds(snd_id);
            ds_list_delete(global.FMOD_OneShotList, i);
        }
    }
}

if (size == 0 && old_size != size && showDebug)
    trace("Sound List Empty");

fmod_update();
