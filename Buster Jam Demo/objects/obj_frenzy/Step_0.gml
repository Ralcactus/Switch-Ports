testvariablenothing = false;
var _nofocus = !window_has_focus();

if (global.debug)
    _nofocus = false;

if ((input_check_pressed("pause") || _nofocus) && !global.game_over)
    instance_create_layer(0, 0, layer, obj_pause_frenzy);

if (overlay_in)
{
    overlay_alpha = approach(overlay_alpha, 1, 0.08);
}
else
{
}

alpha = approach(alpha, 0, 0.05);
time += global.delta_game_factor;

if (audio_is_playing(bgm_map_speedup))
    bpm = 280;
else if (array_length(global.frenzy_music_list) > 0)
    bpm = 280 * global.speedup;

if (global.frenzy_music != -4)
{
    var _bgm = music_play;
    
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
            if (((beats - 1) % 2) == 1)
                event_music_beat_double();
            else
                event_music_beat();
        }
    }
}
else
{
    timer_logic(2);
}

if (global.beat && zoom_beat)
    zoom = 0.985;

timer_logic(0);
timer_logic(1);
timer_logic(3);
timer_logic(4);
timer_logic(5);
score_add_alpha = approach(score_add_alpha, 0, 0.05);
global.games_beat = game;
