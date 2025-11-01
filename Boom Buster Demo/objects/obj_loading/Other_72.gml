if (ds_map_find_value(async_load, "type") == "audiogroup_load")
{
    for (var i = 0; i < array_length(audio_groups_load); i++)
    {
        if (ds_map_find_value(async_load, "group_id") == audio_groups_load[i])
            assets_done++;
    }
}
