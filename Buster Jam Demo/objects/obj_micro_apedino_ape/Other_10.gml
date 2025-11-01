if (input_check_pressed("down"))
{
    state = state_crouch;
    timer[0] = 30;
    audio_play_sound_on(controller.audio, snd_micro_apedino_crouch, false, 0);
}

if (input_check_pressed("up") || input_check_pressed("jump"))
{
    state = state_jump;
    vspd = -12;
    audio_play_sound_on(controller.audio, snd_micro_apedino_jump, false, 0);
    exit;
}
