testvariablenothing = false;
trans_done = 0;

for (var i = 0; i < 4; i++)
{
    hp_scale[i] = 1;
    hp_percent[i] = 1;
}

global.hp_max = 4;
global.hp = global.hp_max;
hp_beat = 0;
hp_ind = 0;
global.frenzy_music = -4;
global.frenzy_music_list = [];
hp_x = 128;
hp_y = 992;
score_x = 1472;
score_y = 896;
no_blend = false;
surf_trans = -4;
games_done = false;

event_boss = function()
{
    event_user(4);
};

loss = false;
macro_room = rm_boomtown_boss_macro;
macro_textures_fetch = [];
timer[0] = -1;

timer_func[0] = function()
{
    var _done = true;
    
    for (var i = 0; i < array_length(macro_textures_fetch); i++)
    {
        if (texturegroup_get_status(macro_textures_fetch[i]) != 3)
        {
            _done = false;
            break;
        }
    }
    
    if (!_done)
    {
        timer[0] = 1;
        print("not done");
        exit;
    }
    
    audio_stop_sound(global.frenzy_music);
    room_goto(macro_room);
};

texture_prefetch("gui_micro");
texture_prefetch("tg_frenzy");
texture_prefetch("fonts");
texture_prefetch("boss_common");
scr_unload_ag_map();
alarm[0] = 10;
my_audiogroup = -4;
hp = global.hp;

event_loseHP = function()
{
    timer[1] = time_bpm_to_seconds(140) * 60 * 2;
};

timer[1] = -1;

timer_func[1] = function()
{
    hp--;
    var _sep = 17;
    var _w = sprite_get_width(spr_trans_hp) + _sep;
    var _y = hp_y;
    var _x = hp_x + (_w * hp);
    instance_create_layer(_x, _y, layer, obj_frenzy_hp_lose);
    audio_play_sound(snd_shatter, 0, 0);
};

timer[2] = -1;

timer_func[2] = function()
{
    for (var i = 0; i < array_length(macro_textures_fetch); i++)
        texturegroup_load(macro_textures_fetch[i]);
    
    timer[0] = boss_delay;
};

boss_delay = 90;
pitch = 1;
