function __input_class_vibration_adsr(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7) constructor
{
    static __tick = function(arg0)
    {
        __time_in_phase += arg0;
        var _min = 0;
        var _max = 0;
        var _phase_time = infinity;
        
        switch (__phase)
        {
            case 0:
                _min = 0;
                _max = 1;
                _phase_time = __attack;
                break;
            
            case 1:
                _min = 1;
                _max = __sustain_level;
                _phase_time = __decay;
                break;
            
            case 2:
                _min = __sustain_level;
                _max = __sustain_level;
                _phase_time = __sustain;
                break;
            
            case 3:
                _min = __sustain_level;
                _max = 0;
                _phase_time = __release;
                break;
        }
        
        var _output = lerp(_min, _max, clamp(__time_in_phase / _phase_time, 0, 1));
        __output_left = _output * __strength_left;
        __output_right = _output * __strength_right;
        __time_in_phase += arg0;
        
        if (__time_in_phase > _phase_time)
        {
            __time_in_phase -= _phase_time;
            __phase++;
        }
        
        return __phase <= 3;
    };
    
    __force = arg7;
    __output_left = 0;
    __output_right = 0;
    __strength_left = arg0 * clamp(1 - arg2, 0, 1);
    __strength_right = arg0 * clamp(1 + arg2, 0, 1);
    __sustain_level = arg1;
    __pan = arg2;
    __attack = arg3;
    __decay = arg4;
    __sustain = arg5;
    __release = arg6;
    __phase = 0;
    __time_in_phase = 0;
}
