hit = false;
screen_spr = -4;
anim_init();
pal_sprite = -4;
pal_sub = 0;
pal_ind = 0;
scale = 0;
scale_percent = 0;

event_hit = function()
{
    audio_play_sound(snd_thunk, 0, 0);
};
