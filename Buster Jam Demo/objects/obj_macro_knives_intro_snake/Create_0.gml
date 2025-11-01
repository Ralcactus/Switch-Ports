testvariablenothing = false;
anim_init();
get_cams();
x = ((obj_macro_knives_controller.intro_zoom * 1920) - 530) + 1100;
time = 0;
anim_sprite_bridget = spr_macro_knives_bridget_wrap;
anim_index_bridget = 0;
shake_screen = 0;
bridget_scream_sound = -4;
timer[0] = -1;

timer_func[0] = function()
{
    anim_sprite_bridget = spr_macro_knives_bridget_wrap_scream0;
    anim_index_bridget = 0;
    bridget_scream_sound = audio_play_sound(voice_bridget_scream, 0, 0);
    timer[1] = 30;
};

timer[1] = -1;

timer_func[1] = function()
{
    move_out = true;
    move_in = false;
    timer[2] = 10;
};

timer[2] = -1;

timer_func[2] = function()
{
    with (obj_macro_knives_cutscene)
        event_done();
};

if (instance_exists(obj_macro_knives_intro))
    timer[3] = 80;
else
    timer[3] = 24;

timer_func[3] = function()
{
    move_in = true;
    timer[4] = 80;
};

timer[4] = -1;

timer_func[4] = function()
{
    arm_in = true;
    timer[0] = 80;
};

move_out = false;
move_in = false;
hspd = 0;
arm_in = false;
arm_x = 1000;
