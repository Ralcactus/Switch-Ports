if (deac)
    exit;

xAxis = input_check("right") - input_check("left");

if (deac)
{
    xAxis = 0;
    
    if (audio_is_playing(my_drive_snd))
        audio_stop_sound(my_drive_snd);
}

hspd = approach(hspd, movespd * xAxis, acc);
wheel_angle -= hspd;
physics_apply_2d_micro();
truck_yoff = sin(time * pi) * 2;
time += (abs(hspd) * 0.008 * global.delta_game_factor);
timer_logic(0);

if (input_check_pressed("jump") && !shoot_delay && !deac)
{
    shoot_delay = 15;
    shoot_yoff = 12;
    var _inst = instance_create_micro(x + 131, y + 62, "Over", obj_micro_monstertruck_cannonball);
    _inst = instance_create_micro(x, y + shoot_yoff + truck_yoff, "Over1", obj_micro_fx);
    
    with (_inst)
        anim_play(spr_micro_monstertruck_shootfx);
    
    audio_play_sound_on(controller.audio, snd_micro_monstertruck_cannon, false, 0);
}

shoot_delay = approach(shoot_delay, 0, 1);
shoot_yoff = approach(shoot_yoff, 0, 1);

if (audio_is_playing(my_drive_snd))
{
    if (xAxis == 0)
        audio_sound_gain(my_drive_snd, 0, 100);
    else
        audio_sound_gain(my_drive_snd, 1, 100);
}
