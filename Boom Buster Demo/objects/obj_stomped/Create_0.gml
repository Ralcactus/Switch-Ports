anim_init();

event_animend = function()
{
    switch (anim_sprite)
    {
        case spr_lip_stomped:
            anim_index = 1;
            break;
        
        case spr_goblinjr_stomped:
            anim_index = 3;
            break;
        
        case spr_rodger_stomped:
            timer_func[0]();
            break;
        
        case spr_hissy_stomped:
            anim_index = 4;
            break;
    }
};

alarm[0] = 1;
create_coin = false;
timer[0] = 30;

timer_func[0] = function()
{
    if (create_coin)
    {
        var _coin = instance_create_layer(x, y - 64 - 40, "Instances_Over", obj_coin);
        audio_play_sound(snd_kaching, 0, 0);
        _coin.kaching = false;
        
        with (_coin)
            event_user(0);
    }
    
    part_particles_create(global.part_over, x, y, global.particles.dustland, 1);
    instance_destroy();
};
