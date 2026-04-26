function scribble_external_sound_remove(arg0)
{
    __scribble_system();
    ds_map_delete(global.__scribble_external_sound_map, arg0);
}
