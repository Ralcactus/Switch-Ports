function scribble_font_set_default(arg0)
{
    __scribble_system();
    
    if (!is_string(arg0))
    {
        __scribble_error("The default font should be defined using its name as a string.\n(Input was an invalid datatype)");
        return undefined;
    }
    
    if (false && global.__scribble_default_font == undefined)
        __scribble_trace("Setting default font to \"" + string(arg0) + "\"");
    
    global.__scribble_default_font = arg0;
}
