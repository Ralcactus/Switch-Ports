canCollide = function(arg0 = obj_parent_player)
{
    switch (arg0)
    {
        case obj_parent_player:
        case obj_player1:
        case obj_player2:
            var _state = global.freezeframe ? arg0.frozenState : arg0.state;
            return _state != UnknownEnum.Value_54;
            break;
        
        default:
            return true;
            break;
    }
};

depth = 5;
image_speed = 0.35;
image_blend = c_yellow;
oldx = xstart;
oldy = ystart;
