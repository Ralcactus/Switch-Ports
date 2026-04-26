function __scribble_gen_7_build_pages()
{
    var _glyph_grid = global.__scribble_glyph_grid;
    var _word_grid = global.__scribble_word_grid;
    var _line_grid = global.__scribble_line_grid;
    var _wrap_no_pages, _model_max_height, _line_count, _line_spacing_add, _line_spacing_multiply;
    
    with (global.__scribble_generator_state)
    {
        var _element = __element;
        _model_max_height = __model_max_height;
        _line_count = __line_count;
        _wrap_no_pages = _element.__wrap_no_pages;
        _line_spacing_add = __line_spacing_add;
        _line_spacing_multiply = __line_spacing_multiply;
    }
    
    var _simulated_model_height = _wrap_no_pages ? infinity : (_model_max_height / __fit_scale);
    var _model_height = 0;
    var _page_data = __new_page();
    _page_data.__line_start = 0;
    _page_data.__glyph_start = ds_grid_get(_word_grid, ds_grid_get(_line_grid, 0, UnknownEnum.Value_1), UnknownEnum.Value_2);
    var _page_start_line = 0;
    var _line_y = 0;
    var _i = 0;
    
    repeat (_line_count)
    {
        var _line_height = ds_grid_get(_line_grid, _i, UnknownEnum.Value_4);
        var _starts_manual_page = ds_grid_get(_line_grid, _i, UnknownEnum.Value_6);
        
        if (!_starts_manual_page && ((_line_y + _line_height) < _simulated_model_height || _page_start_line >= _i))
        {
            ds_grid_set(_line_grid, _i, UnknownEnum.Value_0, _line_y);
            
            if ((_line_y + _line_height) > _model_height)
                _model_height = _line_y + _line_height;
            
            _line_y += (_line_spacing_add + (_line_height * _line_spacing_multiply));
        }
        else
        {
            _page_end_line = _i - 1;
            _page_data.__line_end = _page_end_line;
            _page_data.__line_count = (1 + _page_data.__line_end) - _page_data.__line_start;
            _page_data.__glyph_end = ds_grid_get(_word_grid, ds_grid_get(_line_grid, _page_end_line, UnknownEnum.Value_2), UnknownEnum.Value_3);
            _page_data.__glyph_count = (1 + _page_data.__glyph_end) - _page_data.__glyph_start;
            _page_data.__width = ds_grid_get_max(_line_grid, _page_start_line, UnknownEnum.Value_3, _page_end_line, UnknownEnum.Value_3);
            _page_data.__height = _line_y;
            _page_data.__min_y = (__valign == 1) ? -(_line_y div 2) : ((__valign == 2) ? -_line_y : 0);
            _page_data.__max_y = (__valign == 1) ? (_line_y div 2) : ((__valign == 2) ? 0 : _line_y);
            _page_anim_start = ds_grid_get(_glyph_grid, _page_data.__glyph_start, UnknownEnum.Value_18);
            ds_grid_add_region(_glyph_grid, _page_data.__glyph_start, UnknownEnum.Value_18, _page_data.__glyph_end, UnknownEnum.Value_18, -_page_anim_start);
            _page_data.__character_count = 1 + ds_grid_get(_glyph_grid, _page_data.__glyph_end, UnknownEnum.Value_18);
            _page_data = __new_page();
            _page_data.__line_start = _i;
            _page_data.__glyph_start = ds_grid_get(_word_grid, ds_grid_get(_line_grid, _i, UnknownEnum.Value_1), UnknownEnum.Value_2);
            _page_start_line = _i;
            ds_grid_set(_line_grid, _i, UnknownEnum.Value_0, 0);
            
            if ((_line_y + _line_height) > _model_height)
                _model_height = _line_y + _line_height;
            
            _line_y = _line_spacing_add + (_line_height * _line_spacing_multiply);
        }
        
        _i++;
    }
    
    var _page_end_line = _i - 1;
    _page_data.__line_end = _page_end_line;
    _page_data.__line_count = (1 + _page_data.__line_end) - _page_data.__line_start;
    _page_data.__glyph_end = ds_grid_get(_word_grid, ds_grid_get(_line_grid, _page_end_line, UnknownEnum.Value_2), UnknownEnum.Value_3);
    _page_data.__glyph_count = (1 + _page_data.__glyph_end) - _page_data.__glyph_start;
    _page_data.__width = ds_grid_get_max(_line_grid, _page_start_line, UnknownEnum.Value_3, _page_end_line, UnknownEnum.Value_3);
    _page_data.__height = _line_y;
    _page_data.__min_y = (__valign == 1) ? -(_line_y div 2) : ((__valign == 2) ? -_line_y : 0);
    _page_data.__max_y = (__valign == 1) ? (_line_y div 2) : ((__valign == 2) ? 0 : _line_y);
    var _page_anim_start = ds_grid_get(_glyph_grid, _page_data.__glyph_start, UnknownEnum.Value_18);
    ds_grid_add_region(_glyph_grid, _page_data.__glyph_start, UnknownEnum.Value_18, _page_data.__glyph_end, UnknownEnum.Value_18, -_page_anim_start);
    _page_data.__character_count = 1 + ds_grid_get(_glyph_grid, _page_data.__glyph_end, UnknownEnum.Value_18);
    __height = _model_height;
}
