depth = 4;

canCollide = function(callingObject = obj_player)
{
    switch (callingObject)
    {
        case obj_player:
        case obj_player2:
            var _state = global.freezeframe ? callingObject.frozenstate : callingObject.state;
            return _state == states.minecart;
            break;
        
        case obj_minecart:
        case obj_minedummycart:
        case obj_train:
            return true;
            break;
        
        default:
            return false;
            break;
    }
};
