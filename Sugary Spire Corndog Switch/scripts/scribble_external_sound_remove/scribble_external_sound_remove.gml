function scribble_external_sound_exists(arg0)
{
    __scribble_system();
    return ds_map_exists(global.__scribble_external_sound_map, arg0);
}
