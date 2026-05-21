if (obj_player.x != x)
    drawxscale = -sign(x - obj_player.x);

switch (state)
{
    case confectistate.normal:
        scr_confecti_normal();
        break;
    
    case confectistate.taunt:
        scr_confecti_taunt();
        break;
    
    case confectistate.appear:
        scr_confecti_appear();
        break;
}

if (room == rank_room)
    visible = false;
