function scribble_external_sound_add(arg0, arg1)
{
    __scribble_system();
    
    if (ds_map_exists(global.__scribble_external_sound_map, arg1))
        __scribble_error("External sound alias \"", arg1, "\" already exists");
    
    if (!audio_exists(arg0))
        __scribble_error("Audio asset ", arg0, " could not be found");
    
    ds_map_set(global.__scribble_external_sound_map, arg1, arg0);
}
