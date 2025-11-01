global.freeze = 99999;
fade_alpha = 1;
state = 0;
surf = surface_create(1920, 1080);
radius = 0;
radius_add = 0;
spd = 0.3;
skipped = false;
timer[0] = 45;

timer_func[0] = function()
{
    state++;
    
    if (state == 1)
    {
        if (room == rm_city_s7a1 && !global.boss_cutscene)
            timer[1] = 30;
        else
            timer[0] = 80;
        
        with (obj_player)
        {
            state = state_intro;
            anim_play(spr_buster_taunt);
        }
    }
};

timer[1] = -1;

timer_func[1] = function()
{
    global.boss_cutscene = true;
    audio_stop_sound(global.bgmPlay);
    var _fake = instance_create_layer(0, 0, layer, obj_stagestart_boss);
    _fake.radius = radius;
    
    with (obj_player)
        anim_play(spr_buster_confused);
    
    instance_destroy();
};

if (global.acts == 1 || obj_controller.bossfight)
    display_act = false;
else
    display_act = true;
