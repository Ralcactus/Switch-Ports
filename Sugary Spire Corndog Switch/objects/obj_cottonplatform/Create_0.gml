canCollide = function(arg0 = obj_parent_player)
{
    switch (arg0)
    {
        case obj_parent_player:
        case obj_player1:
        case obj_player2:
            var _state = global.freezeframe ? arg0.frozenState : arg0.state;
            return (_state == UnknownEnum.Value_87 && arg0.state != UnknownEnum.Value_96) || _state == UnknownEnum.Value_97;
            break;
        
        default:
            return true;
            break;
    }
};
