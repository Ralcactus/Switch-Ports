function on_ground()
{
    if (physics_simple)
        return collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom + 1, obj_solid, true, false);
    
    if (solid_meeting(x, y + 1, obj_onewayU))
    {
        instance_place_list(x, y + 1, obj_onewayU, list_collision, true);
        
        if (ds_list_size(list_collision) > 0)
        {
            for (var i = 0; i < ds_list_size(list_collision); i++)
            {
                var _inst = ds_list_find_value(list_collision, i);
                
                if (_inst && move[1] >= 0)
                {
                    if (!place_meeting(x, y - 1, _inst))
                    {
                        ds_list_clear(list_collision);
                        return true;
                    }
                }
            }
        }
        
        ds_list_clear(list_collision);
    }
    
    if (solid_meeting(x, y + 1, obj_movingsemi))
    {
        instance_place_list(x, y + 1, obj_movingsemi, list_collision, true);
        
        if (ds_list_size(list_collision) > 0)
        {
            for (var i = 0; i < ds_list_size(list_collision); i++)
            {
                var _inst = ds_list_find_value(list_collision, i);
                
                if (_inst && move[1] >= 0)
                {
                    if (!place_meeting(x, y - 1, _inst))
                    {
                        ds_list_clear(list_collision);
                        return true;
                    }
                }
            }
        }
        
        ds_list_clear(list_collision);
    }
    
    if (solid_meeting(x, y + 1, obj_solid))
        return true;
    
    return false;
}
