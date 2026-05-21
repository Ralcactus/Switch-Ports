function scr_mathlibs()
{
    function cycle(arg0, arg1, arg2)
    {
        var delta = arg2 - arg1;
        var result = (arg0 - arg1) % delta;
        
        if (result < 0)
            result += delta;
			
        return result + arg1;
    }
    
    function angle_rotate(arg0, arg1, arg2)
    {
        var diff = cycle(arg1 - arg0, -180, 180);
        
        if (diff < -arg2)
            return arg0 - arg2;
        
        if (diff > arg2)
            return arg0 + arg2;
        
        return arg1;
    }
}
