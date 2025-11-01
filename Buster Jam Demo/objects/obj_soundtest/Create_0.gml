testvariablenothing = false;
time = 0;
data_order = [obj_persistent.sounds, obj_persistent.musics];

for (var i = 0; i < 2; i++)
{
    page[i] = 0;
    page_max[i] = floor(array_length(data_order[i]) / 20);
    selected[i] = 0;
    audio_played[i] = -4;
}

audio_groups = [bgm_endless_jingleA, bgm_endless_jingleB, bgm_endless_lose, bgm_frenzy_gameover, bgm_endless_win];

for (var i = 0; i < array_length(audio_groups); i++)
    audio_group_load(audio_groups[i]);

alarm[0] = 60;
loaded = false;
global.master_vol = 1;
global.sfx_vol = 1;
global.bgm_vol = 1;

with (obj_persistent)
    event_user(0);

var _sort = function(arg0, arg1)
{
    if (arg0[0] < arg1[0])
        return -1;
    else if (arg0[0] > arg1[0])
        return 1;
    else
        return 0;
};

array_sort(data_order[0], _sort);
array_sort(data_order[1], _sort);
