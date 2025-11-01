function __input_class_vibration_constant(arg0, arg1, arg2, arg3) constructor
{
    static __tick = function(arg0)
    {
        __time += arg0;
        return __time < __duration;
    };
    
    __force = arg3;
    __output_left = arg0 * clamp(1 - arg1, 0, 1);
    __output_right = arg0 * clamp(1 + arg1, 0, 1);
    __time = 0;
    __duration = arg2;
}
