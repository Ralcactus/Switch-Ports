anim_logic();

if (input_check_pressed("jump", player) && !swing && !deac)
{
    swing = true;
    swing_mask = true;
    anim_index = 0;
    anim_play(spr_micro_demoswing_man_swing);
    audio_play_sound_on(controller.audio, snd_micro_demoswing_batswing, false, 0);
}

timer_logic(0);
yoff = approach(yoff, 0, 0.2);
