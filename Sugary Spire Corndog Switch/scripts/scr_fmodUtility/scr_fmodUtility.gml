function fmod_listener_setPosition(argument0, argument1, argument2, argument3){
	var listener = 0;
	var xx = 0;
	var yy = 0;
	var zz = 0;
	listener = argument[0];
	xx = argument[1];
	yy = argument[2];

	if (argument_count == 4)
	    zz = argument[3];

	return ___INTERNAL_fmod_listener_setPosition(listener, xx, yy, zz);
}

function event_isplaying(arg0)
{
    return fmod_event_getPlaybackState(arg0) == 0;
}

function event_play_oneshot(arg0 = "", arg1 = undefined, arg2 = undefined, arg3 = 0)
{
    var _id = fmod_createEventInstance(arg0);
    fmod_event_play(_id);
    
    if (!is_undefined(arg1) && !is_undefined(arg2))
        fmod_event_set3DPosition(_id, arg1, arg2, arg3);
    
    fmod_event_release(_id);
    return _id;
}

function event_play_oneshot_ext(arg0 = "", arg1 = undefined, arg2 = undefined, arg3 = 0)
{
    var _id = fmod_createEventInstance(arg0);
    fmod_event_play(_id);
    
    if (!is_undefined(arg1) && !is_undefined(arg2))
        fmod_event_set3DPosition(_id, arg1, arg2, arg3);
    
    ds_list_add(global.FMOD_OneShotList, 
    {
        id: _id,
        name: arg0,
        one_shot: true
    });
    return _id;
}

function event_play_multiple(arg0 = "", arg1 = undefined, arg2 = undefined, arg3 = 0)
{
    for (var i = 0; i < ds_list_size(global.FMOD_OneShotList); i++)
    {
        var snd_id = ds_list_find_value(global.FMOD_OneShotList, i);
        
        if (snd_id.name == arg0)
            fmod_event_stop(snd_id.id, false);
    }
    
    var a = event_play_oneshot_ext(arg0, arg1, arg2, arg3);
    return a;
}

function fmod_quick3D(arg0, arg1 = x, arg2 = y, arg3 = 0)
{
    fmod_event_set3DPosition(arg0, arg1, arg2, arg3);
}

function kill_sounds(arg0)
{
    if (is_array(arg0))
    {
        for (var i = 0; i < array_length(arg0); i++)
        {
            var snd = arg0[i];
            fmod_event_stop(snd, true);
            fmod_event_release(snd);
        }
    }
    else
    {
        fmod_event_stop(arg0, true);
        fmod_event_release(arg0);
    }
}

function kill_sound_list(arg0)
{
    if (is_array(arg0))
    {
        for (var i = 0; i < array_length(arg0); i++)
        {
            var snd_id = arg0[i];
            
            for (var p = 0; p < ds_list_size(global.FMOD_OneShotList); p++)
            {
                var entry = ds_list_find_value(global.FMOD_OneShotList, p);
                
                if (entry != -4 && !is_undefined(entry) && entry.id == snd_id)
                {
                    kill_sounds(snd_id);
                    ds_list_delete(global.FMOD_OneShotList, p);
                    p--;
                }
            }
        }
    }
    else
    {
        var snd_id = arg0;
        
        for (var p = 0; p < ds_list_size(global.FMOD_OneShotList); p++)
        {
            var entry = ds_list_find_value(global.FMOD_OneShotList, p);
            
            if (entry != -4 && !is_undefined(entry) && entry.id == snd_id)
            {
                kill_sounds(snd_id);
                ds_list_delete(global.FMOD_OneShotList, p);
            }
        }
    }
}
