y = approach(y, 297, spd);

if (y == 297)
{
    with (instance_find_micro(obj_micro_cratememory))
        event_user(0);
    
    instance_destroy();
}
