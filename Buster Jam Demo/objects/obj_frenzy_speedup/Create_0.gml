x = -1920;
y = 0;
percent_move = 0;
percent_squish = 1;
in = true;
xscale = 1;
yscale = 1;

event_out = function()
{
    percent_move = 0;
    in = false;
    
    if (sprite_index == spr_frenzy_speedup)
    {
        global.speedup += global.speedup_value;
        
        if (global.speedup > 2)
            global.speedup = 2;
        
        with (obj_frenzy)
        {
            if (audio_is_playing(music_play) && array_length(global.frenzy_music_list) == 0)
                audio_sound_pitch(music_play, global.speedup);
        }
    }
};
