function __input_class_trigger_effect_off() constructor
{
    static __mode_name = "off";
    static __mode = (0 << 0);
    
    static __steam_get_state = function(arg0, arg1)
    {
        return (0 << 0);
    };
    
    static __apply_ps5 = function(arg0, arg1, arg2)
    {
        return ps5_gamepad_set_trigger_effect_off(arg0, arg1);
    };
    
    __params = {};
}
