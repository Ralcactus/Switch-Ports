event_inherited();
anim_init();
anim_speed = 0;
state = 0;
state_free = 0;
state_crouch = 1;
state_jump = 2;
state_hit = 3;
state_death = 4;
hspd = 0;
vspd = 0;
grav = 0.6;
timer[0] = -1;

timer_func[0] = function()
{
    state = state_free;
};

cam_xoff = 0;
cam_yoff = 0;
death_bounces = 4;
