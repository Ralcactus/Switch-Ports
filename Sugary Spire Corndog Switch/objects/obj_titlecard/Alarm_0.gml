if (!instance_exists(obj_fadeoutTransition))
{
    instance_create(x, y, obj_fadeoutTransition, 
    {
        levelStart: true
    });
}
