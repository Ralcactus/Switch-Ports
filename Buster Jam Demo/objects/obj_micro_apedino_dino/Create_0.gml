event_inherited();
anim_init();
anim_speed = 0;
attacks = [0, 0, 1, 1];
attacks = array_shuffle(attacks);
shots = 0;
timer[0] = irandom_range(75, 90);

timer_func[0] = function()
{
    if (attacks[0] == 1)
    {
        state = state_crouch;
        timer[3] = 10;
    }
    else
    {
        event_user(0);
    }
    
    shots++;
    timer[1] = 36;
    
    if (shots < 3)
    {
        timer[0] = irandom_range(50, 75);
        
        if (state == state_crouch)
            timer[0] += 10;
    }
    
    array_delete(attacks, 0, 1);
};

timer[1] = -1;

timer_func[1] = function()
{
    state = state_free;
};

timer[2] = 8;

timer_func[2] = function()
{
    bounce = !bounce;
    timer[2] = 8;
};

timer[3] = -1;

timer_func[3] = function()
{
    event_user(0);
};

bounce = false;
state = 0;
state_free = 0;
state_crouch = 1;
