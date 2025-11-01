if (exit_freeze() || !ready)
    exit;

if (stepped && !fall)
    xshake = irandom_range(-6, 6);

if (fall)
{
    xshake = 0;
    vspd += grav;
    timer_logic(1);
}
else
{
    if (!stepped)
    {
        var _inst = instance_place(x, y - 1, obj_player);
        
        if (_inst && _inst.y <= (y + 1))
        {
            var _step = true;
            
            with (_inst)
            {
                if (place_meeting(x, y + 1, par_ground))
                    _step = false;
            }
            
            if (_step)
            {
                stepped = true;
                timer[0] = wait_time;
            }
        }
    }
    
    if (stepped)
        timer_logic(0);
}

if (vspd >= 12)
    vspd = 12;

if (y > (room_height + 128))
    vspd = 0;

event_inherited();
