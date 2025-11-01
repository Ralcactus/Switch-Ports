function __input_gamepad_set_blacklist()
{
    static _global = __input_global();
    
    if (!(1 && (__input_global().__on_desktop || false)))
        exit;
    
    if (__vendor != "" && __product != "" && string_copy(__guid, 29, 2) == "68")
        exit;
    
    if (__axis_count == 0 && __button_count == 0 && __hat_count == 0)
    {
        __input_trace("Warning! Controller ", __index, " (VID+PID \"", __vendor + __product, "\") __blacklisted: no button or axis");
        __blacklisted = true;
        exit;
    }
    
    if (1 && __input_string_contains(__raw_type, "Wheel", "Flightstick", "Throttle", "Guitar", "Drumkit", "Dancepad", "Skateboard"))
    {
        __input_trace("Warning! Device ", __index, " is blacklisted (Not a gamepad)");
        __blacklisted = true;
        exit;
    }
    
    var _description_lower = string_replace_all(string_lower(gamepad_get_description(__index)), " ", "");
    
    switch (0)
    {
        case 0:
            if (__vendor == "7e05" && __product == "0920" && !(__button_count == 30 && __hat_count == 0) && __button_count > 21)
            {
                __input_trace("Warning! Controller ", __index, " is blacklisted (Switch Pro Controller over USB)");
                __blacklisted = true;
                exit;
            }
            
            if ((__vendor == "4c05" && __product == "6802") && ((__axis_count == 4 && __button_count == 19) || (__axis_count == 8 && __button_count == 0)))
            {
                __input_trace("Warning! Controller ", __index, " is blacklisted (Incorrectly configured PS3 controller)");
                __blacklisted = true;
                exit;
            }
            
            break;
        
        case 6:
            if (_global.__on_steam_deck)
            {
                if (__button_count == 144 && __axis_count == 0)
                {
                    __input_trace("Warning! Controller ", __index, " is blacklisted (Steam Deck virtual keyboard)");
                    __blacklisted = true;
                    exit;
                }
                
                if (__raw_type == "CommunitySteamDeck")
                    exit;
            }
            
            var _joycon_imu_axis_count = 6;
            
            if (__button_count == 0 && __axis_count == _joycon_imu_axis_count && __hat_count == 0)
            {
                var _i = 0;
                
                repeat (_joycon_imu_axis_count)
                {
                    if (gamepad_axis_value(__index, _i) <= 0)
                        break;
                    
                    _i++;
                }
                
                if (_i == _joycon_imu_axis_count)
                {
                    __input_trace("Warning! Controller ", __index, " __blacklisted (matches Joy-Con motion unit)");
                    __blacklisted = true;
                    exit;
                }
            }
            
            if (__raw_type == "HIDWiiMotionPlus" || __raw_type == "HIDWiiRemoteNunchuk" || __raw_type == "HIDWiiRemoteIMU" || __raw_type == "HIDWiiRemoteIRSensor")
            {
                __input_trace("Warning! Controller ", __index, " is blacklisted, type (\"", __raw_type, "\")");
                __blacklisted = true;
                exit;
            }
            
            break;
        
        case 4:
            if (__input_string_contains(_description_lower, "keyboard", "mouse", "touchpad") && !__input_string_contains(_description_lower, "joystick", "pg-9167", "harmonix", "wirelesscontroller"))
            {
                __input_trace("Warning! Controller ", __index, " is blacklisted, type (matches mouse or keyboard)");
                __blacklisted = true;
                exit;
            }
            
            break;
    }
    
    if (__vendor != "de28" && variable_struct_exists(_global.__ignore_gamepad_types, __simple_type))
    {
        __input_trace("Warning! Controller type is blacklisted by Steam Input (\"", __simple_type, "\")");
        __blacklisted = true;
        exit;
    }
    
    var _os = undefined;
    
    switch (0)
    {
        case 0:
            _os = "windows";
            break;
        
        case 6:
            _os = "linux";
            break;
        
        case 1:
            _os = "macos";
            break;
        
        case 4:
            _os = "android";
            break;
        
        default:
            __input_error("OS not supported");
            break;
    }
    
    var _os_filter_dict = variable_struct_get(_global.__blacklist_dictionary, _os);
    var _os_guid_dict = is_struct(_os_filter_dict) ? struct_get_from_hash(_os_filter_dict, variable_get_hash("guid")) : undefined;
    var _os_vidpid_dict = is_struct(_os_filter_dict) ? variable_struct_get(_os_filter_dict, "vid+pid") : undefined;
    var _os_desc_array = is_struct(_os_filter_dict) ? variable_struct_get(_os_filter_dict, "description contains") : undefined;
    
    if (is_struct(_os_guid_dict) && variable_struct_exists(_os_guid_dict, __guid))
    {
        __input_trace("Warning! Controller is blacklisted (found by GUID \"", __guid, "\")");
        __blacklisted = true;
        exit;
    }
    else if (is_struct(_os_vidpid_dict) && variable_struct_exists(_os_vidpid_dict, string(__vendor) + string(__product)))
    {
        __input_trace("Warning! Controller is blacklisted (found by VID+PID \"", __vendor, __product, "\")");
        __blacklisted = true;
        exit;
    }
    else if (is_array(_os_desc_array))
    {
        var _i = 0;
        
        repeat (array_length(_os_desc_array))
        {
            if (string_pos(_os_desc_array[_i], _description_lower) > 0)
            {
                __input_trace("Warning! Controller is blacklisted (banned substring \"", _os_desc_array[_i], "\" found in description)");
                __blacklisted = true;
                exit;
            }
            
            _i++;
        }
    }
}
