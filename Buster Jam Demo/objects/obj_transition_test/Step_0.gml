testvariablenothing = false;

event_delete = function()
{
    with (par_boss_transition)
        instance_destroy();
    
    if (audio_is_playing(music_play))
        audio_stop_sound(music_play);
};

var _look = scr_get_keyboard_num();

if (_look > (array_length(trans) - 1))
    _look = -1;

if (_look == 0 || _look)
{
    if (audio_is_playing(music_play))
        event_delete();
    
    instance_create_layer(0, 0, layer, trans[_look]);
    music_play = audio_play_sound(bgm_subwayboss_140, 0, 0);
}

if (keyboard_check_pressed(vk_delete))
    event_delete();

if (keyboard_check_pressed(vk_enter))
{
    audio_stop_all();
    room_goto(rm_boomtown_boss);
}

if (keyboard_check_pressed(vk_escape))
    draw_texture_flush();
