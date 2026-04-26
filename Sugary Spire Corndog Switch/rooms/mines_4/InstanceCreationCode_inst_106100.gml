flags.do_once_per_save = true;

condition = function()
{
    return ds_list_find_index(global.SaveRoom, 106034) != -1 && global.minesProgress == false;
};

output = function()
{
    global.minesProgress = true;
    obj_music.contTrack_pos = 0;
    
    with (obj_music)
    {
        if (music != -4)
            fmod_event_setParameter(music.music_inst, "state", 1, 1);
    }
};
