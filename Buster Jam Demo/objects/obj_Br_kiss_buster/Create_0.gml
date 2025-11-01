anim_init();
shake = 0;
effect_alpha = 0;
effect_scale = 1;
timer[0] = -1;

timer_func[0] = function()
{
    var _inst = instance_create_layer(0, 0, "Over1", obj_Br_kiss_win);
    _inst.controller = controller;
    _inst.ID = ID;
    
    with (_inst)
        event_user(0);
};
