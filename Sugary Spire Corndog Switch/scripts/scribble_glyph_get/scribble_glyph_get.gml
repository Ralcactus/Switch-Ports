function scribble_glyph_get(arg0, arg1, arg2)
{
    var _font_data = ds_map_find_value(global.__scribble_font_data, arg0);
    var _grid = _font_data.__glyph_data_grid;
    var _map = _font_data.__glyphs_map;
    var _unicode = is_real(arg1) ? arg1 : ord(arg1);
    var _glyph_index = ds_map_find_value(_map, _unicode);
    
    if (_glyph_index == undefined)
    {
        __scribble_error("Character \"", arg1, "\" not found for font \"", arg0, "\"");
        return undefined;
    }
    
    return ds_grid_get(_grid, _glyph_index, arg2);
}
