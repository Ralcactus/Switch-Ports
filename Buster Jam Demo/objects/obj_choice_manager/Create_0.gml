ready = false;
nodes = 0;
selected = 0;
alarm[0] = 1;
overlay_alpha = 0;
scale = 0;
select_yoff = 0;
done = false;
all_in = false;
select_xoff = 0;
alpha_arrow = 0;
timer[0] = -1;

timer_func[0] = function()
{
    var i;
    
    for (i = 0; i < nodes; i++)
    {
        if (!in[i])
        {
            in[i] = true;
            i++;
            break;
        }
    }
    
    if (i < nodes)
        timer[0] = 14;
    else
        timer[1] = 14;
};

timer[1] = -1;

timer_func[1] = function()
{
    all_in = true;
};

timer[2] = -1;

timer_func[2] = function()
{
    obj_scene_manager.ID = choice[selected].next;
    
    with (obj_scene_manager)
        event_user(0);
    
    instance_destroy();
};
