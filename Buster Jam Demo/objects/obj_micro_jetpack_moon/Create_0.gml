event_inherited();
anim_init();

event_draw = function()
{
    draw_sprite(anim_sprite, anim_index, x, y);
};

timer[0] = -1;

timer_func[0] = function()
{
    audio_play_sound_on(controller.audio, snd_micro_jetpack_moonlaugh, false, 0);
};
