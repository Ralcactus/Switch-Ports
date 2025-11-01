if (surface_should_create)
{
    if (!surface_exists(surf))
        surf = surface_create(game_width, game_height);
    
    view_surface_id[view] = surf;
}

timer_logic(2);
timer_logic(3);
timer_logic(4);
timer_logic(5);
timer_logic(6);
timer_logic(7);
timer_logic(8);

if (splash_go)
    event_user(0);

if (scale_inout)
{
    if (out && !instance_exists(obj_boss_tutorial))
    {
        percent_in = approach(percent_in, 1, 0.1111111111111111);
        scale_in = use_curve(acurv_linear, percent_in, "in", 1, 0);
        
        if (scale_in <= 0)
            timer_func[4]();
        
        timer_alpha = approach(timer_alpha, 0, 0.15);
    }
    else if (has_splash || draw_instances)
    {
        scale_in = easy_smooth(scale_in, 1, 4.5);
    }
}

if (!ready)
    exit;

splash_alpha_bg = approach(splash_alpha_bg, 0, 0.12);

if (!out)
    timer_alpha = approach(timer_alpha, 1, 0.1);

instances = [];

with (par_microgame)
{
    visible = false;
    
    if (ID == other.ID)
        array_push(other.instances, id);
}

var _func = function(arg0, arg1)
{
    return arg1.depth - arg0.depth;
};

array_sort(instances, _func);
timer_logic(0);
timer_logic(1);

for (var i = 0; i < 2; i++)
    screenshake[i] = approach(screenshake[i], 0, screenshake_dec);

var _w = game_width;
var _h = game_height;
var _x = 0 + ((_w / 2) * (1 - zoom));
var _y = 0 + ((_h / 2) * (1 - zoom));
camera_set_view_size(view_camera[view], _w * zoom * zoom_res, _h * zoom * zoom_res);
x = _x;
y = _y;
zoom = easy_smooth(zoom, 1, 2.2);
var _shakeX = random_range(-screenshake[0], screenshake[0]);
var _shakeY = random_range(-screenshake[1], screenshake[1]);
camera_set_view_pos(view_camera[view], x + _shakeX, y + _shakeY);

if (audio_is_playing(micro_bgm_play))
{
    var _bgm = micro_bgm_play;
    
    if (audio_is_playing(_bgm) && bpm != -4)
    {
        var _pos = audio_sound_get_track_position(_bgm);
        var _beat = false;
        
        while (((beats - 1) * time_bpm_to_seconds(bpm)) >= _pos)
        {
            beats--;
            
            if (((beats - 1) * time_bpm_to_seconds(bpm)) < _pos)
                beats--;
        }
        
        while (_pos >= (time_bpm_to_seconds(bpm) * beats))
        {
            beats++;
            _beat = true;
        }
        
        if (_beat)
            global.beat = true;
    }
}

if audio_emitter_exists(audio)
	audio_emitter_pitch(audio, global.speedup);
event_user(1);
