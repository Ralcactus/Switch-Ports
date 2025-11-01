strength = 0;
dir = 1;
delay = 2;
timer[0] = delay;

timer_func[0] = function()
{
    strength += dir;
    
    if (strength > 12)
    {
        strength = 12;
        dir = -dir;
    }
    
    if (strength < 0)
    {
        strength = 0;
        dir = -dir;
    }
    
    timer[0] = delay;
};

done = false;
camx = 0;
camy = 0;
shake = 0;
shake_x = 0;
shake_y = 0;
