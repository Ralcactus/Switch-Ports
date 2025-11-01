switch (state)
{
    case 1:
    case 2:
    case 3:
        timer[2] = time_bpm_to_seconds(140) * 60;
        time = 3;
        break;
    
    case 4:
        started = true;
        audio_stop_sound(music_play);
        music_play = audio_play_sound(global.frenzy_music, 0, true);
        time = 0;
        made_game = false;
        break;
}
