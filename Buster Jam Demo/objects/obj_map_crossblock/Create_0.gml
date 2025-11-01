event_inherited();
anim_play(spr_map_crossblock);
anim_speed = 0;
anim_index = 0;
time_cross = 0;
timer[1] = -1;

timer_func[1] = function()
{
    var _snd = audio_play_sound(snd_crosswalk_beep, 0, 0);
    
    if (time_cross == 1)
        audio_sound_pitch(_snd, 1.2);
    
    time_cross--;
    
    if (time_cross > 0)
    {
        timer[1] = 60;
    }
    else
    {
        with (obj_enemy_crossing)
            crosswalk_stop = false;
        
        with (obj_enemy_crossing_spawner)
            crosswalk_stop = false;
        
        with (obj_map_crossblock)
            anim_index = 0;
    }
    
    with (obj_map_crossblock)
        time_cross = other.time_cross;
};
