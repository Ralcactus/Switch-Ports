if (global.opening)
{
    bgm = audio_play_sound(bgm_buster, 0, true);
    bpm = 85;
}
else
{
    bgm = audio_play_sound(bgm_menu, 0, true);
    bpm = 50;
    started = true;
    state = 3;
    instance_create_layer(0, 0, "GUI", obj_stage_select);
    var _controls = instance_create_depth(0, 0, depth - 1, obj_controls_popup);
    _controls.image_alpha = 0.55;
}

loaded = true;
