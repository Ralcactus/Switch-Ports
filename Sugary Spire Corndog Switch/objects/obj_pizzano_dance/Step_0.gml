if (pizz_x != 0 && pizz_y != 540 && !leave)
{
    var d = point_direction(xstart, ystart, 0, 540);
    pizz_x = approach(pizz_x, 0, lengthdir_x(5, d));
    pizz_y = approach(pizz_y, 540, lengthdir_y(5, d));
    pizz_y = max(pizz_y, 540);
    pizz_x = min(pizz_x, 0);
}

if (leave)
{
    var d = point_direction(pizz_x, pizz_y, -300, 560);
    pizz_x = approach(pizz_x, -300, lengthdir_x(3, d));
    pizz_y = approach(pizz_y, 560, lengthdir_y(3, d));
}

botcount = instance_number(obj_pizzanobot);

if (botcount <= 0)
{
    sprite_index = spr_pizzano_timersad;
    alarm[1] = 100;
    botsactive = false;
    
    if (instance_exists(obj_pizzanoblockade))
        instance_destroy(obj_pizzanoblockade);
}
