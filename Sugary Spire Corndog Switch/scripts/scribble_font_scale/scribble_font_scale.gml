function scribble_font_scale(arg0, arg1)
{
    if (!ds_map_exists(global.__scribble_font_data, arg0))
    {
        __scribble_error("Font \"", arg0, "\" not found");
        exit;
    }
    
    var _font_data = ds_map_find_value(global.__scribble_font_data, arg0);
    var _grid = _font_data.__glyph_data_grid;
    _font_data.__scale *= arg1;
    ds_grid_multiply_region(_grid, 0, UnknownEnum.Value_3, ds_grid_width(_grid), UnknownEnum.Value_10, arg1);
    _font_data.__calculate_font_height();
}
