function __input_class_gamepad_mapping(arg0, arg1, arg2, arg3) constructor
{
    static __global = __input_global();
    
    static __tick = function(arg0, arg1)
    {
        __held_previous = __held;
        
        if (__value_previous != undefined)
            __value_previous = __value;
        
        __value = 0;
        __held = false;
        __press = false;
        __release = false;
        
        if (!arg1)
            exit;
        
        if (__global.__game_input_allowed || (__global.__allow_gamepad_tester && __global.__gamepad_tester_data.__enabled && is_debug_overlay_open()))
        {
            switch (__type)
            {
                case (0 << 0):
                    __value = gamepad_button_check(arg0, __raw);
                    break;
                
                case (1 << 0):
                    __value = gamepad_axis_value(arg0, __raw);
                    break;
                
                case (2 << 0):
                    __value = (gamepad_hat_value(arg0, __raw) & __hat_mask) > 0;
                    break;
                
                case (3 << 0):
                    __value = ((gamepad_hat_value(arg0, __raw_positive) & __hat_mask_positive) > 0) - ((gamepad_hat_value(arg0, __raw_negative) & __hat_mask_negative) > 0);
                    break;
                
                case (4 << 0):
                    var _positive = gamepad_button_check(arg0, __raw_positive);
                    var _negative = gamepad_button_check(arg0, __raw_negative);
                    __value = _positive - _negative;
                    break;
                
                case (5 << 0):
                    var _positive = gamepad_axis_value(arg0, __raw_positive);
                    var _negative = gamepad_axis_value(arg0, __raw_negative);
                    
                    if (__positive_clamp_negative)
                        _positive = clamp(_positive, -1, 0);
                    
                    if (__positive_clamp_positive)
                        _positive = clamp(_positive, 0, 1);
                    
                    if (__negative_clamp_negative)
                        _negative = clamp(_negative, -1, 0);
                    
                    if (__negative_clamp_positive)
                        _negative = clamp(_negative, 0, 1);
                    
                    __value = _positive - _negative;
                    break;
            }
            
            if (__limited_range)
                __value = (2 * __value) - 1;
            
            if (__extended_range)
                __value = 0.5 + (0.5 * __value);
            
            if (__reverse)
                __value = -__value;
            
            if (__clamp_negative)
                __value = clamp(__value, -1, 0);
            
            if (__clamp_positive)
                __value = clamp(__value, 0, 1);
            
            if (__invert)
                __value = 1 - __value;
            
            __value = clamp(__scale * __value, -1, 1);
            
            if (__value_previous == undefined)
                __value_previous = __value;
            
            __value_delta = __value - __value_previous;
            __held = abs(__value) > 0.2;
        }
        
        if (__held_previous != __held)
        {
            if (__held)
                __press = true;
            else
                __release = true;
        }
    };
    
    static __calibrate = function(arg0)
    {
        if (__type != (0 << 0) || __input_axis_is_directional(__gm))
        {
            __value = 0;
            __held = false;
            __press = false;
            __release = false;
            
            if (arg0 || (__value_delta != 0 && abs(__value_delta) != 0.5 && abs(__value_delta) != 1))
            {
                __value_previous = 0;
                __value_delta = 0;
                return true;
            }
            
            __value_delta = 0;
        }
        
        return false;
    };
    
    __gm = arg0;
    __raw = arg1;
    __type = arg2;
    __sdl_name = arg3;
    __invert = false;
    __clamp_negative = false;
    __clamp_positive = false;
    __reverse = false;
    __limited_range = false;
    __extended_range = false;
    __hat_mask = undefined;
    __scale = 1;
    __raw_negative = undefined;
    __raw_positive = undefined;
    __hat_mask_negative = undefined;
    __hat_mask_positive = undefined;
    __positive_clamp_negative = false;
    __positive_clamp_positive = false;
    __negative_clamp_negative = false;
    __negative_clamp_positive = false;
    __held_previous = false;
    __value = 0;
    __held = false;
    __press = false;
    __release = false;
    __value_previous = undefined;
    __value_delta = 0;
}
