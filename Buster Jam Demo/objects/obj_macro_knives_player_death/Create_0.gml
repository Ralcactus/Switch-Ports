testvariablenothing = false;
anim_init();
timer[0] = 30;

timer_func[0] = function()
{
    var _inst = instance_create_layer(0, 0, layer, obj_macro_lose);
    _inst.restart_room = rm_boomtown_boss;
};

shake = 1;
