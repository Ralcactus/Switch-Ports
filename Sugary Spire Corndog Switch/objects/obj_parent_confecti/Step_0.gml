if (obj_parent_player.x != x)
    drawxscale = sign(obj_parent_player.x - x);

switch (state)
{
    case UnknownEnum.Value_0:
        scr_confecti_normal();
        break;
    
    case UnknownEnum.Value_1:
        scr_confecti_taunt();
        break;
    
    case UnknownEnum.Value_2:
        scr_confecti_appear();
        break;
}

if (room == rank_room)
    visible = false;
