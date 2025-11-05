event_inherited();
lightlevel = 1;
z = depth;
squish = 1;
hit = false;

canCollide = function(_id, _x, _y)
{
    if (_id.object_index == obj_player)
        return _id.ondeathplatform == noone;
    
    return true;
};

bounce_event = function(_id, _v)
{
    global.switchstate = !global.switchstate;
    var _ev = scr_fmod_soundeffectONESHOT("event:/sfx/misc/onoffcrate", x + (sprite_width / 2), y + (sprite_height / 2));
    fmod_studio_event_instance_set_parameter_by_name(_ev, "state", global.switchstate);
    
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
            
            gamepadvibrate(0.2, 0, 8);
        }
    }
    
    squish = 0.7;
};
