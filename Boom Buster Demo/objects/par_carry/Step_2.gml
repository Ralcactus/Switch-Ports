if (inPipe)
    exit;

xscale_squish = approach(xscale_squish, 1, 0.1);
yscale_squish = approach(yscale_squish, 1, 0.1);

if (carried != -4 && !instance_exists(carried))
    carried = -4;

if (instance_exists(carried))
{
    if (throwable)
        facing = carried.facing;
    
    var _pos = ds_list_find_index(carried.list_carry, id);
    
    if (thrown)
    {
        if (carried.anim_index < 1)
        {
            x = carried.x - (89 * carried.facing);
            y = carried.y - 49;
        }
        else if (carried.anim_index < 2)
        {
            x = carried.x + (40 * carried.facing);
            y = carried.y - 49;
        }
        else
        {
            if (place_meeting(x, y, obj_solid))
            {
                while (place_meeting(x, y, obj_solid))
                {
                    x -= throw_facing;
                    
                    if (!place_meeting(x, y, obj_solid))
                        break;
                }
            }
            
            ds_list_delete(carried.list_carry, ds_list_find_index(carried.list_carry, id));
            hspd = facing * 20;
            vspd = 0;
            grav = 0;
            timer[1] = 3;
            ignore = carried;
            ignore_timer = 20;
            carried = -4;
        }
    }
    else
    {
        var _yoff;
        
        if (carried.state == carried.state_cannon && !carried.cannon_shot)
            _yoff = 20;
        else
            _yoff = 0;
        
        x = carried.x;
        y = (carried.y - 100 - (55 * _pos)) + _yoff;
    }
    
    carry_yoff = approach(carry_yoff, 0, 4);
}
else
{
    carry_yoff = 0;
}
