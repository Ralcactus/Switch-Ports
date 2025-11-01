function __input_class_trigger_effect_vibration(arg0, arg1, arg2) constructor
{
    static __mode_name = "vibration";
    static __mode = (3 << 0);
    
    static __apply_ps5 = function(arg0, arg1, arg2)
    {
        return ps5_gamepad_set_trigger_effect_vibration(arg0, arg1, struct_get_from_hash(__params, variable_get_hash("position")), struct_get_from_hash(__params, variable_get_hash("amplitude")) * arg2, struct_get_from_hash(__params, variable_get_hash("frequency")));
    };
    
    static __steam_get_state = function(arg0, arg1)
    {
        if (input_gamepad_value(arg0, arg1) >= (struct_get_from_hash(__params, variable_get_hash("position")) / 10))
            return (7 << 0);
        
        return (6 << 0);
    };
    
    __params = {};
    __params.position = clamp(arg0 * 10, 0, 9);
    __params.amplitude = clamp(arg1 * 8, 0, 8);
    __params.frequency = clamp(arg2 * 255, 0, 255);
}
