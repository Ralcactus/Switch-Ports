var _bgm;

if (audio_is_playing(music_frenzy))
    _bgm = music_frenzy;
else
    _bgm = music_play;

if (audio_is_playing(_bgm) && bpm != -4)
{
    var _pos = audio_sound_get_track_position(_bgm);
    var _beat = false;
    
    while (((beats - 1) * time_bpm_to_seconds(bpm)) >= _pos)
    {
        beats--;
        
        if (((beats - 1) * time_bpm_to_seconds(bpm)) < _pos)
            beats--;
    }
    
    while (_pos >= (time_bpm_to_seconds(bpm) * beats))
    {
        beats++;
        _beat = true;
    }
    
    if (_beat)
    {
        global.beat = true;
        
        if (((beats - 1) % 2) == 1)
            event_music_beat_double();
        
        event_music_beat();
        
        with (obj_buster_machine)
            event_music_beat();
        
        if (frenzy_started)
        {
            with (obj_buster_machine)
                event_user(0);
        }
    }
}

timer_logic(0);
timer_logic(1);
timer_logic(2);
timer_logic(3);
