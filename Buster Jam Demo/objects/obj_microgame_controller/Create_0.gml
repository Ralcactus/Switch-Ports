testvariablenothing = false;
fun = undefined;
bpm = 140;

if (instance_exists(obj_map_controller))
    has_splash = true;
else
    has_splash = false;

if (instance_exists(par_boss))
    scale_inout = false;
else
    scale_inout = true;

zoom_res = 1;
global.game_music = -4;
global.game_music_loops = false;
micro_bgm_play = -4;
beats = 0;
surface_should_create = false;
splash_go = false;
splash_text = "undefined";
surf_splash = -4;
splash_scale = 8;
splash_alpha = 0;
splash_alpha_bg = 1.3;
splash_percent = 0;
splash_out = false;
splash_yoff = 0;
timer[0] = 60 * time_bpm_to_seconds(bpm) * 7;

timer_func[0] = function()
{
    ended = true;
};

timer_func[1] = function()
{
    audio_emitter_gain(audio, 0);
    
    if (audio_is_playing(global.bgm_play))
        audio_resume_sound(global.bgm_play);
    
    with (source)
    {
        if (other.win)
            event_micro_win();
        else
            event_micro_loss();
    }
    
    out = true;
    percent_in = 0;
    timer[4] = 25;
    
    with (obj_frenzy)
    {
        in = false;
        out = true;
        trans_percent = 0;
    }
};

if (has_splash)
    timer[2] = 60 * time_bpm_to_seconds(bpm) * 3;
else
    timer[2] = 60 * time_bpm_to_seconds(bpm) * 2;

timer_func[2] = function()
{
    if (texturegroup_get_status(texture_group) != 3)
    {
        timer[2] = 1;
        exit;
    }
    
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
        _new.view = view;
    }
    
    ready = true;
    instances_create = [];
    timer[3] = 2;
    timer[5] = 60 * time_bpm_to_seconds(bpm) * 1;
    
    if (global.game_music != -4 && music)
    {
        var _snd = asset_get_index(global.game_music);
        
        if (_snd)
        {
            if (audio_is_playing(global.bgm_play))
                audio_pause_sound(global.bgm_play);
            
            micro_bgm_play = audio_play_sound_on(audio, _snd, global.game_music_loops, 0);
            
            if (instance_exists(obj_frenzy) && audio_is_playing(obj_frenzy.music_play))
                audio_sound_gain(obj_frenzy.music_play, 0, 0);
        }
    }
};

timer[3] = -1;

timer_func[3] = function()
{
    draw_instances = true;
    
    with (obj_frenzy)
    {
        in = true;
        trans_percent = 0;
        
        if (audio_is_playing(loss_play))
        {
            audio_sound_gain(loss_play, 0, 300);
            audio_sound_gain(music_play, 1, 300);
        }
    }
    
    with (par_boss)
        no_blend = false;
    
    with (obj_map_frenzy_controller)
        event_game_in();
};

draw_instances = false;
timer[4] = -1;

timer_func[4] = function()
{
    with (par_microgame)
    {
        if (ID == other.ID)
            instance_destroy();
    }
    
    instance_destroy();
};

timer[5] = -1;

timer_func[5] = function()
{
    splash_out = true;
};

timer_prefetch = 6;
timer[6] = -1;

timer_func[6] = function()
{
    texture_prefetch(texture_group);
};

timer_splashgo = 7;
timer[7] = -1;

timer_func[7] = function()
{
    splash_go = true;
};

jumpcut_delay = 30;
timer[8] = -1;

timer_func[8] = function()
{
    if (jumpcut_xrange == 0 && jumpcut_yrange == 0)
        exit;
    
    jumpcut_x = random_range(-jumpcut_xrange, jumpcut_xrange);
    jumpcut_y = random_range(-jumpcut_yrange, jumpcut_yrange);
    jumpcut_off = 1;
    timer[8] = jumpcut_delay;
    print("jump cut");
};

event_set_time = function(arg0 = 7, arg1 = false)
{
    if (arg1)
        timer_alpha_override = 0;
    
    timer[0] = 60 * (time_bpm_to_seconds(bpm) * arg0);
    timer[1] = timer[0] + (60 * time_bpm_to_seconds(bpm));
};

event_add_time = function(arg0)
{
    timer[0] += 60 * time_bpm_to_seconds(bpm) * arg0;
    timer[1] = timer[0] + (60 * time_bpm_to_seconds(bpm));
};

event_round_time = function(arg0)
{
    var _beat = time_bpm_to_seconds(bpm) * 60;
    timer[0] -= round(timer[0] / _beat) * _beat;
    timer[0] += _beat * arg0;
    timer[1] = timer[0] + (60 * time_bpm_to_seconds(bpm));
};

event_set_time(7);
alarm[0] = 1;
ready = false;
view = 1;
scale = 1;
scale_in = 1;
percent_in = 0;
out = false;
audio = audio_emitter_create();
win = false;
ended = false;
xmove = 0;
ymove = 0;
upside_down = false;
screenshake_draw[0] = 0;
screenshake_draw[1] = 0;
timer_alpha = -0.1;
timer_alpha_override = 1;
time_start = 60 * time_bpm_to_seconds(bpm) * 7;
bom_ind = 0;
bom_spr = spr_microtimer_bom_edge;

bom_spr_switch = function(arg0)
{
    if (bom_spr != arg0)
    {
        bom_spr = arg0;
        bom_ind = 0;
    }
};

spark_pos[7] = [1779, 953];
spark_pos[6] = [1779, 953];
spark_pos[5] = [1504, 956];
spark_pos[4] = [1240, 962];
spark_pos[3] = [991, 962];
spark_pos[2] = [754, 959];
spark_pos[1] = [509, 951];
spark_pos[0] = [281, 953];
spark_ind = 0;
surf = -4;
surf_map = -4;
splash_bg_ind = irandom_range(0, sprite_get_number(spr_micro_splash_bg_w1) - 1);
screenshake[0] = 0;
screenshake[1] = 0;
screenshake_dec = 0.5;
x = 0;
y = 0;
zoom = 1;
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
