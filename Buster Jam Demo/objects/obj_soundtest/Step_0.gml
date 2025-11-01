testvariablenothing = false;
time += global.delta_game_factor;
var _column;

if (mouse_x >= 960)
    _column = 1;
else
    _column = 0;

if (mouse_check_button_pressed(mb_right))
{
    if (audio_is_playing(audio_played[_column]))
    {
        var _paused = audio_is_paused(audio_played[_column]);
        
        if (_paused)
            audio_resume_sound(audio_played[_column]);
        else
            audio_pause_sound(audio_played[_column]);
    }
}

page[_column] -= mouse_wheel_up() - mouse_wheel_down();
page[_column] = clamp(page[_column], 0, page_max[_column]);
window_set_size(2304, 1296);
_column = selected[0];
var _index = selected[1];
var _snd = data_order[_column][_index];

if (keyboard_check_pressed(vk_space))
{
    if (audio_is_playing(audio_played[_column]))
        audio_stop_sound(audio_played[_column]);
    
    audio_played[_column] = audio_play_sound(asset_get_index(_snd[0]), 0, false);
}

if (keyboard_check_pressed(vk_delete))
    audio_stop_all();

if (keyboard_check_pressed(vk_shift))
{
    var _prev_vol = _snd[1];
    var _str = get_string("Enter Volume", _prev_vol);
    
    if (_str != "")
    {
        var _vol = real(_str);
        
        if (_column == 0)
            obj_persistent.sounds[_index][1] = _vol;
        else
            obj_persistent.musics[_index][1] = _vol;
        
        audio_sound_gain(asset_get_index(_snd[0]), _vol, 0);
    }
}

if (keyboard_check_pressed(vk_enter))
{
    var _str = json_stringify(data_order, true);
    var _open = file_text_open_write(get_save_filename("*.json", "audio_data.json"));
    file_text_write_string(_open, _str);
    file_text_close(_open);
}

data_order = [obj_persistent.sounds, obj_persistent.musics];
