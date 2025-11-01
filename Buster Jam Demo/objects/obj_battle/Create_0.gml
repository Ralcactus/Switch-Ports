image_speed = 0;
x = 0;
y = 0;
state = 0;
timer[0] = -1;

timer_func[0] = function()
{
    if (obj_frenzy.win)
    {
        image_index = 2;
    }
    else
    {
        obj_frenzy.hp--;
        image_index = 3;
    }
    
    timer[1] = 120;
};

timer[1] = -1;

timer_func[1] = function()
{
    state = 1;
    image_index = 4;
};

timer[2] = -1;

timer_func[2] = function()
{
    image_index = 5;
    state = 2;
    timer[3] = 120;
};

timer[3] = -1;

timer_func[3] = function()
{
    image_index = 0;
    
    with (obj_frenzy)
        event_state_switch(0);
};

timer[4] = -1;

timer_func[4] = function()
{
    image_index = 1;
    timer[0] = 80;
};

attack_overlay_alpha = 0;
