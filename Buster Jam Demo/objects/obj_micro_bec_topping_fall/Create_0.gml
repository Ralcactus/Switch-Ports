vspd = 10.5;
landed = false;
failed = false;
lost = false;
xscale = 1;
yscale = 1;
percent_scale = 1;
timer[0] = 10;

timer_func[0] = function()
{
    var _inst = instance_create_micro(x, y, "Behind", obj_micro_bec_topping_trail);
    _inst.sprite_index = sprite_index;
};
