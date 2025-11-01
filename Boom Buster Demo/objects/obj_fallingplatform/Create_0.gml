event_inherited();
wait_time = 20;
stepped = false;
fall = false;
xshake = 0;
timer[0] = -1;

timer_func[0] = function()
{
    stepped = false;
    fall = true;
    timer[1] = 240;
};

timer[1] = -1;

timer_func[1] = function()
{
    y = ystart;
    part_particles_create(global.part_over, x + ((64 * image_xscale) / 2), y, global.particles.dustland, 1);
    vspd = 0;
    fall = false;
};

grav = 0.28;
