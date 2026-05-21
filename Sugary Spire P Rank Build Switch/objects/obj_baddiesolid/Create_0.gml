canCollide = function(callingObject = obj_player)
{
    switch (callingObject)
    {
        case obj_player:
        case obj_player2:
        case obj_painter:
            return true;
            break;
        
        default:
            return false;
            break;
    }
};
