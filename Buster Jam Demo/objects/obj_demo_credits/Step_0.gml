testvariablenothing = false;
time += global.delta_game_factor;
logo_scale = use_curve(acurv_elastic_less, percent_logo, undefined, logo_start, 1);
percent_logo = approach(percent_logo, 1, 0.07);

if (audio_is_playing(global.bgm_play))
{
    var _bgm = global.bgm_play;
    
    if (audio_is_playing(_bgm) && bpm != -4)
    {
        var _pos;
        
        if (audio_sound_get_track_position(global.bgm_play) < 8)
            _pos = audio_sound_get_track_position(_bgm);
        else
            _pos = audio_sound_get_track_position(_bgm) - (time_bpm_to_seconds(bpm) * 0.5);
        
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
            if (beats != 17)
            {
                global.beat = true;
                
                if ((beats > 17 && (beats % 2) == 0) || (beats < 17 && (beats % 2) == 1))
                    global.beat_double = true;
            }
        }
    }
}

if (!deac)
{
    glyph_alpha = approach(glyph_alpha, 1, 1/15);
    
    if (input_check_pressed("jump"))
    {
        audio_fadeout_stop(global.bgm_play, 0, 1000);
        room_goto_fade(rm_title_load, 120);
    }
}

timer_logic(0);
