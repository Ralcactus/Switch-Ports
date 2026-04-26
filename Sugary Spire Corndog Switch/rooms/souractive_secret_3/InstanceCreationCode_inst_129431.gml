condition = function()
{
    return !instance_exists(obj_parent_baddie) && !instance_exists(obj_sourenemyspawn);
};

output = function()
{
    portal_activate(129410, true);
    
    with (129410)
        y = ystart + 32;
};
