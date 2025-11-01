timer[0] = 30;

timer_func[0] = function()
{
    var _inst = instance_create_micro(0, 0, "Over1", obj_micro_karatedodge_fail);
    _inst.ind = death_ind;
};

death_ind = 0;
image_speed = 0;
