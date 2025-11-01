if (keyboard_check_pressed(vk_space))
{
    var _playing = audio_is_playing(bgm_play);
    
    if (!_playing)
        bgm_play = audio_play_sound(bgm, 0, 0);
    
    var _paused = audio_is_paused(bgm_play);
    
    if (_paused)
    {
        audio_resume_sound(bgm_play);
        played_at = audio_sound_get_track_position(bgm_play);
    }
    else
    {
        audio_pause_sound(bgm_play);
    }
}

if (keyboard_check_pressed(vk_enter))
{
    var _str = string("events = {0};", events);
    clipboard_set_text(_str);
}

var _spd = 64 + (keyboard_check(vk_shift) * 4);
var _scroll = mouse_wheel_down() - mouse_wheel_up();
scroll_y -= (_scroll * _spd);

if (keyboard_check_pressed(vk_f1))
{
    audio_stop_all();
    var _inst = instance_create_layer(0, 0, layer, obj_rhythm_game);
    _inst.events = events;
    _inst.events_remember = [];
    array_copy(_inst.events_remember, 0, events, 0, array_length(events));
    _inst.bgm = bgm;
    _inst.bpm = bpm;
    
    with (_inst)
        bgm_play = audio_play_sound(bgm, 0, 0);
    
    instance_destroy();
}
