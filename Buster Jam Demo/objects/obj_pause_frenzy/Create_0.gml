instance_deactivate_all_hook(true);
instance_activate_object(obj_persistent);
instance_activate_object(input_controller_object);
audio_pause_all();
text = "PAUSED";
count = 3;
input_verb_consume("pause");
timer[0] = -1;

timer_func[0] = function()
{
    count--;
    text = count;
    timer[0] = 40;
    
    if (count == 0)
    {
        instance_destroy();
        instance_activate_all();
        audio_resume_all();
    }
};

unpaused = false;
deac = false;
options = ["Resume", "Options", "Give Up"];
selected = 0;
