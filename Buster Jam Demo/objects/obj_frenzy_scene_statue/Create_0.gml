global.frenzy_nextroom = rm_boomtown_wall;
global.spawnID = 2;
global.frenzy_name = "boomtown_map_statue";
state_beat = -1;

event_music_beat = function()
{
    switch (state_beat)
    {
        case 0:
            if (!obj_map_frenzy_controller.started)
                break;
            
            if (obj_map_frenzy_controller.win)
            {
                with (obj_frenzy_player)
                    event_throw_bom();
            }
            else
            {
                with (obj_frenzy_player)
                    event_lose();
            }
            
            break;
        
        case 3:
            if (global.game_over)
                break;
            
            if (!obj_map_frenzy_controller.win)
            {
                with (obj_frenzy_player)
                    anim_play(anim_spin);
                
                var _snd = audio_play_sound(snd_spin, 0, false);
                audio_sound_pitch(_snd, global.speedup);
            }
            
            break;
        
        case 4:
            if (global.game_over)
                break;
            
            with (obj_frenzy_player)
                event_create_bom();
            
            break;
    }
};

event_speedup_next = function()
{
    if (room != rm_endless)
    {
        with (obj_boomtown_wizardstatue)
            hurt_next_time = true;
    }
};
