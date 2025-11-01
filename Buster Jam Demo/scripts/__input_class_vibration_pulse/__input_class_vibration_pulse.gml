function __input_class_vibration_pulse(arg0, arg1, arg2, arg3, arg4) constructor
{
    static __tick = function(arg0)
    {
        __time += arg0;
        var _t = __time / __duration;
        var _output = 0.5 + (0.5 * dsin(_t * ((360 * __repeats) - 180)));
        __output_left = _output * __strength_left;
        __output_right = _output * __strength_right;
        return __time < __duration;
    };
    
    __force = arg4;
    __output_left = 0;
    __output_right = 0;
    __strength_left = arg0 * clamp(1 - arg1, 0, 1);
    __strength_right = arg0 * clamp(1 + arg1, 0, 1);
    __repeats = arg2;
    __time = 0;
    __duration = arg3;
}
