function __input_gamepad_set_type()
{
    static _global = __input_global();
    
    switch (0)
    {
        case 21:
            switch (__description)
            {
                case "Handheld":
                    __raw_type = "SwitchHandheld";
                    break;
                
                case "Pro Controller":
                    __raw_type = "SwitchProController";
                    break;
                
                case "Joy-Con (L)":
                    __raw_type = "SwitchJoyConLeft";
                    break;
                
                case "Joy-Con (R)":
                    __raw_type = "SwitchJoyConRight";
                    break;
                
                default:
                    __raw_type = "SwitchJoyConPair";
                    break;
            }
            
            __guessed_type = false;
            break;
        
        case 14:
            __raw_type = "PS4Controller";
            __guessed_type = false;
            break;
        
        case 22:
            __raw_type = "PS5Controller";
            __guessed_type = false;
            break;
        
        case 15:
        case 23:
            __raw_type = "XBoxOneController";
            __guessed_type = false;
            break;
        
        case 24:
            switch (__description)
            {
                case "Pro Controller (":
                    __raw_type = "SwitchProController";
                    __guessed_type = false;
                    break;
                
                case "Joy-Con L+R (STA":
                    __raw_type = "SwitchJoyConPair";
                    __guessed_type = false;
                    break;
                
                case "Wireless Control":
                    __raw_type = "CommunityPS4";
                    __guessed_type = true;
                    break;
                
                case "Xbox 360 Control":
                    __raw_type = "CommunityLikeXBox";
                    __guessed_type = true;
                    break;
            }
            
            if (__raw_type != undefined)
                break;
        
        default:
            var _vendor_and_product = __vendor + __product;
            var _irregular_guid = _vendor_and_product == "";
            
            if (__xinput)
            {
                __raw_type = "CommunityLikeXBox";
                __guessed_type = true;
            }
            else if (variable_struct_exists(_global.__raw_type_dictionary, _vendor_and_product))
            {
                __raw_type = variable_struct_get(_global.__raw_type_dictionary, _vendor_and_product);
                __guessed_type = false;
            }
            else
            {
                __guessed_type = true;
                
                if (_irregular_guid)
                    __input_trace("Warning! VID+PID not found. Guessing controller type based on description = \"", __description, "\"");
                else
                    __input_trace("Warning! VID+PID \"", _vendor_and_product, "\" not found in raw type database. Guessing controller type based on description = \"", __description, "\"");
                
                var _desc = string_lower(__description);
                
                if (__input_string_contains(_desc, "neogeo"))
                {
                    __raw_type = "CommunityNeoGeo";
                }
                else if (__input_string_contains(_desc, "8bitdo"))
                {
                    if (__input_string_contains(_desc, "xbox", "ultimate", "zero", "2c") && !__input_string_contains(_desc, "zero 2"))
                        __raw_type = "CommunityLikeXBox";
                    else if (__input_string_contains(_desc, " s30", " m30"))
                        __raw_type = "CommunitySaturn";
                    else if (__input_string_contains(_desc, " p30"))
                        __raw_type = "CommunityPSX";
                    else if (__input_string_contains(_desc, " n64"))
                        __raw_type = "CommunityN64";
                    else if (__input_string_contains(_desc, " ngc"))
                        __raw_type = "CommunityGameCube";
                    else
                        __raw_type = "Community8BitDo";
                }
                else if (__input_string_contains(_desc, "snes"))
                {
                    __raw_type = "CommunitySNES";
                }
                else if (__input_string_contains(_desc, "retroid", "odin", "sfc"))
                {
                    __raw_type = "CommunitySuperFamicom";
                }
                else if (__input_string_contains(_desc, "saturn"))
                {
                    __raw_type = "CommunitySaturn";
                }
                else if (__input_string_contains(_desc, "stadia"))
                {
                    __raw_type = "CommunityStadia";
                }
                else if (__input_string_contains(_desc, "luna", "amazon game"))
                {
                    __raw_type = "CommunityLuna";
                }
                else if (__input_string_contains(_desc, "ouya"))
                {
                    __raw_type = "CommunityOuya";
                }
                else if (__input_string_contains(_desc, "steam"))
                {
                    __raw_type = "SteamController";
                }
                else if (__input_string_contains(_desc, "ps5", "dualsense", "backbone one playstation"))
                {
                    __raw_type = "PS5Controller";
                }
                else if (__input_string_contains(_desc, "ps4", "dualshock 4", "sony interactive entertainment wireless controller"))
                {
                    __raw_type = "CommunityPS4";
                }
                else if (__input_string_contains(_desc, "playstation", "ps1", "ps2", "ps3", "dualshock"))
                {
                    __raw_type = "CommunityPSX";
                }
                else if (__input_string_contains(_desc, "gamecube", "wired fight pad pro for nintendo", "core (plus) wired"))
                {
                    __raw_type = "CommunityGameCube";
                }
                else if (__input_string_contains(_desc, "for switch", "for nintendo switch", "switch controller", "switch pro", "lic pro", "mobapad", "wii"))
                {
                    __raw_type = "CommunityLikeSwitch";
                }
                else if (__input_string_contains(_desc, "joy-con (l/r)"))
                {
                    __raw_type = "SwitchJoyConPair";
                }
                else if (__input_string_contains(_desc, "joy-con (l)", "left joy-con"))
                {
                    __raw_type = "SwitchJoyConLeft";
                }
                else if (__input_string_contains(_desc, "joy-con (r)", "right joy-con"))
                {
                    __raw_type = "SwitchJoyConRight";
                }
                else if (__input_string_contains(_desc, "xbox elite", "xbox wireless", "xbox one", "xbox bluetooth"))
                {
                    __raw_type = "CommunityXBoxOne";
                }
                else if (__input_string_contains(_desc, "xbox 360", "xbox360", "logitech gamepad f"))
                {
                    __raw_type = "CommunityXBox360";
                }
                else if (__input_string_contains(_desc, "xbox"))
                {
                    __raw_type = "CommunityLikeXBox";
                }
                else if (false || __input_string_contains(_desc, "nimbus", "horipad ultimate", "mfi"))
                {
                    __raw_type = "AppleController";
                }
                else if (__input_string_contains(_desc, "throttle", "flight quadrant"))
                {
                    __raw_type = "SDLThrottle";
                }
                else if (__input_string_contains(_desc, "flightstick", "hotas") || (__input_string_contains(_desc, "flight", "sim", "eclipse") && __input_string_contains(_desc, "stick", "yoke", "rudder")))
                {
                    __raw_type = "SDLFlightstick";
                }
                else if (__input_string_contains(_desc, "driving force", "momo force", "openffboard") || (__input_string_contains(_desc, "wheel") && __input_string_contains(_desc, "racing", "steering", "base", "feedback")))
                {
                    __raw_type = "SDLWheel";
                }
                else
                {
                    __raw_type = "Unknown";
                }
                
                if (__input_string_contains(_desc, "drum"))
                    __raw_type += "Drumkit";
                else if (__input_string_contains(_desc, "guitar", " fender "))
                    __raw_type += "Guitar";
                else if (__input_string_contains(_desc, "skateboard"))
                    __raw_type += "Skateboard";
                else if (__input_string_contains(_desc, "ddr", "dance") && !__input_string_contains(_desc, "hyperkin"))
                    __raw_type += "Dancepad";
            }
            
            switch (_vendor_and_product)
            {
                case "3412adbe":
                    if ((__button_count == 12 || __button_count == 23) && __axis_count == 6 && __hat_count == 0 && true)
                    {
                        __input_trace("Overridding controller ", __index, " type to GameCube");
                        __description = "GameCube";
                        __raw_type = "CommunityGameCube";
                        __guessed_type = false;
                    }
                    
                    break;
                
                case "0d000000":
                    if (__button_count == 15 && __axis_count == 4 && __hat_count == 0 && true)
                    {
                        __input_trace("Overriding controller ", __index, " type to MFi");
                        __description = "MFi Extended";
                        __raw_type = "AppleController";
                        __guessed_type = false;
                    }
                    
                    break;
                
                case "63257505":
                    if (__button_count == 17 && __hat_count == 0)
                    {
                        __input_trace("Overriding controller ", __index, " type to NeoGeo Mini");
                        __description = "NeoGeo Mini";
                        __raw_type = "CommunityNeoGeoMini";
                        __guessed_type = false;
                    }
                    else if (__button_count == 13 && __hat_count == 1)
                    {
                        var _desc = gamepad_get_description(__index);
                        
                        if (_desc == "USB " || _desc == "SWITCH CO.,LTD. Retro-bit Controller")
                        {
                            __input_trace("Overriding controller ", __index, " type to Switch");
                            __description = "Saturn Wireless Pro";
                            __raw_type = "CommunityLikeSwitch";
                            __guessed_type = false;
                        }
                        else if (__input_string_contains(_desc, "Controller (Dinput)"))
                        {
                            __input_trace("Overriding controller ", __index, " type to N64");
                            __description = "N64";
                            __raw_type = "CommunityN64";
                            __guessed_type = false;
                        }
                    }
                    
                    break;
                
                case "bc200155":
                    if (__input_string_contains(gamepad_get_description(__index), "JJ", "NeoGeo G1 Pro") && __input_global().__on_desktop)
                    {
                        __input_trace("Overriding controller ", __index, " type to NeoGeo Mini");
                        __description = "SNK NEOGEO Arcade Stick Pro";
                        __raw_type = "CommunityNeoGeoMini";
                        __guessed_type = false;
                    }
                    
                    break;
                
                case "d90493a2":
                    if (__input_global().__on_desktop)
                    {
                        __input_trace("Overriding controller ", __index, " type to Anne Pro 2");
                        __description = "Anne Pro 2";
                        __raw_type = "CommunityAnnePro";
                        __guessed_type = false;
                    }
                    
                    break;
                
                case "8f0e1330":
                    if ((false && __hat_count == 2) || (true && __button_count == 25 && __axis_count == 6 && __hat_count == 0 && ((__input_string_contains(gamepad_get_guid(__index + 1), "8f0e") && __input_string_contains(gamepad_get_guid(__index + 1), "1330")) || (__input_string_contains(gamepad_get_guid(__index - 1), "8f0e") && __input_string_contains(gamepad_get_guid(__index - 1), "1330")))))
                    {
                        __input_trace("Overriding controller ", __index, " type to N64");
                        __description = "N64 Adapter";
                        __raw_type = "CommunityN64";
                        __guessed_type = false;
                    }
                    
                    break;
                
                case "d62010a7":
                    if (__hat_count == 0 && true && ((__input_string_contains(gamepad_get_guid(__index + 1), "d620") && __input_string_contains(gamepad_get_guid(__index + 1), "10a7")) || (__input_string_contains(gamepad_get_guid(__index - 1), "d620") && __input_string_contains(gamepad_get_guid(__index - 1), "10a7"))))
                    {
                        __input_trace("Overriding controller ", __index, " type to N64");
                        __description = "N64 Adapter";
                        __raw_type = "CommunityN64";
                        __guessed_type = false;
                    }
                    
                    break;
                
                case "6f0e1311":
                    if (__saffun_axis_test == undefined)
                    {
                        __input_trace("Overriding controller ", __index, " type to Saffun N64");
                        __saffun_axis_test = true;
                        __description = "Saffun N64";
                        __raw_type = "CommunityN64";
                        __guessed_type = false;
                    }
                    else if (__saffun_axis_test == false)
                    {
                        __input_trace("Overriding controller ", __index, " type to Saffun GameCube");
                        __description = "Saffun GameCube";
                        __raw_type = "CommunityGameCube";
                        __guessed_type = false;
                    }
                    
                    break;
                
                case "d62011a7":
                    if (__guid == "03000000d620000011a7000000020000")
                    {
                        __raw_type = "CommunityGameCube";
                        __guessed_type = false;
                    }
                    
                    break;
                
                case "00000000":
                    if (__description == "Wireless Gamepad" && __button_count == 16 && __axis_count == 4 && __hat_count == 1 && true)
                    {
                        __input_trace("Overridding controller ", __index, " type to Switch");
                        __raw_type = "CommunityLikeSwitch";
                        __guessed_type = false;
                    }
                    
                    break;
                
                case "49190204":
                    if (__guid == "0500000049190000020400001b010000" && gamepad_get_description(__index) == "xbox Wireless Controller")
                    {
                        __input_trace("Overridding controller ", __index, " type to Switch");
                        __description = "Manba Mini";
                        __raw_type = "CommunityLikeSwitch";
                        __guessed_type = false;
                    }
                    
                    break;
                
                default:
                    switch (0)
                    {
                        case 4:
                            if (string_pos("4a4a000000000000", __guid) == 1)
                            {
                                __raw_type = "CommunityNeoGeo";
                                __guessed_type = true;
                                break;
                            }
                            
                            if (__input_string_contains(__description, "Classic Controller") && __axis_count == 10 && __hat_count == 1)
                            {
                                __raw_type = "CommunityVCSClassic";
                                __guessed_type = true;
                                break;
                            }
                            
                            break;
                        
                        case 6:
                            if (_irregular_guid && __axis_count == 1 && __button_count == 5 && __hat_count == 1)
                            {
                                __raw_type = "HIDAtariVCSClassic";
                                __guessed_type = true;
                                break;
                            }
                            
                            if (__button_count == 11 && __axis_count == 2 && __hat_count == 0)
                            {
                                if (__guid == "050000007e0500000620000001800000")
                                {
                                    __raw_type = "HIDJoyConLeft";
                                    __guessed_type = false;
                                }
                                else if (_irregular_guid)
                                {
                                    __raw_type = "HIDJoyConRight";
                                    __guessed_type = true;
                                }
                                
                                break;
                            }
                            
                            var _wii_type_match = "Unknown";
                            
                            if (__button_count == 11 && __axis_count == 0 && __hat_count == 0 && __index > 1)
                                _wii_type_match = "HIDWiiRemote";
                            else if (__button_count == 0 && __axis_count == 3 && __hat_count == 0 && __index > 2)
                                _wii_type_match = "HIDWiiMotionPlus";
                            else if (__button_count == 2 && __axis_count == 3 && __hat_count == 1 && __index > 2)
                                _wii_type_match = "HIDWiiNunchuk";
                            else if (__button_count == 15 && __axis_count == 0 && __hat_count == 3 && __index > 2)
                                _wii_type_match = "HIDWiiClassic";
                            
                            switch (_wii_type_match)
                            {
                                case "HIDWiiMotionPlus":
                                case "HIDWiiNunchuk":
                                case "HIDWiiClassic":
                                    var _g = __index;
                                    
                                    repeat (__index)
                                    {
                                        _g--;
                                        
                                        if (gamepad_is_connected(_g))
                                        {
                                            if (_global.__gamepads[_g].__raw_type == "HIDWiiRemote" || _global.__gamepads[_g].__raw_type == "HIDWiiMotionPlus")
                                            {
                                                __input_trace("Overriding controller ", _g, " type to \"", _wii_type_match, "\"");
                                                
                                                if (_wii_type_match == "HIDWiiClassic")
                                                    __description = "Nintendo Wii Classic Controller";
                                                
                                                __raw_type = _wii_type_match;
                                                __guessed_type = true;
                                            }
                                            
                                            break;
                                        }
                                    }
                                    
                                    break;
                                
                                case "HIDWiiRemote":
                                    var _g = __index;
                                    
                                    repeat (__index)
                                    {
                                        _g--;
                                        
                                        if (input_gamepad_is_connected(_g))
                                            break;
                                    }
                                    
                                    if (_g >= 1 && _global.__gamepads[_g].__hat_count == 4 && _global.__gamepads[_g].__button_count == 0 && _global.__gamepads[_g].__axis_count == 0)
                                    {
                                        var _ir_index = _g;
                                        
                                        repeat (_ir_index + 1)
                                        {
                                            _g--;
                                            
                                            if (gamepad_is_connected(_g))
                                                break;
                                        }
                                        
                                        if (_g >= 0 && _global.__gamepads[_g].__axis_count == 3 && _global.__gamepads[_g].__button_count == 0 && _global.__gamepads[_g].__hat_count == 0)
                                        {
                                            var _imu_index = _g;
                                            __input_trace("Overriding controller ", _imu_index, " type to \"HIDWiiRemoteIMU\"");
                                            
                                            with (_global.__gamepads[_imu_index])
                                            {
                                                __raw_type = "HIDWiiRemoteIMU";
                                                __guessed_type = true;
                                                __input_gamepad_set_blacklist();
                                                __input_gamepad_set_mapping();
                                            }
                                            
                                            __input_trace("Overriding controller ", _ir_index, " type to \"HIDWiiRemoteIRSensor\"");
                                            
                                            with (_global.__gamepads[_ir_index])
                                            {
                                                __raw_type = "HIDWiiRemoteIRSensor";
                                                __guessed_type = true;
                                                __input_gamepad_set_blacklist();
                                                __input_gamepad_set_mapping();
                                            }
                                            
                                            __input_trace("Overriding controller ", __index, " type to \"HIDWiiRemote\"");
                                            __description = "Nintendo Wii Remote";
                                            __raw_type = "HIDWiiRemote";
                                            __guessed_type = true;
                                        }
                                    }
                                    
                                    break;
                            }
                            
                            break;
                    }
                    
                    break;
            }
            
            break;
    }
    
    if (variable_struct_exists(_global.__simple_type_lookup, __raw_type))
    {
        __simple_type = variable_struct_get(_global.__simple_type_lookup, __raw_type);
    }
    else
    {
        __simple_type = "unknown";
        __input_trace("Warning! Raw type \"", __raw_type, "\" not found in lookup table, setting simple type to \"", __simple_type, "\"");
    }
}
