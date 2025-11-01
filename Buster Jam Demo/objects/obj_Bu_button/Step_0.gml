timer_logic(0);

if (!controller.win || controller.ended)
    exit;

if (input_check_pressed("jump") || input_check_pressed("left") || input_check_pressed("right") || input_check_pressed("up") || input_check_pressed("down"))
{
    controller.win = false;
    timer[0] = 10;
    audio_play_sound_on(controller.audio, snd_button, 0, 0);
    image_index = 1;
}
