testvariablenothing = false;
timer[0] = -1;

timer_func[0] = function()
{
    room_goto_fade(next_room, 45);
};

timer[1] = 25;

timer_func[1] = function()
{
    deac = false;
};

alarm[0] = 1;
deac = true;
