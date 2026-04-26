function scribble_font_duplicate(arg0, arg1)
{
    var _old_font_data = ds_map_find_value(global.__scribble_font_data, arg0);
    
    if (!is_struct(_old_font_data))
        __scribble_error("Font \"", arg0, "\" not found");
    
    if (ds_map_exists(global.__scribble_font_data, arg1))
        __scribble_error("Font \"", arg1, "\" already exists");
    
    var _new_font_data = new __scribble_class_font(arg1, ds_grid_width(_old_font_data.__glyph_data_grid), _old_font_data.__msdf);
    _new_font_data.__runtime = true;
    _old_font_data.__copy_to(_new_font_data, true);
}
