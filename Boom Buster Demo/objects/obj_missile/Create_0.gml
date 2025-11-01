event_inherited();
col = 1;
throwable = true;

event_floor = function()
{
    if (thrown)
        event_explode();
};

event_wall = function()
{
    if (thrown)
        event_explode();
};

create_explosion_radius = true;
