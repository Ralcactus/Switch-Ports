function scr_unload_ag_map()
{
    var _list = [bgm_endless_lose];
    
    for (var i = 0; i < array_length(_list); i++)
    {
        if (audio_group_is_loaded(_list[i]))
            audio_group_unload(_list[i]);
    }
}
