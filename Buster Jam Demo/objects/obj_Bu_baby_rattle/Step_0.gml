xAxis = input_check_pressed("right", player) - input_check_pressed("left", player);
var _angle = image_angle;

if ((dir != 0 && xAxis == dir) || (xAxis != 0 && dir == 0))
{
    if (dir == 0)
        dir = xAxis;
    
    shake = 14;
    rattles++;
    dir = -dir;
    audio_play_sound_on(controller.audio, snd_Bu_rattle, 0, 0);
    image_angle = xAxis * -20;
    
    if (rattles == rattles_needed && !controller.ended)
    {
        scr_micro_win();
        
        with (obj_Bu_baby_buster)
        {
            if (ID == other.ID)
            {
                anim_play(spr_Bu_baby_buster_joy_transition);
                yay_snd = audio_play_sound_on(controller.audio, snd_Bu_baby_yay, 0, false);
                clap_snd = audio_play_sound_on(controller.audio, snd_Bu_baby_clap, 0, 0);
            }
        }
    }
}

shake = approach(shake, 0, 1.25);
ball_x = x - lengthdir_x(440, image_angle - 90);
ball_y = y - lengthdir_y(440, image_angle - 90);

if (image_angle != _angle)
{
    with (obj_Bu_baby_ball)
    {
        if (ID == other.ID)
        {
            x = other.ball_x;
            y = other.ball_y;
            x += irandom_range(-35, 35);
            y += irandom_range(-20, 20);
            hspd = irandom_range(10, 20) * choose(-1, 1);
            vspd = irandom_range(-20, 20);
        }
    }
}
