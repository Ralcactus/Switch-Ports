function on_wall(arg0)
{
    if (arg0 == 1 && place_meeting(x + 1, y, obj_onewayL))
    {
        var _inst = instance_place(x + 1, y, obj_onewayL);
        
        if (!place_meeting(x - 1, y, _inst))
            return true;
    }
    
    if (arg0 == -1 && place_meeting(x - 1, y, obj_onewayR))
    {
        var _inst = instance_place(x - 1, y, obj_onewayR);
        
        if (!place_meeting(x + 1, y, _inst))
            return true;
    }
    
    if (solid_meeting(x + arg0, y, obj_solid))
    {
        var _inst = instance_place(x + arg0, y, obj_solid);
        
        if (!(_inst.object_index == obj_slope || _inst.object_index == obj_slope_long))
            return true;
    }
    
    return false;
}
