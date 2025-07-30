function __input_class_binding() constructor
{
    static __global = __input_global();
    
    static __set_empty = function()
    {
        __type = undefined;
        __value = undefined;
        __axis_negative = undefined;
        __label = "empty binding";
        __gamepad_index = undefined;
        __gamepad_description = undefined;
        __android_lowercase = undefined;
        __threshold_min = undefined;
        __threshold_max = undefined;
        return self;
    };
    
    static toString = function()
    {
        var _string = __label;
        
        if (__gamepad_index != undefined)
        {
            if (__gamepad_description != undefined)
                _string += (", gamepad=" + _string(__gamepad_index) + " \"" + __gamepad_description + "\"");
            else
                _string += (", gamepad=" + _string(__gamepad_index));
        }
        else if (__gamepad_description != undefined)
        {
            _string += (", gamepad=\"" + __gamepad_description + "\"");
        }
        
        if (__threshold_min != undefined || __threshold_max != undefined)
            _string += (", threshold=" + __threshold_min + "->" + _string(__threshold_max));
        
        return _string;
    };
    
    static __source_type_get = function()
    {
        switch (__type)
        {
            case "key":
                return __input_global().__source_keyboard;
                break;
            
            case "mouse button":
                return __input_global().__source_mouse;
                break;
            
            case "mouse wheel up":
                return __input_global().__source_mouse;
                break;
            
            case "mouse wheel down":
                return __input_global().__source_mouse;
                break;
            
            case "virtual button":
                return __input_global().__source_touch;
                break;
            
            case "gamepad button":
                return __input_global().__source_gamepad;
                break;
            
            case "gamepad axis":
                return __input_global().__source_gamepad;
                break;
            
            case undefined:
                __input_trace("Warning! Binding type has not been defined");
                return undefined;
                break;
            
            default:
                __input_error("Unhandled binding type \"", __type, "\"");
                break;
        }
    };
    
    static __gamepad_set = function(argument0)
    {
        if (input_gamepad_is_connected(argument0))
        {
            __gamepad_index = argument0;
            __gamepad_description = gamepad_get_description(argument0);
        }
        
        return self;
    };
    
    static __gamepad_get = function()
    {
        return __gamepad_index;
    };
    
    static __threshold_set = function(argument0, argument1)
    {
        __threshold_min = argument0;
        __threshold_max = argument1;
        return self;
    };
    
    static __threshold_get = function()
    {
        return 
        {
            mini: __threshold_min,
            maxi: __threshold_max
        };
    };
    
    static __export = function()
    {
        var _binding_shell = {};
        
        if (__type != undefined)
            _binding_shell.__type = __type;
        
        if (__value != undefined)
            _binding_shell.__value = __value;
        
        if (__axis_negative != undefined)
            _binding_shell.__axis_negative = __axis_negative;
        
        if (__gamepad_description != undefined)
            _binding_shell.__gamepad_description = __gamepad_description;
        
        if (__threshold_min != undefined)
            _binding_shell.__threshold_min = __threshold_min;
        
        if (__threshold_max != undefined)
            _binding_shell.__threshold_max = __threshold_max;
        
        return _binding_shell;
    };
    
    static __import = function(argument0)
    {
        var _type_var = variable_struct_exists(argument0, "type") ? "type" : "__type";
        var _value_var = variable_struct_exists(argument0, "value") ? "value" : "__value";
        var _axis_negative_var = variable_struct_exists(argument0, "axis_negative") ? "axis_negative" : "__axis_negative";
        var _gamepad_description_var = variable_struct_exists(argument0, "gamepad_description") ? "gamepad_description" : "__gamepad_description";
        var _threshold_min_var = variable_struct_exists(argument0, "threshold_min") ? "threshold_min" : "__threshold_min";
        var _threshold_max_var = variable_struct_exists(argument0, "threshold_max") ? "threshold_max" : "__threshold_max";
        
        if (!is_struct(argument0))
        {
            __input_trace("Warning! Could not import binding, clearing this binding (typeof=", typeof(argument0), ")");
            argument0 = {};
        }
        
        if (variable_struct_names_count(argument0) <= 0)
        {
            __set_empty();
            exit;
        }
        
        if (!variable_struct_exists(argument0, _type_var))
        {
            __input_error("Binding \"type\" not found; binding is corrupted");
            exit;
        }
        
        var _type = variable_struct_get(argument0, _type_var);
        
        if (!variable_struct_exists(argument0, _value_var) && _type != "mouse wheel up" && _type != "mouse wheel down" && _type != "virtual button")
        {
            __input_error("Binding \"value\" not found; binding is corrupted");
            exit;
        }
        
        if (_type == "gamepad axis" && !variable_struct_exists(argument0, _axis_negative_var))
        {
            __input_error("Binding \"axis_negative\" not found; binding is corrupted");
            exit;
        }
        
        var _value = variable_struct_get(argument0, _value_var);
        
        if (_type == "gamepad axis" || _type == "gamepad button")
        {
            switch (_value)
            {
                case 32789:
                case 32889:
                    _value = __input_global().__gp_guide;
                    __input_trace("Warning! Legacy gamepad constant found, updating value (= ", _value, ")");
                    break;
                
                case 32790:
                case 32890:
                    _value = __input_global().__gp_misc1;
                    __input_trace("Warning! Legacy gamepad constant found, updating value (= ", _value, ")");
                    break;
                
                case 32791:
                case 32891:
                    _value = __input_global().__gp_touchpad;
                    __input_trace("Warning! Legacy gamepad constant found, updating value (= ", _value, ")");
                    break;
                
                case 32792:
                case 32892:
                    _value = __input_global().__gp_paddle1;
                    __input_trace("Warning! Legacy gamepad constant found, updating value (= ", _value, ")");
                    break;
                
                case 32793:
                case 32893:
                    _value = __input_global().__gp_paddle2;
                    __input_trace("Warning! Legacy gamepad constant found, updating value (= ", _value, ")");
                    break;
                
                case 32794:
                case 32894:
                    _value = __input_global().__gp_paddle3;
                    __input_trace("Warning! Legacy gamepad constant found, updating value (= ", _value, ")");
                    break;
                
                case 32795:
                case 32895:
                    _value = __input_global().__gp_paddle4;
                    __input_trace("Warning! Legacy gamepad constant found, updating value (= ", _value, ")");
                    break;
            }
        }
        
        __type = _type;
        __value = _value;
        __axis_negative = variable_struct_get(argument0, _axis_negative_var);
        __gamepad_description = variable_struct_get(argument0, _gamepad_description_var);
        __threshold_min = variable_struct_get(argument0, _threshold_min_var);
        __threshold_max = variable_struct_get(argument0, _threshold_max_var);
        
        if (__gamepad_description != undefined)
        {
            var _g = 0;
            
            repeat (array_length(__global.__gamepads))
            {
                var _gamepad = __global.__gamepads[_g];
                
                if (is_struct(_gamepad) && _gamepad.description == __gamepad_description)
                {
                    __gamepad_index = _g;
                    break;
                }
                
                _g++;
            }
        }
        
        __set_android_lowercase();
        __set_label();
    };
    
    static __set_android_lowercase = function()
    {
        if (os_type == os_android && __type == "key")
        {
            __value = ord(string_upper(chr(__value)));
            var _android_lowercase = ord(string_lower(chr(__value)));
            __android_lowercase = (_android_lowercase != __value) ? _android_lowercase : undefined;
            
            if (__value == 10 || __value == 13)
            {
                __value = 10;
                __android_lowercase = 13;
            }
        }
    };
    
    static __duplicate = function()
    {
        with (new __input_class_binding())
        {
            __type = other.__type;
            __value = other.__value;
            __axis_negative = other.__axis_negative;
            __label = other.__label;
            __gamepad_index = other.__gamepad_index;
            __gamepad_description = other.__gamepad_description;
            __android_lowercase = other.__android_lowercase;
            __threshold_min = other.__threshold_min;
            __threshold_max = other.__threshold_max;
            return self;
        }
    };
    
    static __set_key = function(argument0, argument1)
    {
        if (is_string(argument0))
            argument0 = ord(string_upper(argument0));
        
        if (argument1)
        {
        }
        else
        {
            if (os_type == os_switch || os_type == os_linux || os_type == os_macosx)
            {
                if (argument0 == 122)
                    argument0 = 128;
                else if (argument0 == 123)
                    argument0 = 129;
            }
            
            if (!(__input_global().__on_desktop || (false || os_type == os_gxgames) || os_type == os_switch))
            {
                if (argument0 == 188)
                    argument0 = 44;
                else if (argument0 == (((os_type == os_macosx || os_type == os_switch) && !(false || os_type == os_gxgames)) ? 109 : 189))
                    argument0 = 45;
                else if (argument0 == ((os_type == os_switch) ? 110 : 190))
                    argument0 = 46;
                else if (argument0 == 191)
                    argument0 = 47;
                else if (argument0 == 186)
                    argument0 = 59;
                else if (argument0 == ((os_type == os_macosx && !(false || os_type == os_gxgames)) ? 24 : 187))
                    argument0 = 61;
                else if (argument0 == 219)
                    argument0 = 91;
                else if (argument0 == 220)
                    argument0 = 92;
                else if (argument0 == 221)
                    argument0 = 93;
                else if (argument0 == (!(os_type == os_macosx) ? ((os_type == os_linux) ? 223 : 192) : 50))
                    argument0 = 96;
            }
        }
        
        __type = "key";
        __value = argument0;
        __set_android_lowercase();
        __set_label();
        return self;
    };
    
    static __set_gamepad_axis = function(argument0, argument1)
    {
        __type = "gamepad axis";
        __value = argument0;
        __axis_negative = argument1;
        __set_label();
        return self;
    };
    
    static __set_gamepad_button = function(argument0)
    {
        __type = "gamepad button";
        __value = argument0;
        __set_label();
        return self;
    };
    
    static __set_mouse_button = function(argument0)
    {
        if (argument0 == 0)
            __input_error("Cannot use mb_none as a mouse button binding\nInstead please use mb_any and then invert the result");
        
        __type = "mouse button";
        __value = argument0;
        __set_label();
        return self;
    };
    
    static __set_mouse_wheel_down = function()
    {
        __type = "mouse wheel down";
        __set_label();
        return self;
    };
    
    static __set_mouse_wheel_up = function()
    {
        __type = "mouse wheel up";
        __set_label();
        return self;
    };
    
    static __set_virtual_button = function()
    {
        __type = "virtual button";
        __set_label();
        return self;
    };
    
    static __set_label = function(argument0)
    {
        if (argument0 == undefined)
            __label = __input_binding_get_label(__type, __value, __axis_negative);
        else
            __label = argument0;
        
        return self;
    };
    
    static __get_source_type = function()
    {
        switch (__type)
        {
            case "key":
                return (0 << 0);
                break;
            
            case "mouse button":
                return (1 << 0);
                break;
            
            case "mouse wheel up":
                return (1 << 0);
                break;
            
            case "mouse wheel down":
                return (1 << 0);
                break;
            
            case "virtual button":
                return (3 << 0);
                break;
            
            case "gamepad button":
                return (2 << 0);
                break;
            
            case "gamepad axis":
                return (2 << 0);
                break;
            
            case undefined:
                return undefined;
                break;
        }
        
        __input_error("Binding type \"", __type, "\" not recognised");
    };
    
    __set_empty();
}
