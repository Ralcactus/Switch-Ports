physics_init();
grav = 0.28;

event_floor = function()
{
    vspd = -6;
};

event_wall = function()
{
    hspd = -hspd;
};

facing = 1;
timer[0] = 180;

timer_func[0] = function()
{
    part_particles_create(global.part_over, x, y, global.particles.smoke, 1);
    instance_destroy();
};

image_xscale = 2;
image_yscale = 2;
