audio_sound_gain(global.bgm_play, 0, 1500);
timer[0] = 90;

timer_func[0] = function()
{
    audio_stop_sound(global.bgm_play);
    
    if (array_contains(global.save_data.frenzies_beaten, "boss_knives"))
    {
        global.next_room = rm_replay_cutscene;
        global.room_cutscene = rm_boomtown_train;
        global.room_skip_cutscene = rm_boomtown_boss;
        room_goto(global.next_room);
    }
    else
    {
        global.next_room = rm_boomtown_train;
        room_goto_fade(rm_autosave);
    }
};
