function scribble_font_delete(arg0)
{
    if (!ds_map_exists(global.__scribble_font_data, arg0))
        exit;
    
    ds_map_find_value(global.__scribble_font_data, arg0).__destroy();
    ds_map_delete(global.__scribble_font_data, arg0);
}
