event_inherited();
lightlevel = 1;
z = depth;
hp = 3;
squish = 1;
palettespr = spr_nitroarrowpal;
curpalette = hp;

canCollide = function(_id, _x, _y)
{
    if (_id.object_index == obj_player)
        return _id.ondeathplatform == noone;
    
    return true;
};

bounce_event = function(_id, _v)
{
    if (_v >= 0)
    {
        cratebounceeffect(_id);
        
        with (_id)
            player_bounce(input_check("jump") ? -18 : -15);
        
        squish = 0.7;
        hp--;
        
        if (hp <= 0)
        {
            instance_destroy();
            combo();
            gamepadvibrate(0.2, 0, 8);
        }
        else
            gamepadvibrate(0.1, 0, 8);
    }
};
