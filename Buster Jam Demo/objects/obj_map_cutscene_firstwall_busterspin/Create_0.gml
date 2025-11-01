event_inherited();
anim_init();
anim_speed = 0.25;
physics_init_3d();
last_spin = false;
last_hit = false;

event_wall_x = function()
{
    screen_shake(7, 7);
    audio_play_sound(snd_Bu_smash_brick, 0, 0);
    hspd = -10;
    x--;
    
    if (last_spin)
    {
        anim_play(spr_buster_pain);
        last_hit = true;
    }
};

state = 0;
hspd = -1.75;
timer[0] = 90;

timer_func[0] = function()
{
    hspd = 14;
    audio_play_sound(snd_spin, 0, 0);
    
    if (state == 0)
        state = 1;
};

timer[1] = -1;

timer_func[1] = function()
{
    with (obj_map_cutscene_firstwall)
    {
        paused = false;
        event_continue();
    }
    
    with (obj_map_actor)
    {
        if (ID == 0)
            event_squish();
    }
    
    instance_destroy();
};
