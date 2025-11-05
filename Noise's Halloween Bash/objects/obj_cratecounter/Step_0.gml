if (game_paused())
    exit;

spin = (spin + 2) % 360;

if (distance_to_object(obj_player) < 200 && global.destroyedcount >= global.cratecount)
{
    with (instance_create_depth(x, y, 0, obj_boxgem))
        vsp = -8;
    
    instance_destroy();
}
