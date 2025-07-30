function __input_gamepad_stop_trigger_effects(argument0)
{
    static _global = __input_global();
    
    if (argument0 == -3)
    {
        var _i = 0;
        
        repeat (array_length(_global.__gamepads))
        {
            __input_gamepad_stop_trigger_effects(_i);
            _i++;
        }
        
        exit;
    }
    
    if (argument0 < 0)
        exit;
    
    with (_global.__gamepads[argument0])
    {
        __trigger_effect_apply(32775, new __input_class_trigger_effect_off(), 0);
        __trigger_effect_apply(32776, new __input_class_trigger_effect_off(), 0);
    }
}
