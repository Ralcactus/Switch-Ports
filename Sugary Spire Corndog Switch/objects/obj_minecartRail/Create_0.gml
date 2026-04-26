depth = 4;

canCollide = function(arg0 = obj_parent_player)
{
    switch (arg0)
    {
        case obj_parent_player:
        case obj_player1:
        case obj_player2:
            var _state = global.freezeframe ? arg0.frozenState : arg0.state;
            return _state == UnknownEnum.Value_100;
            break;
        
        case obj_minecart:
        case obj_minedummycart:
        case obj_train:
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
