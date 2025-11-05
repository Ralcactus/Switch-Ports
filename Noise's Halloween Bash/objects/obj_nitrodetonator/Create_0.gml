z = depth;
depth = 100;
activated = false;
squish = 1;
canCollide = -1;
lightlevel = 1;

bounce_event = function(_id, _v)
{
    if (!activated && _v >= 0)
    {
        cratebounceeffect(_id);
        
        with (_id)
            player_bounce(input_check("jump") ? -13 : -10);
        
        alarm[0] = 30;
        activated = true;
        squish = 0.7;
        add_saveroom(id, global.respawnroom);
        gamepadvibrate(0.2, 0, 8);
    }
};
