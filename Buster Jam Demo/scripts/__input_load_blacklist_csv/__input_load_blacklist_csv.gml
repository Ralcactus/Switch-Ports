function __input_load_blacklist_csv(arg0)
{
    static _global = __input_global();
    
    var _t = get_timer();
    __input_trace("Loading controller blacklist CSV from \"", arg0, "\"");
    var _buffer = buffer_load(arg0);
    var _string = buffer_read(_buffer, buffer_text);
    buffer_delete(_buffer);
    var _count = 0;
    var _row_array = __input_csv_to_array(_string);
    var _y = 0;
    
    repeat (array_length(_row_array))
    {
        var _column_array = _row_array[_y];
        
        if (array_length(_column_array) > 2)
        {
            var _os = _column_array[0];
            var _filter_type = _column_array[1];
            var _os_struct = variable_struct_get(_global.__blacklist_dictionary, _os);
            
            if (!is_struct(_os_struct))
            {
                _os_struct = {};
                variable_struct_set(_global.__blacklist_dictionary, _os, _os_struct);
            }
            
            if (_filter_type == "description contains")
            {
                var _filter_array = variable_struct_get(_os_struct, _filter_type);
                
                if (!is_struct(_filter_array))
                {
                    _filter_array = [];
                    variable_struct_set(_os_struct, _filter_type, _filter_array);
                }
                
                var _x = 2;
                
                repeat (array_length(_column_array) - 2)
                {
                    array_push(_filter_array, _column_array[_x]);
                    _count++;
                    _x++;
                }
            }
            else
            {
                var _filter_struct = variable_struct_get(_os_struct, _filter_type);
                
                if (!is_struct(_filter_struct))
                {
                    _filter_struct = {};
                    variable_struct_set(_os_struct, _filter_type, _filter_struct);
                }
                
                var _x = 2;
                
                repeat (array_length(_column_array) - 2)
                {
                    variable_struct_set(_filter_struct, array_get(_column_array, _x), true);
                    _count++;
                    _x++;
                }
            }
        }
        
        _y++;
    }
    
    __input_trace(_count, " controller blacklist definitions found");
    __input_trace("Loaded in ", (get_timer() - _t) / 1000, "ms");
    return true;
}
