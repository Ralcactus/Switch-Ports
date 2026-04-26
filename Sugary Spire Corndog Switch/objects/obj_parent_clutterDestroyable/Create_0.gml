canCollide = function(arg0 = obj_parent_player)
{
    switch (arg0)
    {
        case obj_parent_player:
        case obj_player1:
        case obj_player2:
            var _state = global.freezeframe ? arg0.frozenState : arg0.state;
            return !place_meeting(x, y, arg0) || _state == UnknownEnum.Value_145 || _state == UnknownEnum.Value_11 || _state == UnknownEnum.Value_12 || _state == UnknownEnum.Value_66;
            break;
        
        default:
            return !place_meeting(x, y, arg0);
            break;
    }
};

event_inherited();
scr_collision_init();
grav = 0.5;
dhsp = 0;
dvsp = 0;
spinspeed = 0;
