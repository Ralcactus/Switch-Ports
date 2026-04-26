var all_hives_gone = true;

with (obj_hive)
{
    if (distance_to_object(other) <= other.hiveRadius)
        instance_create(x - (50 + irandom(50)), y + irandom_range(-100, 100), obj_beeswarm);
    
    all_hives_gone = false;
}

if (state == UnknownEnum.Value_3)
{
    with (obj_beeswarm)
        angerTimer = max(angerTimer, 150);
}

if (all_hives_gone)
    state = UnknownEnum.Value_2;
else
    state = UnknownEnum.Value_0;
