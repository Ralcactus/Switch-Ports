function __input_class_trigger_effect_feedback(arg0, arg1) constructor
{
    static __mode_name = "feedback";
    static __mode = (1 << 0);
    
    static __steam_get_state = function(arg0, arg1)
    {
        if (input_gamepad_value(arg0, arg1) >= (struct_get_from_hash(__params, variable_get_hash("position")) / 10))
            return (2 << 0);
        
        return (1 << 0);
    };
    
    static __apply_ps5 = function(arg0, arg1, arg2)
    {
        return ps5_gamepad_set_trigger_effect_feedback(arg0, arg1, struct_get_from_hash(__params, variable_get_hash("position")), struct_get_from_hash(__params, variable_get_hash("strength")) * arg2);
    };
    
    __params = {};
    __params.position = clamp(arg0 * 10, 0, 9);
    __params.strength = clamp(arg1 * 8, 0, 8);
}
