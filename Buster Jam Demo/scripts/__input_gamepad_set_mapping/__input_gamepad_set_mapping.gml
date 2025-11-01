function __input_gamepad_set_mapping()
{
    static _global = __input_global();
    
    __custom_mapping = false;
    
    if (__blacklisted)
    {
        __set_custom_mapping();
        __mapping_gm_to_raw = {};
        __mapping_raw_to_gm = {};
        __mapping_array = [];
        exit;
    }
    
    if (__xinput)
    {
        __set_mapping(32781, 0, (0 << 0), "dpup");
        __set_mapping(32782, 1, (0 << 0), "dpdown");
        __set_mapping(32783, 2, (0 << 0), "dpleft");
        __set_mapping(32784, 3, (0 << 0), "dpright");
        __set_mapping(32778, 4, (0 << 0), "start");
        __set_mapping(32777, 5, (0 << 0), "back");
        __set_mapping(32779, 6, (0 << 0), "leftstick");
        __set_mapping(32780, 7, (0 << 0), "rightstick");
        __set_mapping(32773, 8, (0 << 0), "leftshoulder");
        __set_mapping(32774, 9, (0 << 0), "rightshoulder");
        __set_mapping(32769, 12, (0 << 0), "a");
        __set_mapping(32770, 13, (0 << 0), "b");
        __set_mapping(32771, 14, (0 << 0), "x");
        __set_mapping(32772, 15, (0 << 0), "y");
        __set_mapping(32785, 0, (1 << 0), "leftx");
        __set_mapping(32787, 2, (1 << 0), "rightx");
        var _mapping = __set_mapping(32786, 1, (1 << 0), "lefty");
        _mapping.__reverse = true;
        _mapping = __set_mapping(32788, 3, (1 << 0), "righty");
        _mapping.__reverse = true;
        var _mapping_lt = __set_mapping(32775, 4106, (1 << 0), "lefttrigger");
        var _mapping_rt = __set_mapping(32776, 4107, (1 << 0), "righttrigger");
        
        if (is_numeric(__steam_handle))
            __xinput_trigger_range = 0.99609375;
        else
            __xinput_trigger_range = 0.24609375;
        
        _mapping_lt.__scale = 1 / __xinput_trigger_range;
        _mapping_rt.__scale = 1 / __xinput_trigger_range;
        exit;
    }
    
    var _vendor_and_product = __vendor + __product;
    
    switch (__raw_type)
    {
        case "CommunityStadia":
            __input_trace("Setting default Stadia controller mapping");
            __set_face_button_mapping();
            __set_mapping(32773, 4, (0 << 0), "leftshoulder");
            __set_mapping(32774, 5, (0 << 0), "rightshoulder");
            __set_mapping(32779, 6, (0 << 0), "leftstick");
            __set_mapping(32780, 7, (0 << 0), "rightstick");
            __set_mapping(32777, 8, (0 << 0), "back");
            __set_mapping(32778, 9, (0 << 0), "start");
            __set_mapping(__input_global().__gp_guide, 10, (0 << 0), "guide");
            __set_mapping(__input_global().__gp_misc1, 14, (0 << 0), "misc1");
            __set_dpad_hat_mapping();
            __set_thumbstick_axis_mapping(true);
            __stadia_trigger_test = true;
            __set_mapping(32776, 11, (0 << 0), "righttrigger");
            __set_mapping(32775, 12, (0 << 0), "lefttrigger");
            exit;
            break;
        
        case "AppleController":
            if (!__guessed_type && true)
            {
                __input_trace("Setting MFi controller mapping");
                __set_mapping(32783, 0, (0 << 0), "dpleft");
                __set_mapping(32782, 1, (0 << 0), "dpdown");
                __set_mapping(32784, 2, (0 << 0), "dpright");
                __set_mapping(32781, 3, (0 << 0), "dpup");
                __set_mapping(32769, 4, (0 << 0), "a");
                __set_mapping(32770, 5, (0 << 0), "b");
                __set_mapping(32771, 6, (0 << 0), "x");
                __set_mapping(32772, 7, (0 << 0), "y");
                __set_mapping(32773, 8, (0 << 0), "leftshoulder");
                __set_mapping(32774, 9, (0 << 0), "rightshoulder");
                __set_mapping(32780, 10, (0 << 0), "rightstick");
                __set_mapping(32779, 11, (0 << 0), "leftstick");
                __set_mapping(32777, 13, (0 << 0), "back");
                __set_mapping(32778, 14, (0 << 0), "start");
                __set_mapping(32785, 0, (1 << 0), "leftx");
                __set_mapping(32787, 2, (1 << 0), "rightx");
                __set_mapping(32775, 0, undefined, "lefttrigger");
                __set_mapping(32776, 0, undefined, "righttrigger");
                var _mapping = __set_mapping(32786, 1, (1 << 0), "lefty");
                _mapping.__reverse = true;
                _mapping = __set_mapping(32788, 3, (1 << 0), "righty");
                _mapping.__reverse = true;
                __set_mapping(__input_global().__gp_guide, 12, (0 << 0), "guide");
                exit;
            }
            
            break;
        
        case "CommunityGameCube":
            if (_vendor_and_product == "6f0e1311" && __saffun_axis_test == false)
            {
                __input_trace("Setting Saffun GameCube mapping to GameCube");
                __set_mapping(32772, 0, (0 << 0), "y");
                __set_mapping(32771, 1, (0 << 0), "x");
                __set_mapping(32769, 2, (0 << 0), "a");
                __set_mapping(32770, 3, (0 << 0), "b");
                __set_mapping(32773, 4, (0 << 0), "leftshoulder");
                __set_mapping(32774, 5, (0 << 0), "rightshoulder");
                __set_mapping(32775, 6, (0 << 0), "lefttrigger");
                __set_mapping(32776, 7, (0 << 0), "righttrigger");
                __set_mapping(32777, 8, (0 << 0), "back");
                __set_mapping(32778, 9, (0 << 0), "start");
                __set_dpad_and_thumbstick_mapping();
                __set_mapping(32779, 10, (0 << 0), "leftstick");
                __set_mapping(32780, 11, (0 << 0), "rightstick");
                __set_mapping(__input_global().__gp_guide, 12, (0 << 0), "guide");
                exit;
            }
            
            if (_vendor_and_product == "3412adbe" && true)
            {
                __input_trace("Setting GameCube adapter slot to alternate mapping");
                __set_mapping(32769, 0, (0 << 0), "a");
                __set_mapping(32771, 1, (0 << 0), "x");
                __set_mapping(32770, 2, (0 << 0), "b");
                __set_mapping(32772, 3, (0 << 0), "y");
                __set_mapping(32774, 4, (0 << 0), "rightshoulder");
                __set_mapping(32781, 8, (0 << 0), "dpup");
                __set_mapping(32782, 9, (0 << 0), "dpdown");
                __set_mapping(32783, 10, (0 << 0), "dpleft");
                __set_mapping(32784, 11, (0 << 0), "dpright");
                __set_thumbstick_axis_mapping(true);
                __set_mapping(32787, 3, (1 << 0), "rightx");
                __set_mapping(32788, 4, (1 << 0), "righty");
                var _mapping = __set_mapping(32775, 2, (1 << 0), "lefttrigger");
                _mapping.__clamp_positive = true;
                _mapping = __set_mapping(32776, 5, (1 << 0), "righttrigger");
                _mapping.__clamp_positive = true;
                exit;
            }
            
            break;
        
        case "CommunityN64":
            if (__guessed_type)
                break;
            
            switch (_vendor_and_product)
            {
                case "8f0e1330":
                    break;
                
                case "63257505":
                    __input_trace("Overriding mapping to N64");
                    __set_mapping(32769, 1, (0 << 0), "a");
                    __set_mapping(32770, 2, (0 << 0), "b");
                    __set_mapping(32778, 12, (0 << 0), "start");
                    __set_mapping(32773, 4, (0 << 0), "leftshoulder");
                    __set_mapping(32774, 5, (0 << 0), "rightshoulder");
                    __set_mapping(32775, 6, (0 << 0), "lefttrigger");
                    __set_mapping(32776, 7, (0 << 0), "righttrigger");
                    __set_dpad_hat_mapping();
                    __set_thumbstick_axis_mapping(true);
                    var _mapping = __set_mapping(32787, undefined, (4 << 0), "rightx");
                    _mapping.__raw_negative = 3;
                    _mapping.__raw_positive = 8;
                    _mapping = __set_mapping(32788, undefined, (4 << 0), "righty");
                    _mapping.__raw_negative = 9;
                    _mapping.__raw_positive = 0;
                    exit;
                    break;
                
                case "6f0e1311":
                    if (__saffun_axis_test == true)
                    {
                        __input_trace("Overriding mapping to N64");
                        __set_mapping(32769, 2, (0 << 0), "a");
                        __set_mapping(32770, 1, (0 << 0), "b");
                        __set_mapping(32777, 8, (0 << 0), "back");
                        __set_mapping(32778, 9, (0 << 0), "start");
                        __set_mapping(__input_global().__gp_guide, 12, (0 << 0), "guide");
                        __set_mapping(32773, 4, (0 << 0), "leftshoulder");
                        __set_mapping(32774, 5, (0 << 0), "rightshoulder");
                        __set_mapping(32775, 6, (0 << 0), "lefttrigger");
                        __set_mapping(32776, 7, (0 << 0), "righttrigger");
                        __set_dpad_hat_mapping();
                        __set_thumbstick_axis_mapping(true);
                        var _mapping = __set_mapping(32787, undefined, (4 << 0), "rightx");
                        _mapping.__raw_negative = 0;
                        _mapping.__raw_positive = 10;
                        _mapping = __set_mapping(32788, undefined, (4 << 0), "righty");
                        _mapping.__raw_negative = 11;
                        _mapping.__raw_positive = 3;
                        exit;
                    }
                    
                    break;
            }
            
            break;
        
        case "CommunityAnnePro":
            if (__input_global().__on_desktop)
            {
                __input_trace("Overriding mapping to Obins Anne Pro 2");
                var _mapping = __set_mapping(32775, 0, (1 << 0), "lefttrigger");
                _mapping.__extended_range = true;
                _mapping = __set_mapping(32776, 1, (1 << 0), "righttrigger");
                _mapping.__extended_range = true;
                __set_mapping(32785, 3, (1 << 0), "leftx");
                __set_mapping(32773, 0, (0 << 0), "leftshoulder");
                __set_mapping(32777, 1, (0 << 0), "back");
                __set_mapping(32783, 2, (0 << 0), "dpleft");
                __set_mapping(32781, 3, (0 << 0), "dpup");
                __set_mapping(32782, 4, (0 << 0), "dpdown");
                __set_mapping(32784, 5, (0 << 0), "dpright");
                __set_mapping(32774, 6, (0 << 0), "rightshoulder");
                __set_mapping(32778, 7, (0 << 0), "start");
                __set_mapping(32770, 8, (0 << 0), "b");
                __set_mapping(32772, 9, (0 << 0), "y");
                __set_mapping(32769, 10, (0 << 0), "a");
                __set_mapping(32771, 11, (0 << 0), "x");
                exit;
            }
            
            break;
        
        case "CommunityOuya":
            break;
        
        case "CommunityNeoGeoMini":
            if (_vendor_and_product == "bc200155")
            {
                if (__input_string_contains(gamepad_get_description(__index), "JJ"))
                {
                    __input_trace("Overriding mapping to NeoGeo Arcade Stick Pro (Mode 1)");
                    __set_mapping(32771, 0, (0 << 0), "x");
                    __set_mapping(32769, 1, (0 << 0), "a");
                    __set_mapping(32774, 2, (0 << 0), "rightshoulder");
                    __set_mapping(32772, 3, (0 << 0), "y");
                    __set_mapping(32770, 4, (0 << 0), "b");
                    __set_mapping(32776, 5, (0 << 0), "righttrigger");
                    __set_mapping(__input_global().__gp_guide, 9, (0 << 0), "guide");
                }
                else
                {
                    __input_trace("Overriding mapping to NeoGeo Arcade Stick Pro (Mode 3)");
                    __set_mapping(32769, 0, (0 << 0), "a");
                    __set_mapping(32770, 1, (0 << 0), "b");
                    __set_mapping(32776, 2, (0 << 0), "righttrigger");
                    __set_mapping(32771, 3, (0 << 0), "x");
                    __set_mapping(32772, 4, (0 << 0), "y");
                    __set_mapping(32774, 5, (0 << 0), "rightshoulder");
                }
                
                __set_mapping(32773, 6, (0 << 0), "leftshoulder");
                __set_mapping(32775, 7, (0 << 0), "lefttrigger");
                __set_mapping(32777, 10, (0 << 0), "back");
                __set_mapping(32778, 11, (0 << 0), "start");
                __set_dpad_hat_mapping();
                exit;
            }
            
            if (_vendor_and_product == "63257505" && !__guessed_type && true)
            {
                __input_trace("Overriding mapping to NeoGeo Mini");
                __set_mapping(32769, 1, (0 << 0), "a");
                __set_mapping(32770, 0, (0 << 0), "b");
                __set_mapping(32771, 2, (0 << 0), "x");
                __set_mapping(32772, 3, (0 << 0), "y");
                __set_mapping(32777, 8, (0 << 0), "back");
                __set_mapping(32778, 9, (0 << 0), "start");
                __set_dpad_hat_mapping();
                exit;
            }
            
            break;
        
        case "CommunitySaturn":
            if (!__guessed_type && false && _vendor_and_product == "7e051720")
            {
                if (__input_string_contains(__description, "Genesis 3btn"))
                {
                    __input_trace("Overriding mapping to Mega Drive 3b");
                    __set_mapping(32769, 1, (0 << 0), "a");
                    __set_mapping(32770, 0, (0 << 0), "b");
                    __set_mapping(32776, 5, (0 << 0), "righttrigger");
                    __set_mapping(32777, 7, (0 << 0), "back");
                    __set_mapping(32778, 9, (0 << 0), "start");
                    __set_dpad_hat_mapping();
                    __set_mapping(__input_global().__gp_guide, 12, (0 << 0), "guide");
                    exit;
                }
                else if (__input_string_contains(__description, "Genesis 6btn"))
                {
                    __input_trace("Overriding mapping to Mega Drive 6b");
                    __set_mapping(32769, 1, (0 << 0), "a");
                    __set_mapping(32770, 0, (0 << 0), "b");
                    __set_mapping(32771, 6, (0 << 0), "x");
                    __set_mapping(32772, 2, (0 << 0), "y");
                    __set_mapping(32774, 4, (0 << 0), "rightshoulder");
                    __set_mapping(32776, 5, (0 << 0), "righttrigger");
                    __set_mapping(32777, 7, (0 << 0), "back");
                    __set_mapping(32778, 9, (0 << 0), "start");
                    __set_dpad_hat_mapping();
                    __set_mapping(__input_global().__gp_guide, 12, (0 << 0), "guide");
                    exit;
                }
            }
            
            break;
        
        case "HIDJoyConLeft":
            __input_trace("Overriding mapping to Joy-Con Left");
            __set_mapping(32769, 9, (0 << 0), "a");
            __set_mapping(32770, 8, (0 << 0), "b");
            __set_mapping(32771, 7, (0 << 0), "x");
            __set_mapping(32772, 10, (0 << 0), "y");
            __set_mapping(32773, 2, (0 << 0), "leftshoulder");
            __set_mapping(32774, 4, (0 << 0), "rightshoulder");
            __set_mapping(32777, 5, (0 << 0), "back");
            __set_mapping(32778, 0, (0 << 0), "start");
            __set_mapping(32779, 6, (0 << 0), "leftstick");
            var _mapping = __set_mapping(32785, 1, (1 << 0), "leftx");
            _mapping.__limited_range = true;
            _mapping = __set_mapping(32786, 0, (1 << 0), "lefty");
            _mapping.__limited_range = true;
            _mapping.__reverse = true;
            exit;
            break;
        
        case "HIDJoyConRight":
            __input_trace("Overriding mapping to Joy-Con Right");
            __set_mapping(32769, 1, (0 << 0), "a");
            __set_mapping(32770, 2, (0 << 0), "b");
            __set_mapping(32771, 0, (0 << 0), "x");
            __set_mapping(32772, 3, (0 << 0), "y");
            __set_mapping(32777, 9, (0 << 0), "back");
            __set_mapping(32778, 8, (0 << 0), "start");
            __set_mapping(32773, 4, (0 << 0), "leftshoulder");
            __set_mapping(32774, 6, (0 << 0), "rightshoulder");
            __set_mapping(32779, 10, (0 << 0), "leftstick");
            var _mapping = __set_mapping(32785, 1, (1 << 0), "leftx");
            _mapping.__limited_range = true;
            _mapping.__reverse = true;
            _mapping = __set_mapping(32786, 0, (1 << 0), "lefty");
            _mapping.__limited_range = true;
            exit;
            break;
        
        case "HIDAtariVCSClassic":
            __input_trace("Overriding mapping to Atari VCS Classic");
            __set_mapping(32769, 0, (0 << 0), "a");
            __set_mapping(32770, 1, (0 << 0), "b");
            __set_mapping(32777, 2, (0 << 0), "back");
            __set_mapping(32778, 3, (0 << 0), "start");
            __set_dpad_hat_mapping();
            __set_mapping(__input_global().__gp_guide, 4, (0 << 0), "guide");
            exit;
            break;
        
        case "HIDWiiRemote":
            __input_trace("Overriding mapping to Wii Remote");
            __set_mapping(32783, 5, (0 << 0), "dpleft");
            __set_mapping(32782, 6, (0 << 0), "dpdown");
            __set_mapping(32781, 7, (0 << 0), "dpup");
            __set_mapping(32784, 8, (0 << 0), "dpright");
            __set_mapping(32769, 9, (0 << 0), "a");
            __set_mapping(32770, 10, (0 << 0), "b");
            __set_mapping(32773, 0, (0 << 0), "leftshoulder");
            __set_mapping(32775, 1, (0 << 0), "lefttrigger");
            __set_mapping(32777, 4, (0 << 0), "back");
            __set_mapping(32778, 3, (0 << 0), "start");
            __set_mapping(__input_global().__gp_guide, 2, (0 << 0), "guide");
            exit;
            break;
        
        case "HIDWiiClassic":
            __input_trace("Overriding mapping to Wii Classic");
            __set_mapping(32781, 11, (0 << 0), "dpup");
            __set_mapping(32783, 12, (0 << 0), "dpleft");
            __set_mapping(32782, 14, (0 << 0), "dpdown");
            __set_mapping(32784, 13, (0 << 0), "dpright");
            __set_mapping(32769, 1, (0 << 0), "a");
            __set_mapping(32770, 0, (0 << 0), "b");
            __set_mapping(32771, 3, (0 << 0), "x");
            __set_mapping(32772, 2, (0 << 0), "y");
            __set_mapping(32773, 4, (0 << 0), "leftshoulder");
            __set_mapping(32774, 5, (0 << 0), "rightshoulder");
            __set_mapping(32775, 6, (0 << 0), "lefttrigger");
            __set_mapping(32776, 7, (0 << 0), "righttrigger");
            __set_mapping(32777, 10, (0 << 0), "back");
            __set_mapping(32778, 9, (0 << 0), "start");
            __set_mapping(__input_global().__gp_guide, 8, (0 << 0), "guide");
            exit;
            break;
        
        case "CommunityLikeSwitch":
            if (_vendor_and_product == "00000000" && true)
            {
                __input_trace("Setting PowerA Switch controller mapping");
                __set_face_button_mapping();
                __set_dpad_and_thumbstick_mapping();
                __set_mapping(32773, 4, (0 << 0), "leftshoulder");
                __set_mapping(32774, 5, (0 << 0), "rightshoulder");
                __set_mapping(32775, 6, (0 << 0), "lefttrigger");
                __set_mapping(32776, 7, (0 << 0), "righttrigger");
                __set_mapping(32777, 8, (0 << 0), "back");
                __set_mapping(32778, 9, (0 << 0), "start");
                __set_mapping(__input_global().__gp_guide, 12, (0 << 0), "guide");
                __set_mapping(__input_global().__gp_misc1, 13, (0 << 0), "misc1");
                __set_mapping(32779, 10, (0 << 0), "leftstick");
                __set_mapping(32780, 11, (0 << 0), "rightstick");
                exit;
            }
        
        case "SwitchJoyConPair":
            break;
        
        case "SwitchJoyConLeft":
        case "SwitchJoyConRight":
            break;
    }
    
    switch (0)
    {
        case 0:
            if (_vendor_and_product == "5e04e002" || (_vendor_and_product == "5e04fd02" && gamepad_axis_value(__index, 1) == gamepad_axis_value(__index, 2) && gamepad_axis_value(__index, 4) == gamepad_axis_value(__index, 5) && __button_count == 17))
            {
                __input_trace("Setting Xbox One Wireless controller to alternate mapping. Trigger data unavailable.");
                __set_mapping(32769, 0, (0 << 0), "a");
                __set_mapping(32770, 1, (0 << 0), "b");
                __set_mapping(32771, 3, (0 << 0), "x");
                __set_mapping(32772, 4, (0 << 0), "y");
                __set_mapping(32773, 6, (0 << 0), "leftshoulder");
                __set_mapping(32774, 7, (0 << 0), "rightshoulder");
                __set_mapping(32777, 15, (0 << 0), "back");
                __set_mapping(32778, 11, (0 << 0), "start");
                __set_mapping(32779, 13, (0 << 0), "leftstick");
                __set_mapping(32780, 14, (0 << 0), "rightstick");
                __set_thumbstick_axis_mapping(true);
                __set_mapping(32787, 3, (1 << 0), "rightx");
                __set_mapping(32788, 4, (1 << 0), "righty");
                __set_dpad_hat_mapping();
                __set_mapping(32775, 0, undefined, "lefttrigger");
                __set_mapping(32776, 0, undefined, "righttrigger");
                __set_mapping(__input_global().__gp_guide, 16, (0 << 0), "guide");
                exit;
            }
            
            if (_vendor_and_product == "4c056802" && __button_count == 36 && __axis_count == 2 && __hat_count == 0)
            {
                __input_trace("Overriding PS3 Controller on Windows");
                __set_mapping(32777, 0, (0 << 0), "back");
                __set_mapping(32779, 1, (0 << 0), "leftstick");
                __set_mapping(32780, 2, (0 << 0), "rightstick");
                __set_mapping(32778, 3, (0 << 0), "start");
                __set_mapping(32781, 4, (0 << 0), "dpup");
                __set_mapping(32784, 5, (0 << 0), "dpright");
                __set_mapping(32782, 6, (0 << 0), "dpdown");
                __set_mapping(32783, 7, (0 << 0), "dpleft");
                __set_mapping(32775, 8, (0 << 0), "lefttrigger");
                __set_mapping(32776, 9, (0 << 0), "righttrigger");
                __set_mapping(32773, 10, (0 << 0), "leftshoulder");
                __set_mapping(32774, 11, (0 << 0), "rightshoulder");
                __set_mapping(32772, 12, (0 << 0), "y");
                __set_mapping(32770, 13, (0 << 0), "b");
                __set_mapping(32769, 14, (0 << 0), "a");
                __set_mapping(32771, 15, (0 << 0), "x");
                __set_thumbstick_axis_mapping();
                __set_mapping(__input_global().__gp_guide, 16, (0 << 0), "guide");
                exit;
            }
            
            break;
        
        case 1:
            if (__mapping == "no mapping" && __button_count == 22 && __axis_count == 6 && __hat_count == 0)
            {
                __input_trace("Overriding from \"no mapping\" on Mac");
                __set_mapping(32769, 17, (0 << 0), "a");
                __set_mapping(32770, 18, (0 << 0), "b");
                __set_mapping(32771, 20, (0 << 0), "x");
                __set_mapping(32772, 21, (0 << 0), "y");
                __set_mapping(32779, 4, (0 << 0), "leftstick");
                __set_mapping(32780, 5, (0 << 0), "rightstick");
                __set_mapping(32776, 6, (0 << 0), "righttrigger");
                __set_mapping(32775, 7, (0 << 0), "lefttrigger");
                __set_mapping(32777, 8, (0 << 0), "back");
                __set_mapping(32778, 10, (0 << 0), "start");
                __set_mapping(32773, 13, (0 << 0), "leftshoulder");
                __set_mapping(32774, 14, (0 << 0), "rightshoulder");
                __set_thumbstick_axis_mapping();
                __set_mapping(__input_global().__gp_guide, 11, (0 << 0), "guide");
                __set_mapping(__input_global().__gp_misc1, 16, (0 << 0), "misc1");
                exit;
            }
            
            break;
        
        case 6:
            if (__guid == "03000000de2800000512000010010000")
            {
                __input_trace("Overriding mapping for Steam Deck controller");
                __set_mapping(__input_global().__gp_misc1, 2, (0 << 0), "misc1");
                __set_mapping(32769, 3, (0 << 0), "a");
                __set_mapping(32770, 4, (0 << 0), "b");
                __set_mapping(32771, 5, (0 << 0), "x");
                __set_mapping(32772, 6, (0 << 0), "y");
                __set_mapping(32773, 7, (0 << 0), "leftshoulder");
                __set_mapping(32774, 8, (0 << 0), "rightshoulder");
                __set_mapping(32775, 9, (0 << 0), "lefttrigger");
                __set_mapping(32776, 10, (0 << 0), "righttrigger");
                __set_mapping(32777, 11, (0 << 0), "back");
                __set_mapping(32778, 12, (0 << 0), "start");
                __set_mapping(__input_global().__gp_guide, 13, (0 << 0), "guide");
                __set_mapping(32779, 14, (0 << 0), "leftstick");
                __set_mapping(32780, 15, (0 << 0), "rightstick");
                __set_mapping(32781, 16, (0 << 0), "dpup");
                __set_mapping(32782, 17, (0 << 0), "dpdown");
                __set_mapping(32783, 18, (0 << 0), "dpleft");
                __set_mapping(32784, 19, (0 << 0), "dpright");
                __set_mapping(__input_global().__gp_paddle2, 20, (0 << 0), "paddle2");
                __set_mapping(__input_global().__gp_paddle1, 21, (0 << 0), "paddle1");
                __set_mapping(__input_global().__gp_paddle4, 22, (0 << 0), "paddle4");
                __set_mapping(__input_global().__gp_paddle3, 23, (0 << 0), "paddle3");
                __set_thumbstick_axis_mapping();
                exit;
            }
            
            if (__description == "Generic X-Box pad" || __description == "X360 Controller")
            {
                __input_trace("Overriding mapping for Xbox controller");
                __set_face_button_mapping();
                __set_dpad_hat_mapping();
                __set_mapping(32773, 4, (0 << 0), "leftshoulder");
                __set_mapping(32774, 5, (0 << 0), "rightshoulder");
                __set_mapping(gp_back, 6, (0 << 0), "back");
                __set_mapping(32778, 7, (0 << 0), "start");
                __set_mapping(__input_global().__gp_guide, 8, (0 << 0), "guide");
                __set_mapping(32779, 9, (0 << 0), "leftstick");
                __set_mapping(32780, 10, (0 << 0), "rightstick");
                __set_mapping(32775, 2, (1 << 0), "lefttrigger");
                __set_mapping(32776, 5, (1 << 0), "righttrigger");
                __set_mapping(32785, 0, (1 << 0), "leftx");
                __set_mapping(32786, 1, (1 << 0), "lefty");
                __set_mapping(32787, 3, (1 << 0), "rightx");
                __set_mapping(32788, 4, (1 << 0), "righty");
                exit;
            }
            
            if (__guid == "0500000049190000020400001b010000" && gamepad_get_description(__index) == "xbox Wireless Controller")
            {
                __set_mapping(32769, 0, (0 << 0), "a");
                __set_mapping(32770, 1, (0 << 0), "b");
                __set_mapping(32771, 2, (0 << 0), "x");
                __set_mapping(32772, 3, (0 << 0), "y");
                __set_mapping(32773, 4, (0 << 0), "leftshoulder");
                __set_mapping(32774, 5, (0 << 0), "rightshoulder");
                __set_mapping(32777, 6, (0 << 0), "back");
                __set_mapping(32778, 7, (0 << 0), "start");
                __set_dpad_hat_mapping();
                exit;
            }
            
            break;
        
        case 4:
            switch (__guid)
            {
                case "4e696e74656e646f2053776974636820":
                    if (__description == "Nintendo Switch Pro Controller")
                    {
                        __set_face_button_mapping();
                        __set_dpad_and_thumbstick_mapping();
                        __set_mapping(32773, 9, (0 << 0), "leftshoulder");
                        __set_mapping(32774, 10, (0 << 0), "rightshoulder");
                        __set_mapping(32775, 17, (0 << 0), "lefttrigger");
                        __set_mapping(32776, 18, (0 << 0), "righttrigger");
                        __set_mapping(32779, 7, (0 << 0), "leftstick");
                        __set_mapping(32780, 8, (0 << 0), "rightstick");
                        __set_mapping(32777, 14, (0 << 0), "back");
                        __set_mapping(32778, 6, (0 << 0), "start");
                        __set_mapping(__input_global().__gp_misc1, 5, (0 << 0), "misc1");
                        exit;
                    }
                    
                    if (__description == "Nintendo Switch Right Joy-Con")
                    {
                        __set_mapping(32769, 1, (0 << 0), "a");
                        __set_mapping(32770, 2, (0 << 0), "b");
                        __set_mapping(32771, 0, (0 << 0), "x");
                        __set_mapping(32772, 3, (0 << 0), "y");
                        __set_mapping(32773, 9, (0 << 0), "leftshoulder");
                        __set_mapping(32774, 17, (0 << 0), "rightshoulder");
                        __set_mapping(32777, 5, (0 << 0), "back");
                        __set_mapping(32778, 6, (0 << 0), "start");
                        __set_mapping(32779, 8, (0 << 0), "leftstick");
                        __set_mapping(32786, 0, (1 << 0), "lefty");
                        var _mapping = __set_mapping(32785, 1, (1 << 0), "leftx");
                        _mapping.__reverse = true;
                        exit;
                    }
                    
                    break;
                
                case "484a5a204d6179666c61736820576969":
                    if (__description == "HJZ Mayflash WiiU Pro Game Controller Adapter")
                    {
                        __input_trace("Setting WiiU Pro Adapter mapping");
                        __set_mapping(32771, 21, (0 << 0), "x");
                        __set_mapping(32769, 22, (0 << 0), "a");
                        __set_mapping(32770, 23, (0 << 0), "b");
                        __set_mapping(32772, 24, (0 << 0), "y");
                        __set_mapping(32773, 25, (0 << 0), "leftshoulder");
                        __set_mapping(32774, 26, (0 << 0), "rightshoulder");
                        __set_mapping(32775, 27, (0 << 0), "lefttrigger");
                        __set_mapping(32776, 28, (0 << 0), "righttrigger");
                        __set_mapping(32777, 29, (0 << 0), "back");
                        __set_mapping(32778, 30, (0 << 0), "start");
                        __set_mapping(32779, 31, (0 << 0), "leftstick");
                        __set_mapping(32780, 0, (0 << 0), "rightstick");
                        __set_dpad_and_thumbstick_mapping();
                        exit;
                    }
                    
                    if (__description == "HJZ Mayflash Wiimote PC Adapter")
                    {
                        __input_trace("Setting DolphinBar mapping");
                        __set_mapping(32771, 21, (0 << 0), "x");
                        __set_mapping(32772, 22, (0 << 0), "y");
                        __set_mapping(32769, 23, (0 << 0), "a");
                        __set_mapping(32770, 24, (0 << 0), "b");
                        __set_mapping(32773, 25, (0 << 0), "leftshoulder");
                        __set_mapping(32774, 26, (0 << 0), "rightshoulder");
                        __set_mapping(32775, 27, (0 << 0), "lefttrigger");
                        __set_mapping(32776, 28, (0 << 0), "righttrigger");
                        __set_mapping(32777, 29, (0 << 0), "back");
                        __set_mapping(32778, 30, (0 << 0), "start");
                        __set_dpad_and_thumbstick_mapping();
                        __set_mapping(__input_global().__gp_guide, 0, (0 << 0), "guide");
                        exit;
                    }
                    
                    break;
                
                case "64633735616665613536653363336132":
                    if (__description == "Retroid Pocket Controller")
                    {
                        __input_trace("Setting Retroid Pocket \"Retro mode\" mapping");
                        __set_mapping(32770, 0, (0 << 0), "b");
                        __set_mapping(32769, 1, (0 << 0), "a");
                        __set_mapping(32772, 2, (0 << 0), "y");
                        __set_mapping(32771, 3, (0 << 0), "x");
                    }
                    else
                    {
                        __input_trace("Setting Retroid Pocket \"Xbox mode\" mapping");
                        __set_face_button_mapping();
                    }
                    
                    __set_mapping(32778, 6, (0 << 0), "start");
                    __set_mapping(32779, 7, (0 << 0), "leftstick");
                    __set_mapping(32780, 8, (0 << 0), "rightstick");
                    __set_mapping(32773, 9, (0 << 0), "leftshoulder");
                    __set_mapping(32774, 10, (0 << 0), "rightshoulder");
                    __set_mapping(32777, 15, (0 << 0), "back");
                    __set_dpad_and_thumbstick_mapping();
                    var _mapping = __set_mapping(32775, 4, (1 << 0), "lefttrigger");
                    _mapping.__extended_range = true;
                    _mapping = __set_mapping(32776, 5, (1 << 0), "righttrigger");
                    _mapping.__extended_range = true;
                    __set_mapping(__input_global().__gp_paddle1, 19, (0 << 0), "paddle1");
                    __set_mapping(__input_global().__gp_paddle2, 20, (0 << 0), "paddle2");
                    exit;
                    break;
                
                case "4a4a0000000000006d61743300000000":
                case "4a4a0000000000000000000000000000":
                    __input_trace("Setting NeoGeo gamepad mapping");
                    __set_face_button_mapping();
                    __set_dpad_hat_mapping();
                    __set_mapping(32773, 9, (0 << 0), "leftshoulder");
                    __set_mapping(32774, 10, (0 << 0), "rightshoulder");
                    __set_mapping(32777, 15, (0 << 0), "back");
                    __set_mapping(32778, 6, (0 << 0), "start");
                    exit;
                    break;
            }
            
            break;
    }
    
    if ((1 && (__input_global().__on_desktop || false)) && true)
    {
        if (is_array(__sdl2_definition))
        {
            var _i = 2;
            
            repeat (array_length(__sdl2_definition) - 2)
            {
                var _entry = __sdl2_definition[_i];
                var _pos = string_pos(":", _entry);
                var _entry_name = string_copy(_entry, 1, _pos - 1);
                var _entry_1 = string_delete(_entry, 1, _pos);
                var _output_negative = false;
                var _output_positive = false;
                
                if (string_char_at(_entry_name, 1) == "-")
                {
                    _output_negative = true;
                    _entry_name = string_delete(_entry_name, 1, 1);
                }
                else if (string_char_at(_entry_name, 1) == "+")
                {
                    _output_positive = true;
                    _entry_name = string_delete(_entry_name, 1, 1);
                }
                
                var _gm_constant = variable_struct_get(_global.__sdl2_look_up_table, _entry_name);
                
                if (_gm_constant == undefined)
                {
                    if (_entry_name != "platform")
                        __input_trace("Warning! Entry name \"", _entry_name, "\" not recognised (full string was \"", _entry, "\")");
                }
                else
                {
                    var _input_invert = false;
                    var _input_reverse = false;
                    var _input_negative = false;
                    var _input_positive = false;
                    
                    if (string_char_at(_entry_1, string_length(_entry_1)) == "~")
                    {
                        _entry_1 = string_delete(_entry_1, string_length(_entry_1), 1);
                        
                        if (_gm_constant == 32785 || _gm_constant == 32786 || _gm_constant == 32787 || _gm_constant == 32788)
                            _input_reverse = true;
                        else
                            _input_invert = true;
                    }
                    
                    var _raw_type = undefined;
                    
                    do
                    {
                        var _char = string_char_at(_entry_1, 1);
                        _entry_1 = string_delete(_entry_1, 1, 1);
                        
                        switch (_char)
                        {
                            case "-":
                                _input_negative = true;
                                break;
                            
                            case "+":
                                _input_positive = true;
                                break;
                            
                            case "b":
                                if (_output_negative || _output_positive)
                                    _raw_type = (4 << 0);
                                else
                                    _raw_type = (0 << 0);
                                
                                break;
                            
                            case "a":
                                if (_output_negative || _output_positive)
                                    _raw_type = (5 << 0);
                                else
                                    _raw_type = (1 << 0);
                                
                                break;
                            
                            case "h":
                                if (_output_negative || _output_positive)
                                    _raw_type = (3 << 0);
                                else
                                    _raw_type = (2 << 0);
                                
                                break;
                            
                            default:
                                __input_trace("Warning! Mapping entry could not be parsed (full string was \"", _entry, "\")");
                                break;
                        }
                    }
                    until (_raw_type != undefined);
                    
                    var _input_slot = floor(real(_entry_1));
                    var _mapping = variable_struct_get(__mapping_gm_to_raw, _gm_constant);
                    
                    if (_raw_type == (3 << 0))
                    {
                        if (_mapping == undefined)
                            _mapping = __set_mapping(_gm_constant, undefined, _raw_type, _entry_name);
                        
                        if (_output_negative)
                            _mapping.__raw_negative = _input_slot;
                        else if (_output_positive)
                            _mapping.__raw_positive = _input_slot;
                    }
                    else if (_raw_type == (5 << 0))
                    {
                        if (_mapping == undefined)
                            _mapping = __set_mapping(_gm_constant, undefined, _raw_type, _entry_name);
                        
                        if (_output_negative)
                        {
                            _mapping.__raw_negative = _input_slot;
                            
                            if (_input_negative)
                                _mapping.__negative_clamp_negative = true;
                            
                            if (_input_positive)
                                _mapping.__negative_clamp_positive = true;
                        }
                        else if (_output_positive)
                        {
                            _mapping.__raw_positive = _input_slot;
                            
                            if (_input_negative)
                                _mapping.__positive_clamp_negative = true;
                            
                            if (_input_positive)
                                _mapping.__positive_clamp_positive = true;
                        }
                    }
                    else if (_raw_type == (4 << 0))
                    {
                        if (_mapping == undefined)
                            _mapping = __set_mapping(_gm_constant, undefined, _raw_type, _entry_name);
                        
                        if (_output_negative)
                            _mapping.__raw_negative = _input_slot;
                        else if (_output_positive)
                            _mapping.__raw_positive = _input_slot;
                    }
                    else
                    {
                        if (_mapping == undefined)
                            _mapping = __set_mapping(_gm_constant, _input_slot, _raw_type, _entry_name);
                        else
                            __input_trace("Warning! Mapping for \"", _entry, "\" is a redefinition of entry name \"", _entry_name, "\"");
                        
                        if (_input_invert)
                            _mapping.__invert = true;
                        
                        if (_input_reverse)
                            _mapping.__reverse = true;
                        
                        if (_input_negative)
                            _mapping.__clamp_negative = true;
                        
                        if (_input_positive)
                            _mapping.__clamp_positive = true;
                    }
                    
                    if (_raw_type == (2 << 0) || _raw_type == (3 << 0))
                    {
                        var _hat_mask = floor(10 * abs(real(_entry_1) % 1));
                        
                        if (_raw_type == (2 << 0))
                        {
                            _mapping.__hat_mask = _hat_mask;
                        }
                        else if (_raw_type == (3 << 0))
                        {
                            if (_output_negative)
                                _mapping.__hat_mask_negative = _hat_mask;
                            else if (_output_positive)
                                _mapping.__hat_mask_positive = _hat_mask;
                        }
                    }
                    
                    if (_raw_type == (1 << 0) || _raw_type == (5 << 0))
                    {
                        var _is_directional = __input_axis_is_directional(_gm_constant);
                        
                        if (false && _is_directional)
                            _mapping.__limited_range = true;
                        else if (1 && !_is_directional && gamepad_axis_count(__index) >= _input_slot)
                            _mapping.__extended_range = true;
                    }
                }
                
                _i++;
            }
            
            if (false && __hat_count > 0 && _vendor_and_product == "")
            {
                var _mapping = undefined;
                var _dpad_array = [32781, 32782, 32783, 32784];
                var _matched = 0;
                
                repeat (array_length(_dpad_array))
                {
                    _mapping = variable_struct_get(__mapping_gm_to_raw, array_get(_dpad_array, _matched));
                    
                    if (!is_struct(_mapping) || struct_get_from_hash(_mapping, variable_get_hash("__raw")) != (11 + _matched))
                        break;
                    
                    _matched++;
                }
                
                if (_matched == 4)
                    __set_dpad_hat_mapping();
            }
            
            if (__raw_type == "CommunityOuya" && true)
                __set_mapping(__input_global().__gp_guide, 15, (0 << 0), "guide");
            
            if (__simple_type == "xbox one" && __input_string_contains(__description, "Elite") && is_struct(variable_struct_get(__mapping_gm_to_raw, string(__input_global().__gp_paddle2))) && is_struct(variable_struct_get(__mapping_gm_to_raw, string(__input_global().__gp_paddle3))))
            {
                var _p2_mapping = variable_struct_get(__mapping_gm_to_raw, string(__input_global().__gp_paddle2)).__raw;
                __set_mapping(__input_global().__gp_paddle2, variable_struct_get(__mapping_gm_to_raw, string(__input_global().__gp_paddle3)).__raw, (0 << 0), "paddle2");
                __set_mapping(__input_global().__gp_paddle3, _p2_mapping, (0 << 0), "paddle3");
            }
            
            exit;
        }
        else
        {
            __input_trace("No SDL2 remapping available, falling back to GameMaker's mapping (", __mapping, ")");
        }
    }
    
    __set_mapping(32769, 32769, (0 << 0), "a", false);
    __set_mapping(32770, 32770, (0 << 0), "b", false);
    __set_mapping(32771, 32771, (0 << 0), "x", false);
    __set_mapping(32772, 32772, (0 << 0), "y", false);
    __set_mapping(32773, 32773, (0 << 0), "leftshoulder", false);
    __set_mapping(32774, 32774, (0 << 0), "rightshoulder", false);
    __set_mapping(32778, 32778, (0 << 0), "start", false);
    __set_mapping(32781, 32781, (0 << 0), "dpup", false);
    __set_mapping(32782, 32782, (0 << 0), "dpdown", false);
    __set_mapping(32783, 32783, (0 << 0), "dpleft", false);
    __set_mapping(32784, 32784, (0 << 0), "dpright", false);
    __set_mapping(32785, 32785, (1 << 0), "leftx", false);
    __set_mapping(32786, 32786, (1 << 0), "lefty", false);
    __set_mapping(32779, 32779, (0 << 0), "leftstick", false);
    __set_mapping(32787, 32787, (1 << 0), "rightx", false);
    __set_mapping(32788, 32788, (1 << 0), "righty", false);
    __set_mapping(32780, 32780, (0 << 0), "rightstick", false);
    __set_mapping(32775, 32775, (1 << 0), "lefttrigger", false);
    __set_mapping(32776, 32776, (1 << 0), "righttrigger", false);
    __set_mapping(32777, 32777, (0 << 0), "back", false);
    exit;
}
