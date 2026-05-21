canCollide = function(callingObject = obj_player)
{
    switch (callingObject)
    {
        case obj_player:
        case obj_player2:
            var _state = global.freezeframe ? callingObject.frozenstate : callingObject.state;
            return _state != states.seacream && _state != states.seacreamstick && _state != states.seacreamjump;
            break;
        
        default:
            return true;
            break;
    }
};
