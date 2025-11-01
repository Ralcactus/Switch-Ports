vspd = -6.5;
fadeOut = false;
combo = 1;
timer[0] = 95;

timer_func[0] = function()
{
    get_cams();
    var _obj;
    
    if (room == rm_tutorial_s1a5)
        _obj = obj_fx_combo_bar_tutorial;
    else
        _obj = obj_fx_combo_bar;
    
    var _spawn = instance_create_depth(x - camx, y - camy, layer_get_depth(layer_get_id("GUI")) - 1, _obj);
    _spawn.image_index = combo - 2;
    instance_destroy();
};

scale_percent = 0;
