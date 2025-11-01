function instance_rectangle_array(arg0, arg1, arg2, arg3, arg4)
{
    var _me = id;
    var _array = [];
    
    with (arg4)
    {
        var _obj = id;
        
        with (_me)
        {
            if (collision_rectangle(arg0, arg1, arg2, arg3, _obj, true, true))
                array_push(_array, _obj.id);
        }
    }
    
    return _array;
}
