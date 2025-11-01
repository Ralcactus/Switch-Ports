if (!loaded)
    exit;

track_position = audio_sound_get_track_position(bgm);

if (track_position >= (time_bpm_to_seconds(bpm) * bounces))
{
    bounces++;
    percent_logo_scale = 0;
}

hand_ind += (sprite_get_speed(spr_menu_hand) / 60);

if (hand_ind >= sprite_get_number(spr_menu_hand))
    hand_ind -= hand_ind;

if (track_position < time_bpm_to_seconds(bpm))
    bounces = 1;

percent_logo_scale = approach(percent_logo_scale, 1, 0.05);
logo_scale = use_curve(acurv_basics, percent_logo_scale, "bounce", 0, 0.1);
time++;

if (state == 0)
{
    if (pressed_any(0))
    {
        audio_play_sound(voice_buster_laugh, 0, 0);
        audio_play_sound(snd_thunk, 0, 0);
        audio_play_sound(snd_kaching, 0, 0);
        started = true;
        state = 1;
        alarm[1] = 28;
    }
}

if (started)
{
    any_percent = approach(any_percent, 1, 0.02);
    any_scale = use_curve(acurv_score, any_percent, undefined, 0.7, 1);
}

if (state == 2)
{
    if (explosion.image_index >= 17)
    {
        obj_splash.visible = false;
        instance_create_layer(0, 0, "GUI", obj_title_menu);
        state = 3;
    }
}
