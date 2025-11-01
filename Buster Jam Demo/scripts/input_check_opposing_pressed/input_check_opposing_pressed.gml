function input_check_opposing_pressed(arg0, arg1, arg2 = 0, arg3 = false)
{
    var _pressed_n = input_check_pressed(arg0, arg2);
    var _pressed_p = input_check_pressed(arg1, arg2);
    
    if (arg3)
    {
        var _value = 0;
        
        if (_pressed_p)
            _value++;
        
        if (_pressed_n)
            _value--;
        
        return _value;
    }
    else
    {
        if (!_pressed_n && !_pressed_p)
            return 0;
        
        var _held_n = input_check(arg0, arg2);
        var _held_p = input_check(arg1, arg2);
        
        if (_pressed_p && !_held_n)
            return 1;
        
        if (_pressed_n && !_held_p)
            return -1;
        
        return 0;
    }
}
