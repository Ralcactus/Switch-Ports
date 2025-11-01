testvariablenothing = false;
hp_ind = 0;
hp_x = 128;
hp_y = 992;
score_x = -999;
score_y = -999;
hp = global.hp_max;

for (var i = 0; i < 8; i++)
    hp_scale[i] = 1;

timer[0] = -1;

timer_func[0] = function()
{
};

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
    var _inst = instance_create_layer(_x, _y, layer, obj_frenzy_hp_lose);
    audio_play_sound(snd_shatter, 0, 0);
};

global.hp_spr = spr_trans_hp;
global.hp_spr_lose = spr_trans_hp_lost;
