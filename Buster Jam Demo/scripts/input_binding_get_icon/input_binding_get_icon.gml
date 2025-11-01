function input_binding_get_icon(arg0, arg1 = 0)
{
    static _global = __input_global();
    static _fallback_icon_struct = undefined;
    static _fallback_category_name = "xbox one";
    
    if (arg1 < 0)
    {
        __input_error("Invalid player index provided (", arg1, ")");
        return undefined;
    }
    
    if (arg1 >= 2)
    {
        __input_error("Player index too large (", arg1, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (_fallback_icon_struct == undefined)
    {
        switch (0)
        {
            case 16:
                _fallback_category_name = "psx";
                break;
            
            case 14:
                _fallback_category_name = "ps4";
                break;
            
            case 22:
                _fallback_category_name = "ps5";
                break;
            
            case 21:
                _fallback_category_name = "switch";
                break;
            
            case 15:
                _fallback_category_name = "xbox one";
                break;
            
            case 23:
                _fallback_category_name = "xbox one";
                break;
            
            default:
                _fallback_category_name = "xbox one";
                break;
        }
        
        var _fallback_category_data = variable_struct_get(_global.__icons, _fallback_category_name);
        
        if (is_struct(_fallback_category_data))
        {
            _fallback_icon_struct = _fallback_category_data.__dictionary;
        }
        else
        {
            __input_trace("Warning! \"", _fallback_category_name, "\" icon data not found");
            _fallback_icon_struct = {};
        }
    }
    
    if (!input_value_is_binding(arg0))
    {
        _category_data = variable_struct_get(_global.__icons, "not a binding");
        
        if (!is_struct(_category_data))
            return "not a binding";
        
        _icon = variable_struct_get(_category_data.__dictionary, "-3");
        return _icon ?? "not a binding";
    }
    
    var _type = arg0.__type;
    var _label = arg0.__label;
    
    if (_type == undefined || _label == undefined)
    {
        _category_data = struct_get_from_hash(_global.__icons, variable_get_hash("empty"));
        
        if (!is_struct(_category_data))
            return "empty";
        
        _icon = variable_struct_get(_category_data.__dictionary, "-3");
        return _icon ?? "empty";
    }
    
    if (_type == "virtual button")
    {
        _category_data = variable_struct_get(_global.__icons, "virtual button");
        
        if (!is_struct(_category_data))
            return "virtual button";
        
        _icon = variable_struct_get(_category_data.__dictionary, "-3");
        return _icon ?? "virtual button";
    }
    
    var _category;
    
    switch (_type)
    {
        case "key":
        case "mouse button":
        case "mouse wheel up":
        case "mouse wheel down":
            _category = "keyboard and mouse";
            break;
        
        case "gamepad button":
        case "gamepad axis":
            _category = _global.__players[arg1].__gamepad_type_override ?? input_player_get_gamepad_type(arg1, arg0);
            break;
        
        default:
            __input_error("\"", _type, "\" unsupported");
            break;
    }
    
    var _category_data = variable_struct_get(_global.__icons, _category);
    var _icon_struct = is_struct(_category_data) ? _category_data.__dictionary : _fallback_icon_struct;
    var _icon = is_struct(_icon_struct) ? variable_struct_get(_icon_struct, _label) : undefined;
    
    if (_category == "keyboard and mouse")
        return _icon ?? _label;
    
    if (_icon == undefined)
    {
        _icon = variable_struct_get(_fallback_icon_struct, _label);
        
        if (_icon == undefined)
        {
            __input_trace("Warning! Could not find valid icon for \"", _label, "\" using \"", _fallback_category_name, "\"");
            _icon = _label;
        }
    }
    
    return _icon;
}
