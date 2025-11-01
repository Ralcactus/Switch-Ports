testvariablenothing = false;
move_in = true;
time = 0;
anim_init();
draw_bridget = true;
x = ((obj_macro_knives_controller.intro_zoom * 1920) - 530) + 1100;
timer[0] = -1;

timer_func[0] = function()
{
    move_in = false;
};

timer[1] = -1;

timer_func[1] = function()
{
    get_cams();
    var _zoom = 1 - (obj_macro_knives_controller.zoom - 1);
    var _x = irandom_range(camx, camx + (1920 * _zoom));
    var _y = irandom_range(camy, camy + (1080 * _zoom));
    var _fx = instance_create_layer(_x, _y, "FX", obj_universal_fx);
    
    with (_fx)
    {
        anim_play(spr_fx_explosion);
        image_xscale = 1.6;
        image_yscale = 1.6;
    }
    
    timer[1] = explosion_delay;
    audio_stop_play(snd_explosion, 0, 0);
};

explosion_delay_start = 15;
explosion_delay_end = 4;
percent_explosion_delay = 0;
explosion_delay = explosion_delay_start;
overlay_alpha = -0.4;
hspd = 0;

event_done = function()
{
    with (obj_macro_knives_controller)
        event_next();
    
    instance_destroy();
};

anim_sprite_bridget = spr_macro_knives_bridget_wrap;
anim_index_bridget = 0;
arm_x = 1000;
arm_in = false;

timer_func[2] = function()
{
    arm_in = true;
};

if (obj_macro_knives_controller.hits == 2)
    timer[2] = 90;
else
    timer[2] = -1;
