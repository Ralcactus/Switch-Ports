global.map_freeze = 0;
instance_destroy();

with (obj_map_cam)
    follow = obj_map_player;

with (obj_map_player)
{
    deac = false;
    ignore_render = false;
}

with (obj_map_player_follower)
    ignore_render = false;

with (obj_map_crossblock)
{
    timer[1] = -1;
    
    with (obj_enemy_crossing)
        crosswalk_stop = false;
    
    with (obj_enemy_crossing_spawner)
        crosswalk_stop = false;
    
    with (obj_map_crossblock)
        anim_index = 0;
    
    time_cross = 0;
}
