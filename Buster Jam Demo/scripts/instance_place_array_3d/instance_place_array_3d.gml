function instance_place_array_3d(arg0, arg1, arg2, arg3)
{
    var _me = id;
    var _array = [];
    
    with (arg3)
    {
        var _obj = id;
        
        with (_me)
        {
            if (instance_place_3d(arg0, arg1, arg2, _obj))
                array_push(_array, _obj.id);
        }
    }
    
    return _array;
}
