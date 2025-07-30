function __input_class_gamepad(argument0) constructor
{
    static __global = __input_global();
    
    static __discover = function()
    {
        __mapping_gm_to_raw = {};
        __mapping_raw_to_gm = {};
        __mapping_array = [];
        __button_count = gamepad_button_count(__index);
        __axis_count = gamepad_axis_count(__index);
        __hat_count = gamepad_hat_count(__index);
        __input_gamepad_set_vid_pid();
        __input_gamepad_set_description();
        __input_gamepad_find_in_sdl2_database();
        __input_gamepad_set_type();
        __input_gamepad_set_blacklist();
        __input_gamepad_set_mapping();
        __virtual_set();
        __led_set();
        __swap_ab();
        __vibration_initialize();
        __disconnection_frame = undefined;
        __axis_calibrated = !(os_type == os_android);
        
        if (__global.__gamepad_motion_support)
            __motion = new __input_class_gamepad_motion(__index);
        
        __input_trace("Gamepad ", __index, " discovered, type = \"", __simple_type, "\" (", __raw_type, ", guessed=", __guessed_type, "), description = \"", __description, "\" (vendor=", __vendor, ", product=", __product, ")");
    };
    
    static __get_any_pressed = function()
    {
        if (__get_pressed(32769) || __get_pressed(32770) || __get_pressed(32771) || __get_pressed(32772) || __get_pressed(32781) || __get_pressed(32782) || __get_pressed(32783) || __get_pressed(32784) || __get_pressed(32773) || __get_pressed(32774) || __get_pressed(32778) || __get_pressed(32777) || __get_pressed(32779) || __get_pressed(32780) || __get_pressed(__input_global().__gp_guide) || __get_pressed(__input_global().__gp_misc1) || __get_pressed(__input_global().__gp_touchpad) || __get_pressed(__input_global().__gp_paddle1) || __get_pressed(__input_global().__gp_paddle2) || __get_pressed(__input_global().__gp_paddle3) || __get_pressed(__input_global().__gp_paddle4) || (!__is_axis(32775) && __get_pressed(32775)) || (!__is_axis(32776) && __get_pressed(32776)))
            return true;
        
        return false;
    };
    
    static __get_held = function(argument0)
    {
        var _mapping = variable_struct_get(__mapping_gm_to_raw, argument0);
        
        if (_mapping == undefined)
            return false;
        
        return _mapping.__held;
    };
    
    static __get_pressed = function(argument0)
    {
        var _mapping = variable_struct_get(__mapping_gm_to_raw, argument0);
        
        if (_mapping == undefined)
            return false;
        
        return _mapping.__press;
    };
    
    static __get_released = function(argument0)
    {
        var _mapping = variable_struct_get(__mapping_gm_to_raw, argument0);
        
        if (_mapping == undefined)
            return false;
        
        return _mapping.__release;
    };
    
    static __get_value = function(argument0)
    {
        var _mapping = variable_struct_get(__mapping_gm_to_raw, argument0);
        
        if (_mapping == undefined)
            return 0;
        
        return _mapping.__value;
    };
    
    static __get_delta = function(argument0)
    {
        var _mapping = variable_struct_get(__mapping_gm_to_raw, argument0);
        
        if (_mapping == undefined)
            return 0;
        
        return _mapping.__value_delta;
    };
    
    static __is_axis = function(argument0)
    {
        var _mapping = variable_struct_get(__mapping_gm_to_raw, argument0);
        
        if (_mapping == undefined)
            return false;
        
        return _mapping.__type == (1 << 0);
    };
    
    static __set_custom_mapping = function()
    {
        __custom_mapping = true;
        
        if (!(false || os_type == os_gxgames) && (__input_global().__on_desktop || os_type == os_android))
        {
            if (os_type == os_macosx)
            {
                if (__mapping != "" && __mapping != "no mapping")
                {
                    __input_trace("Gamepad ", __index, " has a custom mapping, clearing GameMaker's native mapping _string");
                    __mac_cleared_mapping = true;
                }
                
                gamepad_test_mapping(__index, gamepad_get_guid(__index) + "," + gamepad_get_description(__index) + ",");
            }
            else
            {
                __input_trace("Gamepad ", __index, __blacklisted ? " is blacklisted" : " has a custom mapping", ", clearing GameMaker's native mapping _string");
                gamepad_remove_mapping(__index);
            }
        }
    };
    
    static __set_mapping = function(argument0, argument1, argument2, argument3, argument4 = true)
    {
        if (argument4)
        {
            if (!__custom_mapping)
                __set_custom_mapping();
            
            if (__mac_cleared_mapping && os_type == os_macosx)
            {
                if (argument2 == (1 << 0))
                    argument1 += 6;
                
                if (argument2 == (0 << 0))
                    argument1 += (__global.__use_gp_extended ? 28 : 17);
            }
        }
        
        var _mapping = new __input_class_gamepad_mapping(argument0, argument1, argument2, argument3);
        variable_struct_set(__mapping_gm_to_raw, argument0, _mapping);
        
        if (argument1 != undefined)
            variable_struct_set(__mapping_raw_to_gm, argument1, _mapping);
        
        array_push(__mapping_array, _mapping);
        return _mapping;
    };
    
    static __set_face_button_mapping = function()
    {
        __set_mapping(32769, 0, (0 << 0), "a");
        __set_mapping(32770, 1, (0 << 0), "b");
        __set_mapping(32771, 2, (0 << 0), "x");
        __set_mapping(32772, 3, (0 << 0), "y");
    };
    
    static __set_dpad_and_thumbstick_mapping = function()
    {
        __set_dpad_hat_mapping();
        __set_thumbstick_axis_mapping();
    };
    
    static __set_dpad_hat_mapping = function()
    {
        var _mapping = __set_mapping(32781, 0, (2 << 0), "dpup");
        _mapping.__hat_mask = 1;
        _mapping = __set_mapping(32784, 0, (2 << 0), "dpright");
        _mapping.__hat_mask = 2;
        _mapping = __set_mapping(32782, 0, (2 << 0), "dpdown");
        _mapping.__hat_mask = 4;
        _mapping = __set_mapping(32783, 0, (2 << 0), "dpleft");
        _mapping.__hat_mask = 8;
    };
    
    static __set_thumbstick_axis_mapping = function(argument0 = false)
    {
        var _mappings = [__set_mapping(32785, 0, (1 << 0), "leftx"), __set_mapping(32786, 1, (1 << 0), "lefty")];
        
        if (!argument0)
        {
            array_push(_mappings, __set_mapping(32787, 2, (1 << 0), "rightx"));
            array_push(_mappings, __set_mapping(32788, 3, (1 << 0), "righty"));
        }
        
        if (os_type == os_linux)
        {
            var _i = 0;
            
            repeat (array_length(_mappings))
            {
                _mappings[_i].limited_range = true;
                _i++;
            }
        }
    };
    
    static __tick = function(argument0)
    {
        if (!argument0)
        {
            if (__disconnection_frame == undefined)
                __disconnection_frame = __global.__frame;
        }
        else
        {
            __disconnection_frame = undefined;
            
            if (os_type == os_windows)
            {
                if (__xinput_trigger_range < 1)
                {
                    var _trigger_max = max(gamepad_axis_value(__index, 4106), gamepad_axis_value(__index, 4107));
                    
                    if (_trigger_max > __xinput_trigger_range)
                    {
                        if (_trigger_max > 0.99609375)
                        {
                            __input_trace("Fully extending XInput trigger scale for gamepad ", __index);
                            __xinput_trigger_range = 1;
                        }
                        else
                        {
                            __input_trace("Partially extending XInput trigger scale for gamepad ", __index);
                            __xinput_trigger_range = 0.99609375;
                        }
                        
                        var _mapping = variable_struct_get(__mapping_gm_to_raw, 32775);
                        _mapping.__scale = 1 / __xinput_trigger_range;
                        _mapping = variable_struct_get(__mapping_gm_to_raw, 32776);
                        _mapping.__scale = 1 / __xinput_trigger_range;
                    }
                }
                
                if (__stadia_trigger_test && (gamepad_axis_value(__index, 1) != gamepad_axis_value(__index, 2) || gamepad_axis_value(__index, 4) != gamepad_axis_value(__index, 5)))
                {
                    __input_trace("Setting Stadia controller to analogue trigger mapping for gamepad ", __index);
                    __stadia_trigger_test = false;
                    __set_mapping(32787, 2, (1 << 0), "rightx");
                    __set_mapping(32788, 3, (1 << 0), "righty");
                    var _mapping = __set_mapping(32776, 4, (1 << 0), "righttrigger");
                    _mapping.__extended_range = true;
                    _mapping = __set_mapping(32775, 5, (1 << 0), "lefttrigger");
                    _mapping.__extended_range = true;
                }
            }
        }
        
        var _deadzone = gamepad_get_axis_deadzone(__index);
        
        if (_deadzone != 0)
            gamepad_set_axis_deadzone(__index, 0);
        
        var _scan = argument0 && current_time > __scan_start_time;
        var _gamepad = __index;
        var _i = 0;
        
        repeat (array_length(__mapping_array))
        {
            with (__mapping_array[_i])
                __tick(_gamepad, _scan);
            
            _i++;
        }
        
        if (_deadzone != 0)
            gamepad_set_axis_deadzone(__index, _deadzone);
        
        if (argument0 && !__axis_calibrated)
        {
            var _success = false;
            var _mapping = 0;
            
            repeat (array_length(__mapping_array))
            {
                _success = __mapping_array[_mapping].__calibrate(__axis_calibrated);
                
                if (_success)
                {
                    __input_trace("Axis calibration confirmed for gamepad ", __index);
                    __axis_calibrated = true;
                }
                
                _mapping++;
            }
        }
        
        if (!argument0)
        {
            if ((__global.__frame - __disconnection_frame) >= 5)
                return false;
        }
        
        if (__vibration_support)
        {
            if (argument0 && __vibration_received_this_frame && input_game_has_focus())
            {
                var _vibration_low = __vibration_scale * __vibration_left;
                var _vibration_high = __vibration_scale * __vibration_right;
                
                if (os_type == os_switch)
                {
                    if (__raw_type == "SwitchJoyConLeft" || __raw_type == "SwitchJoyConRight")
                    {
                        switch_controller_vibrate_hd(__index, 0, _vibration_high, 250, _vibration_low, 160);
                    }
                    else
                    {
                        switch_controller_vibrate_hd(__index, 0, _vibration_high, 250, _vibration_low, 160);
                        switch_controller_vibrate_hd(__index, 1, _vibration_high, 250, _vibration_low, 160);
                    }
                }
                else
                {
                    gamepad_set_vibration(__index, _vibration_low, _vibration_high);
                }
            }
            else
            {
                gamepad_set_vibration(__index, 0, 0);
            }
            
            __vibration_received_this_frame = false;
        }
        
        return true;
    };
    
    static __swap_ab = function()
    {
        if (__input_gamepad_type_swap_ab(__simple_type) && is_struct(variable_struct_get(__mapping_gm_to_raw, _string(32769))) && is_struct(variable_struct_get(__mapping_gm_to_raw, _string(32770))))
        {
            var _a_mapping = variable_struct_get(__mapping_gm_to_raw, _string(32769)).__raw;
            __set_mapping(32769, variable_struct_get(__mapping_gm_to_raw, _string(32770)).__raw, (0 << 0), "a");
            __set_mapping(32770, _a_mapping, (0 << 0), "b");
        }
    };
    
    static __virtual_set = function()
    {
        if (!__global.__using_steamworks)
            exit;
        
        var _gamepad_is_virtual = os_type == os_windows && __xinput;
        var _slot = __index;
        
        if (os_type == os_linux)
        {
            _gamepad_handle_index = -1;
            _gamepad_is_virtual = false;
            var _i = 0;
            
            repeat (__index + 1)
            {
                if (gamepad_get_description(_i) == "Valve Streaming Gamepad" || __input_string_contains(gamepad_get_guid(_i), "03000000de280000fc11", "03000000de280000ff11"))
                {
                    _gamepad_handle_index++;
                    _gamepad_is_virtual = true;
                }
                
                _i++;
            }
            
            _slot = _gamepad_handle_index;
        }
        
        __steam_handle = steam_input_get_controller_for_gamepad_index(_slot);
        
        if (!(_gamepad_is_virtual && is_numeric(__steam_handle) && __steam_handle > 0))
        {
            __steam_handle = undefined;
        }
        else
        {
            __steam_handle_index = steam_input_get_gamepad_index_for_controller(__steam_handle);
            
            if (__steam_handle_index == -1)
                exit;
            
            var _handle_type = steam_input_get_input_type_for_handle(__steam_handle);
            
            if (!(is_numeric(_handle_type) && _handle_type >= 0))
                exit;
            
            var _description = variable_struct_get(__global.__steam_type_to_name, _handle_type);
            
            if (_description == undefined)
                exit;
            
            var _raw_type = variable_struct_get(__global.__steam_type_to_raw, _handle_type);
            
            if (_raw_type == undefined)
                exit;
            
            var _simple_type = variable_struct_get(__global.__simple_type_lookup, _raw_type);
            
            if (_simple_type == undefined)
                exit;
            
            __description = _description;
            __raw_type = _raw_type;
            __simple_type = _simple_type;
        }
    };
    
    static __led_set = function()
    {
        __led_pattern = undefined;
        
        if (!(os_type == os_ps5 || os_type == os_switch || (os_type == os_ios || os_type == os_tvos) || (os_type == os_windows && !(false || os_type == os_gxgames))) || (os_type == os_windows && !is_numeric(__steam_handle)))
            exit;
        
        var _led_offset = 0;
        var _led_layout = undefined;
        var _led_type = "xbox 360";
        
        if (!(false || os_type == os_gxgames) && ((os_type == os_ios || os_type == os_tvos) || os_type == os_switch))
        {
            if (__index == 0)
                exit;
            
            _led_offset = -1;
        }
        
        if (__raw_type == "AppleController" && (os_type == os_ios || os_type == os_tvos))
            _led_layout = "horizontal";
        
        switch (__simple_type)
        {
            case "ps5":
                _led_layout = "horizontal";
                _led_type = "ps5";
                break;
            
            case "switch":
            case "switch joycon left":
            case "switch joycon right":
                if (__raw_type == "SwitchJoyConPair" || (0 && __simple_type != "switch"))
                    _led_layout = "vertical";
                else
                    _led_layout = "horizontal";
                
                if (!is_numeric(__steam_handle))
                    _led_type = "switch";
                
                break;
            
            case "xbox 360":
                _led_layout = "radial";
                break;
        }
        
        if (_led_layout != undefined)
        {
            __led_pattern = 
            {
                __value: __index + _led_offset + 1,
                __pattern: array_get(variable_struct_get(__global.__gamepad_led_pattern_dict, _led_type), __index + _led_offset),
                __layout: _led_layout
            };
        }
    };
    
    static __color_set = function(argument0)
    {
        if (__global.__using_steamworks)
        {
            var _led_flag = steam_input_led_flag_set_color;
            
            if (argument0 == undefined)
            {
                argument0 = 0;
                _led_flag = steam_input_led_flag_restore_user_default;
            }
            
            if (is_numeric(__steam_handle))
                steam_input_set_led_color(__steam_handle, argument0, _led_flag);
            
            exit;
        }
        
        if (os_type == os_ps4 || os_type == os_ps5)
        {
            if (argument0 == undefined)
            {
                if (os_type == os_ps4)
                    ps4_gamepad_reset_color(__index);
                
                if (os_type == os_ps5)
                    ps5_gamepad_reset_color(__index);
                
                exit;
            }
            
            gamepad_set_color(__index, argument0);
        }
    };
    
    static __vibration_initialize = function()
    {
        __vibration_support = __global.__vibration_allowed && (__xinput || !(os_type == os_windows));
        
        if (__vibration_support)
        {
            if (os_type == os_ps5)
                ps5_gamepad_set_vibration_mode(__index, 2);
            else if ((os_type == os_windows || os_type == os_switch) && __input_string_contains(__raw_type, "JoyCon", "SwitchHandheld"))
                __vibration_scale = 0.4;
            else
                __vibration_scale = 1;
            
            gamepad_set_vibration(__index, 0, 0);
        }
    };
    
    static __vibration_set = function(argument0, argument1)
    {
        __vibration_left = argument0;
        __vibration_right = argument1;
        __vibration_received_this_frame = true;
    };
    
    static __trigger_effect_apply = function(argument0, argument1, argument2)
    {
        var _trigger_index = 1;
        
        if (argument0 == 32775)
        {
            _trigger_index = 0;
        }
        else if (argument0 != 32776)
        {
            __input_error("Value ", argument0, " not a gamepad trigger");
            return false;
        }
        
        if (os_type == os_ps5)
            return argument1.__apply_ps5(__index, argument0, argument2);
        
        if (__global.__using_steamworks)
            return __input_steam_apply_trigger_effect(__steam_handle, argument1, _trigger_index, argument2);
        
        return false;
    };
    
    __index = argument0;
    __description = gamepad_get_description(argument0);
    __guid = gamepad_get_guid(argument0);
    __xinput = undefined;
    __raw_type = undefined;
    __simple_type = undefined;
    __sdl2_definition = undefined;
    __guessed_type = false;
    __blacklisted = false;
    __vendor = undefined;
    __product = undefined;
    __button_count = undefined;
    __axis_count = undefined;
    __hat_count = undefined;
    __mapping = gamepad_get_mapping(argument0);
    __custom_mapping = false;
    __mac_cleared_mapping = false;
    __xinput_trigger_range = 1;
    __stadia_trigger_test = false;
    __axis_calibrated = false;
    __steam_handle_index = undefined;
    __steam_handle = undefined;
    __vibration_support = false;
    __vibration_scale = 1;
    __vibration_left = 0;
    __vibration_right = 0;
    __vibration_received_this_frame = false;
    __led_pattern = undefined;
    __motion = undefined;
    __mapping_gm_to_raw = {};
    __mapping_raw_to_gm = {};
    __mapping_array = [];
    __connection_time = current_time;
    __scan_start_time = __connection_time + 250;
    __disconnection_frame = undefined;
    __discover();
}
