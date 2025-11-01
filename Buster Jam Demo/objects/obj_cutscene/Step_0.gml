if (myseq == -4 && keyboard_check_pressed(ord("1")))
{
    myseq = layer_sequence_create("Sequence", 960, 540, seq_test);
    layer_sequence_pause(myseq);
    myseq_audio = audio_play_sound(snd_cutscene_test, 0, 0);
}

if (myseq != -4)
{
    layer_sequence_headpos(myseq, audio_sound_get_track_position(myseq_audio) * 60);
    
    if (!audio_is_playing(myseq_audio))
    {
        layer_sequence_destroy(myseq);
        show_message("done");
        myseq = -4;
    }
}

if (audio_is_playing(myseq_audio))
{
    current_subtitle = "";
    var _pos = audio_sound_get_track_position(myseq_audio) * 60;
    
    for (var i = 0; i < array_length(subtitles); i++)
    {
        if (_pos >= subtitles[i][0] && _pos <= subtitles[i][1])
        {
            current_subtitle = subtitles[i][2];
            break;
        }
    }
    
    if (keyboard_check_pressed(vk_space))
    {
        var _paused = audio_is_paused(myseq_audio);
        
        if (!_paused)
            audio_pause_sound(myseq_audio);
        else
            audio_resume_sound(myseq_audio);
    }
}
