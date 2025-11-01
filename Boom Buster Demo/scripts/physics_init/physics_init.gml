function physics_init()
{
    hspd = 0;
    vspd = 0;
    grav = 1.2;
    
    for (var i = 0; i < 2; i++)
    {
        move[i] = 0;
        move_sub[i] = 0;
        move_forces[0] = array_create();
        move_forces[1] = array_create();
    }
    
    hspd_platform = 0;
    hspd_conveyor = 0;
    can_slope_down = true;
    has_collision = true;
    physics_simple = false;
    collide_with_ceiling = true;
    bounce_blocks = 1;
    has_gravity = true;
    list_collision = ds_list_create();
    list_ignore = ds_list_create();
    
    event_wall = function()
    {
        hspd = 0;
    };
    
    event_floor = function()
    {
        vspd = 0;
    };
    
    event_ceiling = function()
    {
        vspd = 0;
    };
    
    event_xmove = function()
    {
    };
    
    event_ymove = function()
    {
        return true;
    };
    
    event_bounce = function()
    {
        vspd = -calculate_jump(bounce_blocks, grav);
        bounce_blocks = 2;
        event_bounce_extra();
    };
    
    event_bounce_extra = function()
    {
    };
}
