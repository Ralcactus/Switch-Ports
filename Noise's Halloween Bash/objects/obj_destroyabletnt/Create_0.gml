event_inherited();
z = depth;
squish = 1;
active = false;
explodesteps = 4;
steptimer = 0;
stepflash = 0;

canCollide = function(_id, _x, _y)
{
    if (_id.object_index == obj_player)
        return _id.ondeathplatform == noone;
    
    return true;
};

bounce_event = function(_id, _v)
{
    if (!active)
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
        
        active = true;
        squish = 0.7;
        combo();
        gamepadvibrate(0.2, 0, 8);
    }
};
