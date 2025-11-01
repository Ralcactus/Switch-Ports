if (collected)
    exit;

collected = true;
audio_stop_play(snd_coin_map, 0, 0);

if (!already_got)
{
    var _key = string("{0} x:{1} y: {2} z: {3}", room_get_name(room), xstart, ystart, zstart);
    ds_map_add(global.map_got, _key, 1);
    global.coins++;
}

vspd = -12;
grav = 0.95;
timer[0] = 28;

if (instance_exists(my_shadow))
    my_shadow.out = true;
