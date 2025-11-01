function physics_init_3d()
{
    z = 0;
    zprevious = z;
    hspd = 0;
    vspd = 0;
    zspd = 0;
    grounded = false;
    
    for (var c = 0; c < 3; c++)
    {
        move_sub[c] = 0;
        move[c] = 0;
    }
    
    event_floor = function()
    {
        zspd = 0;
    };
    
    event_ceiling = function()
    {
        zspd = 0;
    };
    
    event_wall_x = function()
    {
    };
    
    event_wall_y = function()
    {
    };
}
