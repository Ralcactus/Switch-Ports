canCollide = function(callingObject = obj_player)
{
    switch (callingObject)
    {
        case obj_player:
        case obj_player2:
            var _state = global.freezeframe ? callingObject.frozenstate : callingObject.state;
            return (_state == states.seacream || (_state == states.seacreamjump && callingObject.vsp > 0)) && abs(callingObject.hsp) >= 12 && !place_meeting(x, y, callingObject);
            break;
        
        default:
            return false;
            break;
    }
};
