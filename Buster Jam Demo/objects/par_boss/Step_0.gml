testvariablenothing = false;
timer_logic(0);
timer_logic(1);
timer_logic(2);
hp_ind += ((sprite_get_speed(spr_trans_hp) / 60) * global.delta_game_factor);

if (instance_exists(obj_frenzy))
{
    if (timer[0] != -1)
    {
        pitch = approach(pitch, 0, 1 / boss_delay);
        audio_sound_pitch(obj_frenzy.music_play, pitch);
    }
}

if (!global.debug)
    exit;

if (keyboard_check_pressed(ord("0")))
{
    with (obj_frenzy)
        audio_sound_set_track_position(music_play, 114);
}

if (keyboard_check_pressed(ord("1")))
    global.hp = 1;

if (keyboard_check_pressed(ord("2")))
{
    with (obj_frenzy)
    {
    }
}
