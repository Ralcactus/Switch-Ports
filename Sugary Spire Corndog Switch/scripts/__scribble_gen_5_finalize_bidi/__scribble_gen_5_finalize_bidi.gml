function __scribble_gen_5_finalize_bidi()
{
    if (!__has_r2l)
        exit;
    
    var _word_grid = global.__scribble_word_grid;
    var _word_count = global.__scribble_generator_state.__word_count;
    var _overall_bidi = global.__scribble_generator_state.__overall_bidi;
    var _i = 0;
    
    repeat (_word_count)
    {
        var _bidi = ds_grid_get(_word_grid, _i, UnknownEnum.Value_0);
        
        if (_bidi <= UnknownEnum.Value_1)
        {
            var _prev_bidi = (_i > 0) ? ds_grid_get(_word_grid, _i - 1, UnknownEnum.Value_1) : UnknownEnum.Value_1;
            var _next_bidi = (_i < (_word_count - 1)) ? ds_grid_get(_word_grid, _i + 1, UnknownEnum.Value_1) : UnknownEnum.Value_1;
            
            if (_prev_bidi <= UnknownEnum.Value_1)
                _prev_bidi = _next_bidi;
            
            if (_next_bidi <= UnknownEnum.Value_1)
                _next_bidi = _prev_bidi;
            
            var _new_bidi = (_prev_bidi == _overall_bidi || _next_bidi == _overall_bidi) ? _overall_bidi : _prev_bidi;
            
            if (_new_bidi <= UnknownEnum.Value_1)
                _new_bidi = UnknownEnum.Value_4;
            
            ds_grid_set(_word_grid, _i, UnknownEnum.Value_1, _new_bidi);
            _bidi = _new_bidi;
        }
        
        _i++;
    }
}
