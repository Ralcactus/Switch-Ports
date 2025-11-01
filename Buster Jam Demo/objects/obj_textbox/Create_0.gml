testvariablenothing = false;
char_speak = undefined;
skippable = true;
auto = false;
auto_done = false;
ready = false;
done = false;
time = 0;
percent = 1;
scale = 1;
surf = -4;
name_alpha = 0;
finished = false;
alpha = 1;
pause = 0;
text_spd_default = 0.43;
text_ended = false;
array[0] = [0.035, 0];
array[1] = [0.025, 0.0125];
array[2] = [0, 0.025];
ready = false;
portrait_ind = 0;
portrait = undefined;
texture_prefetch("tg_dialogue");
timer[0] = -1;

timer_func[0] = function()
{
    auto_done = true;
};

timer[1] = -1;

timer_func[1] = function()
{
    accept_inputs = true;
};

accept_inputs = false;
arrow_ind = 0;
