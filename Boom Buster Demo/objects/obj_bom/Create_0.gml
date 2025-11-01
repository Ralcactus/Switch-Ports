col = 0;
event_inherited();
landY = -999;
set_sprite = false;
timer[0] = 840;

timer_func[0] = function()
{
    event_explode();
};

if (room == rm_tutorial_s1a5)
{
    timer[0] = -1;
    in_tutorial = true;
}
else
{
    in_tutorial = false;
}

path_yoff = 28;

event_explode = function()
{
    if (global.world == 0)
    {
        audio_play_sound(snd_wrong, 0, 0);
        part_particles_create(global.part_over, x, y - 32, global.particles.smoke, 1);
        var _spawn = instance_create_layer(x, 0, layer, object_index);
        _spawn.col = col;
    }
    else
    {
        with (obj_player)
            event_user(0);
        
        part_particles_create(global.part_over_nostun, x, y - 32, global.particles.explosion, 1);
        screen_shake(8, 8);
        audio_play_sound(snd_explosion, 0, 0);
        obj_controller.boms_left--;
    }
    
    instance_destroy();
};

event_bpm = function()
{
    hey_scale = 1.5;
};

hey_scale = 1;
edge = false;
