function place_meeting_micro(arg0, arg1, arg2)
{
    var _array = instance_place_array(arg0, arg1, arg2);
    
    for (var i = 0; i < array_length(_array); i++)
    {
        if (_array[i].ID != ID)
            continue;
        
        if (place_meeting(arg0, arg1, arg2))
            return true;
    }
    
    return false;
}
