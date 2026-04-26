canCollide = function(arg0 = obj_parent_player)
{
    switch (arg0)
    {
        case obj_parent_player:
        case obj_player1:
        case obj_player2:
        case obj_painter:
            return true;
            break;
        
        default:
            return false;
            break;
    }
};
