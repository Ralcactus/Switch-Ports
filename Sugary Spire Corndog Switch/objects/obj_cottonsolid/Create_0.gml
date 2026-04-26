canCollide = function(arg0 = obj_parent_player)
{
    switch (arg0)
    {
        case obj_parent_player:
        case obj_player1:
        case obj_player2:
            return arg0.state != UnknownEnum.Value_96 && arg0.sprite_index != spr_player_PZ_cotton_attack;
            break;
        
        default:
            return true;
            break;
    }
};
