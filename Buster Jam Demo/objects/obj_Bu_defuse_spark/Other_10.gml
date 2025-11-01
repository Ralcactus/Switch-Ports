audio_play_sound_on(controller.audio, snd_explosion, 0, 0);
anim_play(spr_Bu_defuse_explosion);
x = controller.game_width / 2;
y = controller.game_height / 2;
xoff = 0;
yoff = 0;

if (controller.timer[0] > (time_bpm_to_seconds(140) * 60 * 2))
{
    with (controller)
        event_round_time(2);
}
