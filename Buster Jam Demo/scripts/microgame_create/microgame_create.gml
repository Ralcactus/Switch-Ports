function microgame_create(arg0, arg1, arg2, arg3 = false, arg4 = true, arg5 = true, arg6 = false, arg7 = true, arg8 = undefined)
{
    _game = "firework";
    var _data = json_load(arg2, arg7);
    var _controller = instance_create_layer(arg0, arg1, "GUI", obj_microgame_controller);
    _controller.ID = global.micro_id_total;
    _controller.game_width = _data.game_width;
    _controller.game_height = _data.game_height;
    var _str = string_concat(_data.splash_text, "!");
    _controller.splash_text = _str;
    _controller.source = id;
    _controller.music = arg5;
    _controller.json = arg2;
    _controller.player = 0;
    _controller.drawself = arg6;
    _controller.fun = arg8;
    
    if (struct_exists(_data, "texture_group"))
    {
        _controller.texture_group = _data.texture_group;
        
        with (_controller)
            timer[timer_prefetch] = 25;
    }
    
    if (struct_exists(_data, "scale_res"))
        _controller.scale_res = _data.scale_res;
    else
        _controller.scale_res = 1.06;
    
    global.micro_id_total++;
    _controller.instances_create = _data.instances;
    _controller.trans = arg4;
    
    if (arg3)
        _controller.bg = instance_create_depth(0, 0, _controller.depth + 1, obj_frenzy_bg);
    
    return _controller.id;
}
