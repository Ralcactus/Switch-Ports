function __input_load_sdl2_from_string(arg0)
{
    static _global = __input_global();
    
    __input_trace("Loading SDL2 database from string \"", arg0, "\"");
    return __input_load_sdl2_from_string_internal(arg0);
}
