lightlevel = 1;
z = depth - 6;
hp = 1;
squish = 1;

canCollide = function(_id, _x, _y)
{
    if (_id.object_index == obj_player)
        return _id.ondeathplatform == noone && _id.currcheckpoint.id != id;
    
    return true;
};

bounce_event = function(_id, _v)
{
    with (_id)
    {
        if (_v >= 0)
        {
            cratebounceeffect(_id);
            player_bounce(input_check("jump") ? -13 : -10);
        }
        else
        {
            player_bounce(abs(vsp) * 0.75);
            
            if (vsp < 4)
                vsp = 4;
        }
    }
    
    squish = 0.7;
    hp--;
    
    if (hp <= 0)
    {
        event_perform(ev_destroy, 0);
        gamepadvibrate(0.2, 0, 8);
    }
    else
        gamepadvibrate(0.1, 0, 8);
};
