global.sound_map = ds_map_create();

function scr_fmod_soundeffect(event_inst, xx, yy, zz = 0)
{
    fmod_studio_event_instance_start(event_inst);
    event_set_3d_position(event_inst, xx, yy, zz);
}

function scr_fmod_soundeffectONESHOT(event_inst, xx, yy, zz = 0)
{
    var event_id = event_instance(event_inst);
    fmod_studio_event_instance_start(event_id);
    event_set_3d_position(event_id, xx, yy, zz);
    fmod_studio_event_instance_release(event_id);
    return event_id;
}

function event_play_oneshot(event_inst)
{
    var event_id = event_instance(event_inst);
    fmod_studio_event_instance_start(event_id);
    fmod_studio_event_instance_release(event_id);
    return event_id;
}

function event_isplaying(event_inst)
{
    var _playback = fmod_studio_event_instance_get_playback_state(event_inst);
    return _playback != FMOD_STUDIO_PLAYBACK_STATE.STOPPED && _playback != FMOD_STUDIO_PLAYBACK_STATE.STOPPING;
}

function event_count_description(event_inst)
{
    return fmod_studio_event_description_get_instance_count(fmod_studio_system_get_event(event_inst));
}

function event_instance(event_inst)
{
    return fmod_studio_event_description_create_instance(fmod_studio_system_get_event(event_inst));
}

function event_pause_all(_pause)
{
    var _bus = ["bus:/Music/Pausable", "bus:/SFX/Pausable"];
    
    for (var i = 0; i < array_length(_bus); i++)
        fmod_studio_bus_set_paused(fmod_studio_system_get_bus(_bus[i]), _pause);
}

function event_set_3d_position(event_inst, xx, yy, zz = 0)
{
    if (!event_isplaying(event_inst))
        exit;
    
    var _attr = new Fmod3DAttributes();
    _attr.position.x = xx;
    _attr.position.y = yy;
    _attr.position.z = zz;
    _attr.forward.z = 1;
    _attr.up.y = 1;
    fmod_studio_event_instance_set_3d_attributes(event_inst, _attr);
}

function event_set_3d_position_struct(event_inst, _struct)
{
    if (!event_isplaying(event_inst))
        exit;
    
    fmod_studio_event_instance_set_3d_attributes(event_inst, _struct);
}

function event_stop(event_inst, _immediate)
{
    fmod_studio_event_instance_stop(event_inst, _immediate ? FMOD_STUDIO_STOP_MODE.IMMEDIATE : FMOD_STUDIO_STOP_MODE.ALLOWFADEOUT);
}

function event_stop_description(event_inst, _immediate)
{
    var _insts = fmod_studio_event_description_get_instance_list(fmod_studio_system_get_event(event_inst));
    
    for (var _i = 0; _i < array_length(_insts); _i++)
        event_stop(_insts[_i], _immediate);
}

function listener_setPosition(listener, xx, yy, zz = 0)
{
    var _attr = new Fmod3DAttributes();
    _attr.position.x = xx;
    _attr.position.y = yy;
    _attr.position.z = zz;
    _attr.forward.z = 1;
    _attr.up.y = 1;
    fmod_studio_system_set_listener_attributes(listener, _attr);
}

function destroy_sounds(event_inst_arr)
{
    for (var i = 0; i < array_length(event_inst_arr); i++)
    {
        var b = event_inst_arr[i];
        event_stop(b, 1);
        fmod_studio_event_instance_release(b);
    }
}

function event_replay(event_inst_arr, xx, yy, zz = 0)
{
    if (global.sound_map[? event_inst_arr] == undefined)
        global.sound_map[? event_inst_arr] = ds_list_create();
    
    var _list = global.sound_map[? event_inst_arr];
    
    for (var i = 0; i < ds_list_size(_list); i++)
    {
        b = _list[| i];
        event_stop(b, 0);
        fmod_studio_event_instance_release(b);
    }
    
    ds_list_clear(_list);
    var b = event_instance(event_inst_arr);
    fmod_studio_event_instance_start(b);
    event_set_3d_position(b, xx, yy, zz);
    ds_list_add(_list, b);
}
