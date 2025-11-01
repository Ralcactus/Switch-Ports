function scr_unload_ag_boss()
{
    var _list = [bgm_endless_jingleB, bgm_endless_jingleA];
    
    for (var i = 0; i < array_length(_list); i++)
    {
        if (audio_group_is_loaded(_list[i]))
            audio_group_unload(_list[i]);
    }
}
