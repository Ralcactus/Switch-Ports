time = 0;
scr_dialogue_reset(map_name);
type_index = string_length(map_name);
name_percent = 0;
name_in = true;
timer[0] = 130;

timer_func[0] = function()
{
    name_in = false;
    timer[1] = 90;
};

timer[1] = -1;

timer_func[1] = function()
{
    instance_destroy();
};

ready = true;
