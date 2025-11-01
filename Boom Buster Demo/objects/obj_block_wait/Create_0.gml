event_inherited();
timer[0] = 570;

timer_func[0] = function()
{
    part_particles_create(global.part_over, x + 32, y + 32, global.particles.smoke, 1);
    instance_destroy();
};
