obj_controller.tv_override = true;
surf = surface_create(1920, 1080);
fade_alpha = 1;
audio_play_sound(snd_screech_rub, 0, 0);
audio_play_sound(snd_connectlost, 0, 0);
flicks = 0;
timer[0] = 45;

timer_func[0] = function()
{
    fade_alpha = !fade_alpha;
    
    if (!fade_alpha)
        flicks++;
    
    if (flicks < 2)
        timer[0] = 5;
    else
        timer[1] = 45;
};

timer[1] = -1;

timer_func[1] = function()
{
    obj_controller.channel = 2;
    obj_controller.wizard_sprite = spr_tv_wizard_intro;
    obj_controller.wizard_sub = 0;
};

timer[2] = -1;

timer_func[2] = function()
{
    audio_play_sound(voice_wizard_laugh, 0, 0);
    obj_controller.wizard_sprite = spr_tv_wizard_intro2;
    obj_controller.wizard_sub = 0;
    laughing = true;
    timer[3] = 30;
};

timer[3] = -1;

timer_func[3] = function()
{
    obj_controller.alarm[0] = 1;
    obj_controller.tv_override = false;
    
    with (obj_player)
    {
        state = state_free;
        anim_play(spr_buster_idle);
    }
    
    global.freeze = 0;
};

timer[4] = -1;

timer_func[4] = function()
{
    with (obj_controller)
        channel_change(1, 30);
    
    instance_destroy();
};

obj_controller.channel = 0;
laugh = false;
laughing = false;
time = 0;
