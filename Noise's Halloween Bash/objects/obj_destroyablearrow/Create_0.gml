event_inherited();
z = depth;
squish = 1;

canCollide = function(_id, _x, _y)
{
    if (_id.object_index == obj_player)
        return _id.ondeathplatform == noone;
    
    return true;
};

bounce_event = function(_id, _v)
{
    with (_id)
    {
        if (_v >= 0)
        {
            cratebounceeffect(_id);
            player_bounce(input_check("jump") ? -18 : -15);
            gamepadvibrate(0.1, 0, 8);
        }
        else
        {
            player_bounce(abs(vsp) * 0.75);
            
            if (vsp < 4)
                vsp = 4;
            
            instance_destroy(other.id);
            gamepadvibrate(0.2, 0, 8);
        }
    }
    
    squish = 0.7;
};
