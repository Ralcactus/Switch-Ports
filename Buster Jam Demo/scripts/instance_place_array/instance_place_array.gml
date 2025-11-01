function instance_place_array(arg0, arg1, arg2)
{
    var _me = id;
    var _array = [];
    
    with (arg2)
    {
        var _obj = id;
        
        with (_me)
        {
            if (place_meeting(arg0, arg1, _obj))
                array_push(_array, _obj.id);
        }
    }
    
    return _array;
}
