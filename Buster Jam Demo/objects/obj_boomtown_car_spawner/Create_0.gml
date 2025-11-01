wait_times_total = [67, 90, 90, 100, 110, 120, 130];
wait_times_total = array_shuffle(wait_times_total);
wait_times = array_concat(wait_times_total, []);
timer[0] = -1;

timer_func[0] = function()
{
    timer[0] = wait_times[0];
    array_delete(wait_times, 0, 1);
    
    if (array_length(wait_times) == 0)
    {
        wait_times = array_concat(wait_times, wait_times_total);
        wait_times = array_shuffle(wait_times);
    }
    
    var _layer;
    
    if (layer == "Instances_Render0")
        _layer = 0;
    else
        _layer = 1;
    
    var _inst = instance_create_layer(x, y, layer, obj_boomtown_car);
    _inst.render_layer = _layer;
    var _spd = 9;
    var _dir;
    
    if (dir == 2)
        _dir = 1;
    else
        _dir = -1;
    
    _inst.hspd = _spd * _dir;
    _inst.facing = _dir;
    _inst.image_xscale = _dir;
    var _spr = choose(spr_boomtown_car, spr_boomtown_car1, spr_boomtown_car2);
    var _pal = pal_boomtown_car;
    var _num = irandom_range(1, 100);
    
    if (_num < 16 && !auto_move && !just_spawned_ad)
    {
        _spr = spr_boomtown_car_ad;
        _inst.x -= 272 * _dir;
        ad_wait = true;
        just_spawned_ad = true;
        timer[1] = 55;
    }
    else if (_num < 22)
    {
        _spr = spr_boomtown_car_beetle;
        _pal = pal_boomtown_car_beetle;
    }
    
    var _max = sprite_get_width(_pal) - 1;
    var _pal_index = irandom_range(1, _max + 1);
    
    with (_inst)
    {
        anim_play(_spr);
        pal = _pal;
        pal_index = _pal_index;
    }
    
    if (auto_move)
    {
        auto_time += timer[0];
        _inst.x += auto_time * _spd * _dir;
    }
    
    if (!ad_wait)
        just_spawned_ad = false;
};

timer[1] = -1;

timer_func[1] = function()
{
    ad_wait = false;
};

alarm[0] = 1;
ad_wait = false;
just_spawned_ad = false;
