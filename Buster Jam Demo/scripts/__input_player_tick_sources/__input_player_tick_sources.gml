function __input_player_tick_sources(arg0)
{
    static _global = __input_global();
    
    var _current_profile_dict = is_string(__profile_name) ? variable_struct_get(__profiles_dict, __profile_name) : undefined;
    var _is_multidevice_player = _global.__source_mode == (4 << 0) && __index == 0;
    var _v = 0;
    
    repeat (array_length(_global.__basic_verb_array))
    {
        var _verb_name = _global.__basic_verb_array[_v];
        var _verb_struct = variable_struct_get(__verb_state_dict, _verb_name);
        var _raw = 0;
        var _value = 0;
        var _analogue = false;
        var _raw_analogue = false;
        var _min_threshold = 0;
        var _max_threshold = 1;
        
        with (_verb_struct)
        {
            if (__virtual_value != undefined && __virtual_raw_value != undefined && __virtual_analogue != undefined)
            {
                _raw = __virtual_raw_value;
                _value = __virtual_value;
                _analogue = __virtual_analogue;
                _raw_analogue = __virtual_analogue;
                _min_threshold = 0;
                _max_threshold = 1;
                __virtual_value = undefined;
                __virtual_raw_value = undefined;
                __virtual_analogue = undefined;
            }
            
            if (__force_value != undefined && __force_analogue != undefined)
            {
                _raw = __force_value;
                _value = __force_value;
                _analogue = __force_analogue;
                _raw_analogue = __force_analogue;
                _min_threshold = 0;
                _max_threshold = 1;
                __force_value = undefined;
                __force_analogue = undefined;
            }
        }
        
        if (_global.__game_input_allowed && is_struct(_current_profile_dict))
        {
            var _s = 0;
            
            repeat (array_length(__source_array))
            {
                var _source_struct = __source_array[_s];
                var _source_type = _source_struct.__source;
                var _source_gamepad = _source_struct.__gamepad;
                var _alternate_array = variable_struct_get(_current_profile_dict, _verb_name);
                
                switch (_source_type)
                {
                    case (0 << 0):
                        var _alternate = 0;
                        
                        repeat (4)
                        {
                            var _binding = _alternate_array[_alternate];
                            
                            switch (_binding.__type)
                            {
                                case "key":
                                    if (keyboard_check(_binding.__value))
                                    {
                                        _value = 1;
                                        _raw = 1;
                                        _analogue = false;
                                        _raw_analogue = false;
                                    }
                                    
                                    break;
                                
                                case undefined:
                                    break;
                                
                                case "mouse button":
                                    if (input_mouse_check(_binding.__value))
                                    {
                                        _value = 1;
                                        _raw = 1;
                                        _analogue = false;
                                        _raw_analogue = false;
                                    }
                                    
                                    break;
                                
                                case "mouse wheel up":
                                    if (mouse_wheel_up())
                                    {
                                        _value = 1;
                                        _raw = 1;
                                        _analogue = false;
                                        _raw_analogue = false;
                                    }
                                    
                                    break;
                                
                                case "mouse wheel down":
                                    if (mouse_wheel_down())
                                    {
                                        _value = 1;
                                        _raw = 1;
                                        _analogue = false;
                                        _raw_analogue = false;
                                    }
                                    
                                    break;
                                
                                default:
                                    if (_global.__source_mode != (3 << 0) && _global.__source_mode != (4 << 0))
                                        __input_error("Binding unsupported\nplayer index = ", arg0.__index, "\nprofile = ", arg0.__profile_name, "\nsource = ", _source_struct, "\nverb = ", _verb_name, "\nalt = ", _alternate, "\nbinding = ", _binding);
                                    
                                    break;
                            }
                            
                            _alternate++;
                        }
                        
                        break;
                    
                    case (1 << 0):
                        var _alternate = 0;
                        
                        repeat (4)
                        {
                            var _binding = _alternate_array[_alternate];
                            
                            switch (_binding.__type)
                            {
                                case "mouse button":
                                    if (input_mouse_check(_binding.__value))
                                    {
                                        _value = 1;
                                        _raw = 1;
                                        _analogue = false;
                                        _raw_analogue = false;
                                    }
                                    
                                    break;
                                
                                case "mouse wheel up":
                                    if (mouse_wheel_up())
                                    {
                                        _value = 1;
                                        _raw = 1;
                                        _analogue = false;
                                        _raw_analogue = false;
                                    }
                                    
                                    break;
                                
                                case "mouse wheel down":
                                    if (mouse_wheel_down())
                                    {
                                        _value = 1;
                                        _raw = 1;
                                        _analogue = false;
                                        _raw_analogue = false;
                                    }
                                    
                                    break;
                                
                                case undefined:
                                    break;
                                
                                default:
                                    if (_global.__source_mode != (3 << 0) && _global.__source_mode != (4 << 0))
                                        __input_error("Binding unsupported\nplayer index = ", arg0.__index, "\nprofile = ", arg0.__profile_name, "\nsource = ", _source_struct, "\nverb = ", _verb_name, "\nalt = ", _alternate, "\nbinding = ", _binding);
                                    
                                    break;
                            }
                            
                            _alternate++;
                        }
                        
                        break;
                    
                    case (3 << 0):
                        break;
                    
                    case (2 << 0):
                        if (!input_gamepad_is_connected(_source_gamepad))
                        {
                            _s++;
                            continue;
                        }
                        
                        var _alternate = 0;
                        
                        repeat (4)
                        {
                            var _binding = _alternate_array[_alternate];
                            
                            if (_is_multidevice_player && _binding.__gamepad_index != undefined && _source_gamepad != _binding.__gamepad_index)
                                continue;
                            
                            switch (_binding.__type)
                            {
                                case "gamepad button":
                                    if (_global.__gamepads[_source_gamepad].__get_held(_binding.__value))
                                    {
                                        _value = 1;
                                        _raw = 1;
                                        _analogue = false;
                                        _raw_analogue = false;
                                    }
                                    
                                    break;
                                
                                case "gamepad axis":
                                    var _found_raw = _global.__gamepads[_source_gamepad].__get_value(_binding.__value);
                                    var _binding_threshold_min = _binding.__threshold_min;
                                    var _binding_threshold_max = _binding.__threshold_max;
                                    
                                    if (_binding_threshold_min == undefined || _binding_threshold_max == undefined)
                                    {
                                        var _threshold_struct = __axis_threshold_get(_binding.__value);
                                        _binding_threshold_min = _threshold_struct.__mini;
                                        _binding_threshold_max = _threshold_struct.__maxi;
                                    }
                                    
                                    if (_binding.__axis_negative)
                                        _found_raw = -_found_raw;
                                    
                                    var _found_value = _found_raw;
                                    _found_value = (_found_value - _binding_threshold_min) / (_binding_threshold_max - _binding_threshold_min);
                                    _found_value = clamp(_found_value, 0, 1);
                                    
                                    if (_found_raw > _raw)
                                    {
                                        _raw = _found_raw;
                                        _raw_analogue = true;
                                        _min_threshold = _binding_threshold_min;
                                        _max_threshold = _binding_threshold_max;
                                    }
                                    
                                    if (_found_value > _value)
                                    {
                                        _value = _found_value;
                                        _analogue = true;
                                    }
                                    
                                    break;
                                
                                case undefined:
                                    break;
                                
                                default:
                                    if (_global.__source_mode != (3 << 0) && _global.__source_mode != (4 << 0))
                                        __input_error("Binding unsupported\nplayer index = ", arg0.__index, "\nprofile = ", arg0.__profile_name, "\nsource = ", _source_struct, "\nverb = ", _verb_name, "\nalt = ", _alternate, "\nbinding = ", _binding);
                                    
                                    break;
                            }
                            
                            _alternate++;
                        }
                        
                        break;
                }
                
                _s++;
            }
        }
        
        with (_verb_struct)
        {
            __value = _value;
            __raw = _raw;
            
            if (_raw_analogue != undefined)
                __raw_analogue = _raw_analogue;
            
            if (_analogue != undefined)
                __analogue = _analogue;
            
            __min_threshold = _min_threshold;
            __max_threshold = _max_threshold;
        }
        
        _v++;
    }
}
