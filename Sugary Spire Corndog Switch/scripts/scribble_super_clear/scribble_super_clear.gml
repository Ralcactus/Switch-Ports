function scribble_super_clear(arg0)
{
    var _font_data = ds_map_find_value(global.__scribble_font_data, arg0);
    
    if (_font_data == undefined)
        __scribble_error("Font \"", arg0, "\" not found");
    
    _font_data.__clear();
}
