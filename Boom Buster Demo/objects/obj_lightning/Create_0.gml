image_alpha = 0.6;
anim_init();
audio_stop_play(snd_thunder, 0, 0);
timer[0] = 90;

timer_func[0] = function()
{
    audio_stop_play(snd_lightning, 0, 0);
    screen_shake(12, 12, 0.25);
    instance_create_depth(0, 0, layer_get_depth(layer_get_id("GUI")) - 2, obj_lightning_effect);
    anim_index = 0;
    image_alpha = 1;
    strike = true;
    mask_index = spr_lightning;
};

strike = false;
anim_sprite = spr_lightning;

event_animend = function()
{
    if (strike)
        instance_destroy();
};
