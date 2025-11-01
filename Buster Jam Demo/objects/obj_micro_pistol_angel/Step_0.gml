timer_logic(0);

if (!ready)
    exit;

anim_logic();
y = use_curve(acurv_linear, percent, "out", -818, 42);
percent = approach(percent, 1, 0.01);

if (percent >= 0.8)
{
    bubble_alpha = approach(bubble_alpha, 1, 0.05);
    
    if (!played_bubble_sound)
    {
        audio_play_sound_on(controller.audio, snd_micro_pistol_angel_speech, 0, 0);
        played_bubble_sound = true;
    }
}
