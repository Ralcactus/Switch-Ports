function scribble_font_set_style_family(arg0, arg1, arg2, arg3)
{
    var _font_names = array_create(4, undefined);
    _font_names[0] = is_string(arg0) ? arg0 : undefined;
    _font_names[1] = is_string(arg1) ? arg1 : undefined;
    _font_names[2] = is_string(arg2) ? arg2 : undefined;
    _font_names[3] = is_string(arg3) ? arg3 : undefined;
    var _i = 0;
    
    repeat (4)
    {
        var _struct = ds_map_find_value(global.__scribble_font_data, array_get(_font_names, _i));
        
        if (is_struct(_struct))
        {
            with (_struct)
            {
                __style_regular = _font_names[0];
                __style_bold = _font_names[1];
                __style_italic = _font_names[2];
                __style_bold_italic = _font_names[3];
            }
        }
        
        _i++;
    }
}
