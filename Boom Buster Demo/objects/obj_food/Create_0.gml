event_inherited();
anim_index = (((global.stage - 1) * 3) + global.act) - 1;
anim_speed = 0;
time = 0;
effect_alpha = 1;
scale = 0;
percent_scale = 0;

timer_func[0] = function()
{
    out = true;
    part_particles_create(global.part_over, x, y, global.particles.smoke, 1);
};

out = false;
timer[3] = -1;

timer_func[3] = function()
{
    part_particles_create(global.part_over, x, y, global.particles.ringthick, 1);
    timer[3] = 132;
};

timer_func[3]();
collected_x = x;
collected_y = y;
lenAdd = 0;
effect_alpha_add = 1;
myAct = global.act - 1;
