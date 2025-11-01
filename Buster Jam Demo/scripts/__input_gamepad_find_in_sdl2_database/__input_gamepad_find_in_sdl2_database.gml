function __input_gamepad_find_in_sdl2_database()
{
    static _global = __input_global();
    
    if (!(1 && (__input_global().__on_desktop || false)) || 0 || __blacklisted || __xinput)
        exit;
    
    var _guid_dict = _global.__sdl2_database.by_guid;
    
    if (variable_struct_exists(_guid_dict, __guid))
    {
        _definition = variable_struct_get(_guid_dict, __guid);
        __sdl2_definition = _definition;
        __description = _definition[1];
        exit;
    }
    
    var _definition = undefined;
    var _description_array = variable_struct_get(_global.__sdl2_database.by_description, string_copy(__guid, 1, 20));
    
    if (is_array(_description_array))
    {
        if (array_length(_description_array) > 0)
            _definition = _description_array[0];
    }
    else
    {
        var _vp_array = variable_struct_get(_global.__sdl2_database.by_vendor_product, __vendor + __product);
        
        if (is_array(_vp_array))
        {
            if (array_length(_vp_array) > 0)
                _definition = _vp_array[0];
        }
    }
    
    if (is_array(_definition))
    {
        __sdl2_definition = _definition;
        __description = _definition[1];
    }
    else
    {
        __input_trace("Warning! No SDL definition found for ", __guid, " (vendor=", __vendor, ", product=", __product, ")");
        __sdl2_definition = undefined;
    }
}
