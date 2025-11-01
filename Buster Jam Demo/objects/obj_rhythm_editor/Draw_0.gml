draw_set_font(fnt_subtitle);
var _beat_time = 60 / bpm;
var _pos = audio_sound_get_track_position(bgm_play);

for (var i = 0; i < 100; i++)
{
    draw_sprite(spr_rhythm_pattern, i % 2, 0, (64 * i) + scroll_y);
    draw_text_transformed(200, (64 * i) + scroll_y, _beat_time * i, 0.5, 0.5, 0);
}

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
var _grid;

if (keyboard_check(vk_shift))
    _grid = 32;
else
    _grid = 64;

var mx_snap = floor(_mx / 64) * 64;
var my_snap = floor((_my - scroll_y) / _grid) * _grid;

if (mouse_check_button(mb_middle))
{
    var __my = _my - scroll_y;
    audio_sound_set_track_position(bgm_play, (_beat_time * __my) / 64);
}

var _paused = audio_is_paused(bgm_play);
var _playing = audio_is_playing(bgm_play);

for (var i = 0; i < array_length(events); i++)
{
    if (_paused || !_playing)
        events[i].hit = false;
    
    var _ind = events[i].ind;
    var _time = events[i].time;
    
    if (_playing && !_paused && _pos >= _time && _time >= played_at && !events[i].hit)
    {
        var _snd = audio_stop_play(snd_coin, 0, 0);
        
        if (events[i].ind == 0)
            audio_sound_pitch(_snd, 1.1);
        else
            audio_sound_pitch(_snd, 1.15);
        
        events[i].hit = true;
    }
    
    var _event_beat = _time / _beat_time;
    _y = (_event_beat * 64) + scroll_y;
    draw_sprite(spr_rhythm_event, _ind, 64 * _ind, _y);
    
    if (point_in_rectangle(_mx, _my, 64 * _ind, _y, (64 * _ind) + 64, _y + 64) && mouse_check_button(mb_right))
        array_delete(events, i, 1);
}

if (mx_snap <= 64)
{
    draw_sprite_ext(spr_rhythm_event, 0, mx_snap, my_snap + scroll_y, 1, 1, 0, c_white, 0.4);
    var _time = (my_snap / 64) * _beat_time;
    
    if (mouse_check_button_pressed(mb_left))
    {
        var _struct = 
        {
            ind: mx_snap / 64,
            time: _time,
            hit: false
        };
        array_push(events, _struct);
    }
}

draw_text(500, 20, string("track pos:{0}s", _pos));
var _y = ((_pos / _beat_time) * 64) + scroll_y;
draw_line(0, _y, 128, _y);
