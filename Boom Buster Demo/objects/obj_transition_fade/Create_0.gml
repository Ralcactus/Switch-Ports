fade_alpha = 0;
timer[0] = -1;

timer_func[0] = function()
{
    state = !state;
    room_goto(myRoom);
};

set = false;
state = 0;
col = 0;
