function room_goto_fade(arg0, arg1 = 0, arg2 = -4, arg3 = false)
{
    var _inst;
    
    if (layer_exists("GUI"))
        _inst = instance_create_layer(0, 0, "GUI", obj_transition_fade);
    else
        _inst = instance_create_depth(0, 0, -9999, obj_transition_fade);
    
    _inst.myroom = arg0;
    _inst.delay = arg1;
    _inst.fadeout_snd = arg2;
    _inst.stop_all_audio = arg3;
}
