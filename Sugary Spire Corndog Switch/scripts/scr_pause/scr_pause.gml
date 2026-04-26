function scr_pause_instances(arg0 = false)
{
    var dont_pause = [obj_pause, obj_fmod, obj_music, obj_parallax, obj_screen];
    
    if (arg0)
    {
        if (!is_undefined(global.RoomMusic))
        {
            roomMusicPause = fmod_event_getPause(global.RoomMusic.musicInst);
            
            if (!is_undefined(global.RoomMusic.secretMusicInst))
                secretPause = fmod_event_getPause(global.RoomMusic.secretMusicInst);
        }
        
        escapeMusicPause = fmod_event_getPause(global.EscapeMusicInst);
        fmod_event_setPause_all(true);
    }
    
    ds_list_clear(pausedInstances);
    
    for (var i = 0; i < instance_count; i++)
    {
        var me = instance_find(-3, i);
        
        if (instance_exists(me) && !array_contains(dont_pause, me.object_index))
            ds_list_add(pausedInstances, me);
    }
    
    instance_deactivate_all(true);
    
    for (var p = 0; p < array_length(dont_pause); p++)
        instance_activate_object(dont_pause[p]);
}

function scr_unpause_instances(arg0 = false)
{
    if (arg0)
    {
        fmod_event_setPause_all(false);
        
        if (!is_undefined(global.RoomMusic))
        {
            fmod_event_setPause(global.RoomMusic.musicInst, roomMusicPause);
            
            if (!is_undefined(global.RoomMusic.secretMusicInst))
                fmod_event_setPause(global.RoomMusic.secretMusicInst, secretPause);
        }
        
        fmod_event_setPause(global.EscapeMusicInst, escapeMusicPause);
    }
    
    for (var i = 0; i < ds_list_size(pausedInstances); i++)
    {
        var _id = ds_list_find_value(pausedInstances, i);
        instance_activate_object(_id);
        
        with (_id)
        {
            if (instance_exists(self) && variable_instance_exists(id, "mySoundArray"))
            {
                for (var s = 0; s < array_length(mySoundArray); s++)
                {
                    var snd_id = mySoundArray[s];
                    fmod_event_setPause(snd_id, false);
                }
            }
        }
    }
    
    ds_list_clear(pausedInstances);
}
