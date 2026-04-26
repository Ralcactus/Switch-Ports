function scribble_font_rename(arg0, arg1)
{
    if (!ds_map_exists(global.__scribble_font_data, arg0))
    {
        __scribble_error("Font \"", arg0, "\" doesn't exist");
        exit;
    }
    
    if (ds_map_exists(global.__scribble_font_data, arg1))
    {
        __scribble_error("Font \"", arg1, "\" already exists");
        exit;
    }
    
    var _data = ds_map_find_value(global.__scribble_font_data, arg0);
    ds_map_set(global.__scribble_font_data, arg1, _data);
    ds_map_delete(global.__scribble_font_data, arg0);
    
    if (global.__scribble_default_font == arg0)
        global.__scribble_default_font = arg1;
}
