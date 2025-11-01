testvariablenothing = false;
event_inherited();
var _trackpos = audio_sound_get_track_position(sound_play);

if (_trackpos < audio_last_pos)
{
    for (var i = 0; i < array_length(sound_effects); i++)
        sound_effects[i][2] = false;
}

audio_last_pos = _trackpos;
layer_sequence_headpos(my_seq, _trackpos * 60);

for (var i = 0; i < array_length(sound_effects); i++)
{
    var _playnow = (_trackpos * 60) >= sound_effects[i][0];
    
    if (_playnow && sound_effects[i][2] == false)
    {
        sound_effects[i][2] = true;
        audio_play_sound_on(emitter, sound_effects[i][1], false, 0);
    }
}
