drawself = false;
scale_out = 1;
surf_timer = -4;
win = false;
ended = false;
beats = 0;
music = true;

if (instance_exists(par_boss))
    scale_in = false;
else
    scale_in = true;

bg = -4;
trans = true;
global.game_music = -4;
surf = -4;
xscale = 1;
yscale = 1;
scale = 1.02;
angle = 0;
time = 0;
time_xmove = 0;
time_ymove = 0;
xmove = 0;
ymove = 0;
xmove_length = 0;
ymove_length = 0;
xmove_spd = 0;
ymove_spd = 0;
scroll_xspd = 0;
scroll_x = 0;
tear = false;
tear_y = false;
bounce_height = -8;
bounce_mult = 1;
bounce = false;
bounce_y = 0;
bounce_grav = 0.3;
bounce_vspd = 0;
jumpcut_xrange = 0;
jumpcut_yrange = 0;
jumpcut_x = 0;
jumpcut_y = 0;
jumpcut_off = 0;
shake = 0;
audio = audio_emitter_create();
spark_x = path_get_point_x(pth_timer, 0);
spark_y = path_get_point_y(pth_timer, 0);
spark_xTo = spark_x;
spark_yTo = spark_y;
bom_shake = 0;
last_timer = 999;
timer_alpha = 0;
timer_in = false;
time_start = 60 * time_bpm_to_seconds(140) * 7;

timer_func[0] = function()
{
    ended = true;
    
    if (!scored && win)
        scr_micro_win();
};

timer_func[1] = function()
{
    with (par_boss)
        event_user(0);
    
    out = true;
    audio_emitter_gain(audio, 0);
    
    if (instance_exists(obj_frenzy) && audio_is_playing(obj_frenzy.music_play))
        audio_sound_gain(obj_frenzy.music_play, 1, 0);
    else if (instance_exists(obj_boss_tutorial))
        audio_sound_gain(obj_boss_tutorial.music_play, 1, 0);
    
    if (micro_bgm_play != -4)
    {
        audio_stop_sound(micro_bgm_play);
        
        if (audio_is_playing(global.bgm_play))
            audio_resume_sound(global.bgm_play);
    }
    
    with (source)
    {
        if (other.win)
            event_micro_win();
        else
            event_micro_loss();
    }
};

event_set_time = function(arg0 = 7)
{
    timer[0] = 60 * (time_bpm_to_seconds(140) * arg0);
    timer[1] = timer[0] + (60 * time_bpm_to_seconds(140));
    var _timer = (timer[0] / time_start) * 7;
    
    if (_timer < 0)
        _timer = 0;
    
    spark_xTo = path_get_point_x(pth_timer, 7 - min(_timer, 7));
    spark_yTo = path_get_point_y(pth_timer, 7 - min(_timer, 7));
    spark_x = easy_smooth(spark_x, spark_xTo, 2);
    spark_y = easy_smooth(spark_y, spark_yTo, 2);
};

event_set_time();
timer[2] = 60 * time_bpm_to_seconds(140) * 3;
timer[5] = timer[2];

timer_func[2] = function()
{
    if (texturegroup_get_status(texture_group) != 3)
    {
        timer[2] = 2;
        exit;
    }
    
    with (obj_frenzy)
        overlay_in = true;
    
    scale_in = true;
    
    for (var i = 0; i < array_length(instances_create); i++)
    {
        var _inst = instances_create[i];
        var _asset = asset_get_index(_inst.asset);
        var _type = _inst.type;
        var _x = _inst.x;
        var _y = _inst.y;
        var _ind = _inst.ind;
        var _xscale = _inst.xscale;
        var _yscale = _inst.yscale;
        var _layer = layer_get_id(_inst.layer);
        var _new;
        
        if (_type == 0)
        {
            _new = instance_create_layer(_x, _y, _layer, _asset);
        }
        else if (_type == 1)
        {
            _new = instance_create_layer(_x, _y, _layer, obj_spriteasset_microgame);
            _new.sprite_index = _asset;
        }
        
        _new.image_index = _ind;
        _new.image_xscale = _xscale;
        _new.image_yscale = _yscale;
        _new.controller = id;
        _new.ID = ID;
        _new.player = player;
        _new.visible = false;
    }
    
    ready = true;
    instances_create = [];
    timer[4] = 1;
};

timer[3] = 12;

timer_func[3] = function()
{
    splash_go = true;
};

timer[4] = -1;

timer_func[4] = function()
{
    splash_text_out = true;
    
    if (global.game_music != -4 && music)
    {
        var _snd = asset_get_index(global.game_music);
        
        if (_snd)
        {
            if (audio_is_playing(global.bgm_play))
                audio_pause_sound(global.bgm_play);
            
            micro_bgm_play = audio_play_sound(_snd, 0, 0);
            audio_sound_pitch(micro_bgm_play, global.speedup);
            
            if (instance_exists(obj_frenzy) && audio_is_playing(obj_frenzy.music_play))
                audio_sound_gain(obj_frenzy.music_play, 0, 0);
        }
    }
};

event_pause_music = function()
{
    if (global.game_music != -4 && music && audio_is_playing(global.bgm_play))
        audio_pause_sound(global.bgm_play);
};

timer_func[5] = function()
{
    timer_in = true;
};

jumpcut_delay = 30;
timer[6] = -1;

timer_func[6] = function()
{
    if (jumpcut_xrange == 0 && jumpcut_yrange == 0)
        exit;
    
    jumpcut_x = random_range(-jumpcut_xrange, jumpcut_xrange);
    jumpcut_y = random_range(-jumpcut_yrange, jumpcut_yrange);
    jumpcut_off = 1;
    timer[6] = jumpcut_delay;
};

micro_bgm_play = -4;
out = false;
percent_in = 0;
out_scale = 0;
circle_width = 0;
circle_height = 0;
surf_alpha = 1;
ready = false;
instances = [];
splash_alpha = 0;
splash_scale = 8;
splash_alpha_bg = 1.1;
splash_percent = 0;
splash_go = false;
splash_text_out = false;
texture_group = -4;
alarm[0] = 5;
fullscreen = false;
alarm[1] = 1;
surf_splash = -4;
out_scale_spd = 0.05;

event_stop_music = function()
{
    audio_stop_sound(micro_bgm_play);
};

timer_alpha_override = 1;
overlay_alpha = 2.25;
splash_bg_ind = irandom_range(0, sprite_get_number(spr_micro_splash_bg_w1) - 1);
outline_col = 16777215;
microgame_hspd = 0;

for (var i = 0; i < 2; i++)
{
    screenshake[i] = 0;
    screenshake_draw[i] = 0;
}

screenshake_dec = 0.5;
scored = false;
