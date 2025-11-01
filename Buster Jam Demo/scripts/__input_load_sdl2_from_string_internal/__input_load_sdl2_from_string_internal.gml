function __input_load_sdl2_from_string_internal(arg0)
{
    static _global = __input_global();
    
    var _t = get_timer();
    __input_trace("Unpacking SDL2 string...");
    var _lines = string_split(arg0, "\n", true);
    var _total_count = 0;
    var _platform_count = 0;
    var _db_by_guid = _global.__sdl2_database.by_guid;
    var _db_by_vendor_product = _global.__sdl2_database.by_vendor_product;
    var _db_by_description = _global.__sdl2_database.by_description;
    var _i = 0;
    
    repeat (array_length(_lines))
    {
        var _line = string_trim(_lines[_i]);
        _i++;
        
        if (string_length(_line) == 0)
            continue;
        
        if (string_byte_at(_line, 0) == 35)
            continue;
        
        _total_count++;
        var _row_array = string_split(_line, ",", true);
        var _guid = _row_array[0];
        var _result = __input_gamepad_guid_parse(_guid, false, true);
        var _vendor_product = _result.vendor + _result.product;
        var _description = _result.description;
        var _platform = undefined;
        var _x = array_length(_row_array) - 1;
        
        repeat (array_length(_row_array))
        {
            var _platform_string = _row_array[_x];
            
            if (_platform_string == "platform:Windows")
            {
                _platform = 0;
                break;
            }
            
            if (_platform_string == "platform:Linux")
            {
                _platform = 6;
                break;
            }
            
            if (_platform_string == "platform:Android")
            {
                _platform = 4;
                break;
            }
            
            if (_platform_string == "platform:Mac OS X")
            {
                _platform = 1;
                break;
            }
            
            if (_platform_string == "platform:iOS")
            {
                _platform = 3;
                break;
            }
            
            if (_platform_string == "platform:MacOS")
            {
                _platform = 1;
                break;
            }
            
            if (_platform_string == "platform:Mac")
            {
                _platform = 1;
                break;
            }
            
            _x--;
        }
        
        if (_platform == undefined)
            __input_trace("Warning! Platform not found for ", _row_array);
        
        if (_platform == undefined || _platform == 0)
        {
            _platform_count++;
            
            if (_description != "")
            {
                var _description_array = variable_struct_get(_db_by_description, _description);
                
                if (is_array(_description_array))
                    _description_array[array_length(_description_array)] = _row_array;
                else
                    variable_struct_set(_db_by_description, _description, [_row_array]);
            }
            else if (_vendor_product != "")
            {
                var _vp_array = variable_struct_get(_db_by_vendor_product, _vendor_product);
                
                if (is_array(_vp_array))
                    _vp_array[array_length(_vp_array)] = _row_array;
                else
                    variable_struct_set(_db_by_vendor_product, _vendor_product, [_row_array]);
            }
            
            if (variable_struct_exists(_db_by_guid, _guid))
                __input_trace("Warning! Overwriting GUID \"", _guid, "\" with ", _row_array, " (old=", variable_struct_get(_db_by_guid, _guid), ")");
            
            variable_struct_set(_db_by_guid, _guid, _row_array);
        }
    }
    
    __input_trace(_total_count, " controller definitions found, of which ", _platform_count, " are active for this platform");
    __input_trace("Loaded in ", (get_timer() - _t) / 1000, "ms");
    return true;
}
