var _score = 1 + (0.5 * combo);
combo++;
combo_timer = 8;
comboScore += _score;

if (instance_exists(myScoreFX))
    instance_destroy(myScoreFX);

myScoreFX = score_spawn(x + 128, y, comboScore, undefined, false);
score_add(_score);
audio_stop_play(snd_kaching, 0, 0);
audio_stop_play(snd_thunk, 0, 0);
anim_sprite = spr_pipe_enter;
anim_index = 0;

if (combo >= 2)
{
    if (!instance_exists(lastCombo))
        lastCombo = instance_create_layer(x + 128, y - 80, "GUI", obj_fx_combo);
    
    lastCombo.combo = combo;
    
    with (lastCombo)
        event_user(0);
    
    if (audio_is_playing(lastComboSnd))
        audio_stop_sound(lastComboSnd);
    
    lastComboSnd = audio_play_sound(asset_get_index(string("snd_combo{0}", min(combo, 8))), 0, 0);
    
    if (combo >= 4)
        audio_stop_play(voice_buster_laugh, 0, 0);
}
