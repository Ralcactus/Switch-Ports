if (yAxis > 0)
    zspd = climb_down_spd;
else if (yAxis < 0)
    zspd = -climb_spd;
else
    zspd = 0;

with (obj_solid_ladder)
    mask_index = spr_nothing;

var _off = false;
var _top = false;

if (z <= (my_ladder.z - my_ladder.height - 40))
{
    _off = true;
    _top = true;
}

if (instance_place_3d(x, y, z + 1, obj_solid) && yAxis > 0)
    _off = true;

if (_off)
{
    state = state_free;
    vspd = -1;
    zspd = 0;
    
    with (obj_solid_ladder)
        mask_index = spr_solid_map;
    
    if (_top)
    {
        z = my_ladder.z - my_ladder.height - 1;
        
        while (instance_place_3d(x, y, z, obj_solid))
            y--;
    }
}
