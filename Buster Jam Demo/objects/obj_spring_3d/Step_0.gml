if (scr_map_exit_freeze())
    exit;

var _inst = instance_place_3d(x, y, z - 1, par_player);

if (_inst && _inst.zspd >= 0)
{
    if (_inst.object_index != obj_map_player_follower)
    {
        with (_inst)
            zspd = -25;
    }
    
    xscale = 1.4;
    yscale = 0.6;
}

xscale = lerp(xscale, 1, 0.12);
yscale = lerp(yscale, 1, 0.12);
