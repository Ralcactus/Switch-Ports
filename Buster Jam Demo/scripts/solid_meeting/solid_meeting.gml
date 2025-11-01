function solid_meeting(arg0, arg1, arg2)
{
    if (place_meeting(arg0, arg1, arg2))
    {
        var _array = instance_place_array(arg0, arg1, arg2);
        
        for (var i = 0; i < array_length(_array); i++)
        {
            if (!array_contains(array_ignore_obj, _array[i].object_index) && !array_contains(array_ignore_id, _array[i].id))
                return true;
        }
    }
    
    return false;
}
