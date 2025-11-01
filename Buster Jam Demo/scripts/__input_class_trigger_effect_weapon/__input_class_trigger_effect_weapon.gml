function __input_class_trigger_effect_weapon(arg0, arg1, arg2, arg3) constructor
{
    static __mode_name = "weapon";
    static __mode = (2 << 0);
    
    static __apply_ps5 = function(arg0, arg1, arg2)
    {
        return ps5_gamepad_set_trigger_effect_weapon(arg0, arg1, struct_get_from_hash(__params, variable_get_hash("start_position")), struct_get_from_hash(__params, variable_get_hash("end_position")), struct_get_from_hash(__params, variable_get_hash("strength")) * arg2);
    };
    
    static __steam_get_state = function(arg0, arg1)
    {
        var _trigger_value = input_gamepad_value(arg0, arg1);
        
        if (_trigger_value > (min(9.9, struct_get_from_hash(__params, variable_get_hash("end_position")) + 2) / 10))
            return (5 << 0);
        else if (_trigger_value >= (struct_get_from_hash(__params, variable_get_hash("start_position")) / 10))
            return (4 << 0);
        
        return (3 << 0);
    };
    
    __params = {};
    __params.start_position = clamp(arg1 * 10, 2, 7);
    __params.end_position = clamp(arg2 * 10, max(arg2 * 10, arg1 * 10), 8);
    __params.strength = clamp(arg3 * 8, 0, 8);
}
