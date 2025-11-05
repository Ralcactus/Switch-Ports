done_move = false;
landed = false;
movetimer = 0;

canCollide = function(_id, _x, _y)
{
    if (_id.object_index == obj_player)
        return _id.ondeathplatform == noone;
    
    return true;
};
