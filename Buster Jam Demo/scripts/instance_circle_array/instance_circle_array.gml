function instance_circle_array(arg0, arg1, arg2, arg3)
{
    var _me = id;
    var _array = [];
    
    with (arg3)
    {
        var _obj = id;
        
        with (_me)
        {
            if (collision_circle(arg0, arg1, arg2, _obj, true, true))
                array_push(_array, _obj.id);
        }
    }
    
    return _array;
}
