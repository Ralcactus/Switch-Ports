testvariablenothing = false;
hspd = 0;
anim_init();
facing = 1;
side = -1;
flip_yto = 0;
side_flip = false;
flip_yoff = 0;
side_to = 0;
down_yoff = 528;
deac = true;
action_free = 0;
action_spin = 1;
action_turn = 2;
action = action_free;
spin_length = 25;
coyote_spin = 0;
coyote_spin_length = 6;
timer[0] = -1;

timer_func[0] = function()
{
    action = action_free;
};

event_catch = function()
{
    catch_ymove = 1;
    shake = 1;
    caught_bridget = true;
};

catch_ymove = 0;
shake = 0;
caught_bridget = false;
