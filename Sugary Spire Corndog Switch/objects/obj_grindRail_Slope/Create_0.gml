depth = 4;

canCollide = function(arg0 = obj_parent_player)
{
    switch (arg0)
    {
        case obj_parent_player:
        case obj_player1:
        case obj_player2:
            var _state = global.freezeframe ? arg0.frozenState : arg0.state;
            return _state != UnknownEnum.Value_134 && _state != UnknownEnum.Value_87 && _state != UnknownEnum.Value_96 && _state != UnknownEnum.Value_97 && _state != UnknownEnum.Value_95 && _state != UnknownEnum.Value_62 && _state != UnknownEnum.Value_42 && _state != UnknownEnum.Value_67 && _state != UnknownEnum.Value_110 && _state != UnknownEnum.Value_0;
            break;
        
        case obj_creamThief:
        case obj_bigcherry:
        case obj_gigacherrydead:
        case obj_BigCherryMines:
            return true;
            break;
        
        default:
            return false;
            break;
    }
};
