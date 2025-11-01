controller.win = true;
var _x = x + 100;
var _min = 800;

for (var i = 0; i < 5; i++)
{
    _inst = instance_create_layer(_x + irandom_range(_min, 1100), y, "Middle", obj_dinorun_cactus);
    _x = _inst.x;
    _inst.controller = controller;
    _inst.ID = ID;
    _min = 550;
}

var _inst = instance_create_layer(0, 0, "Behind2", obj_dinorun_bg);
_inst.controller = controller;
_inst.ID = ID;
controller.microgame_hspd = -10 * mult;
move_clouds = true;
