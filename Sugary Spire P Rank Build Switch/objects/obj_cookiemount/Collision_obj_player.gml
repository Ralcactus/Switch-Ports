if (obj_player.state == states.handstandjump)
{
    if (obj_player.xscale == -1)
        obj_player.movespeed = -obj_player.movespeed;
    
    obj_player.ridingmarsh = true;
    obj_player.state = states.barrelcrouch;
    instance_destroy();
}
