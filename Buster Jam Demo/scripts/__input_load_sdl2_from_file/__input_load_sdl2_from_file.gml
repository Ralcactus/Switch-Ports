function __input_load_sdl2_from_file(arg0)
{
    static _global = __input_global();
    
    __input_trace("Loading SDL2 database from \"", arg0, "\"");
    var _buffer = buffer_load(arg0);
    
    if (_buffer < 0)
    {
        show_message("Could not load external SDL2 database \"" + string(arg0) + "\"");
        return false;
    }
    
    if (buffer_get_size(_buffer) >= 4 && (buffer_peek(_buffer, 0, buffer_u32) & 16777215) == 12565487)
        buffer_seek(_buffer, buffer_seek_start, 3);
    
    var _string = buffer_read(_buffer, buffer_text);
    buffer_delete(_buffer);
    return __input_load_sdl2_from_string_internal(_string);
}
