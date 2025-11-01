if (instance_place_3d(x, y, z, obj_map_player) && obj_map_player.grounded && !instance_place_3d(x, y, z, obj_solid))
    touching = true;
else
    touching = false;

if (touching)
{
    if (input_check_pressed("action"))
    {
        with (obj_map_player)
            instance_destroy();
        
        with (obj_map_player_follower)
            instance_destroy();
        
        touching = false;
        timer[0] = 20;
    }
}

timer_logic(0);
