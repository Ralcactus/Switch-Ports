if (!touch && other.outofhallway && other.state != states.fakewalk && player_collideable())
{
    touch = 1;
    var _doorobj = instance_place(x, y, obj_door);
    
    with (other.id)
    {
        verticalhallway = 0;
        
        if (other.image_angle == 90 || other.image_angle == -270)
            verticalhallway = -1 * sign(other.image_xscale);
        
        if (other.image_angle == 270 || other.image_angle == -90)
            verticalhallway = 1 * sign(other.image_xscale);
        
        targetdoor = other.targetdoor;
        targetroom = other.targetroom;
        outofhallway = false;
        
        if (verticalhallway == 0)
        {
            movespeed = 0;
            hsp = 0;
            vsp = 0;
            state = states.fakewalk;
            sprite_index = choose(spr_player_move, spr_player_tiptoe);
            fakewalktime = 30;
            image_xscale = sign(other.image_xscale);
        }
        else
            verticalhallwayposoffset = point_distance(x, 0, _doorobj.x, 0) * -sign(_doorobj.x - obj_player.x);
        
        sendtocheckpoint = false;
        instance_create_depth(0, 0, 0, obj_roomtransition, 
        {
            image_xscale: sign(other.image_xscale)
        });
    }
}
