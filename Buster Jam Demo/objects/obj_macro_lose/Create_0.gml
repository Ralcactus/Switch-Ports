testvariablenothing = false;
restart_room = room;
y = -1080;
ystart = y;
skew = 100;
percent = 0;
out = false;
state = 0;
timer[0] = -1;

timer_func[0] = function()
{
    room_goto(rm_macro_lose);
    state = 2;
    timer[1] = time_bpm_to_seconds(140) * 60 * 2;
};

hp_x = 672;

for (var i = 0; i < global.hp_max; i++)
    hp_scale[i] = 1;

hp_ind = 0;

if (global.hp <= 1)
    audio_sound_gain(global.bgm_play, 0, 3000);

hp = global.hp;
timer[1] = -1;

timer_func[1] = function()
{
    hp--;
    global.hp--;
    var _sep = 17;
    var _w = sprite_get_width(spr_trans_hp) + _sep;
    var _y = hp_y;
    var _x = hp_x + (_w * hp);
    instance_create_layer(_x, _y, layer, obj_frenzy_hp_lose);
    audio_play_sound(snd_shatter, 0, 0);
    
    if (global.hp <= 0)
    {
        persistent = 0;
        timer[3] = 30;
        timer[2] = -1;
    }
    else
    {
        timer[2] = time_bpm_to_seconds(140) * 60 * 3;
    }
};

timer[2] = -1;

timer_func[2] = function()
{
    room_goto(rm_boomtown_boss_macro_game);
    out = true;
    state = 3;
    percent = 0;
};

timer[3] = -1;

timer_func[3] = function()
{
    audio_play_sound(bgm_map_lose_final, 0, 0);
    timer[4] = 180;
};

timer[4] = -1;

timer_func[4] = function()
{
    instance_create_layer(0, 0, layer, obj_frenzy_gameover);
    
    if (audio_is_playing(global.bgm_play))
        audio_stop_sound(global.bgm_play);
};
