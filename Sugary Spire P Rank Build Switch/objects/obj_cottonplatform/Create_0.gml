canCollide = function(callingObject = obj_player)
{
    switch (callingObject)
    {
        case obj_player:
        case obj_player2:
            var _state = global.freezeframe ? callingObject.frozenstate : callingObject.state;
            return (_state == states.cotton && callingObject.state != states.cottondrill) || _state == states.cottonroll;
            break;
        
        default:
            return true;
            break;
    }
};
