event_inherited();
lightlevel = 1;
z = depth;
squish = 1;

canCollide = function(_id, _x, _y)
{
    if (global.switchstate ^^ reverse)
        return false;
    
    with (_id)
    {
        if (place_meeting(_x, _y, other))
            return false;
    }
    
    if (_id.object_index == obj_player)
        return _id.ondeathplatform == noone;
    
    return true;
};

outlining = shader_get_uniform(shd_sadblock, "u_Outlining");
reverse = false;
