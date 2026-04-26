function scribble_font_force_bilinear_filtering(arg0, arg1)
{
    if (!ds_map_exists(global.__scribble_font_data, arg0))
    {
        __scribble_error("Font \"", arg0, "\" not found");
        exit;
    }
    
    var _font_data = ds_map_find_value(global.__scribble_font_data, arg0);
    var _grid = _font_data.__glyph_data_grid;
    var _map = _font_data.__glyphs_map;
    ds_grid_set_region(_grid, 0, UnknownEnum.Value_17, ds_map_size(_map) - 1, UnknownEnum.Value_17, arg1);
}
