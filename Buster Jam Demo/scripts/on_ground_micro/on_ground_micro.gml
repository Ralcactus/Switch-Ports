function on_ground_micro()
{
    if (place_meeting_micro(x, y + 1, my_onewayU))
    {
        var _array = instance_place_array(x, y + 1, my_onewayU);
        
        for (var i = 0; i < array_length(_array); i++)
        {
            if (_array[i].ID != ID)
                continue;
            
            if (y <= _array[i].y)
                return true;
        }
        
        _array = instance_place_array(x, y + 1, my_onewayU);
        
        for (var i = 0; i < array_length(_array); i++)
        {
            if (_array[i].ID != ID)
                continue;
            
            var _inst = _array[i];
            
            if (place_meeting(x, y - 1, _inst) || !place_meeting(x, y + 1, _inst))
                break;
            
            if (i == (array_length(_array) - 1))
                return true;
        }
    }
    
    if (place_meeting_micro(x, y + 1, my_solid))
        return true;
    
    return false;
}
