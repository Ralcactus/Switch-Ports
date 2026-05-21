canCollide = function(callingObject = obj_player)
{
    return !place_meeting(x, y, callingObject);
};

event_inherited();
scr_collision_init();
grav = 0.5;
dhsp = 0;
dvsp = 0;
spinspeed = 0;
