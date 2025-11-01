positions = [238, 622, 1006];
coin = irandom_range(0, 2);
swaps = [[0, 1], [2, 1], [0, 2]];
swaps = array_shuffle(swaps);
swap_objs = [];
var _inst = instance_create_micro(positions[0], 297, "Over1", obj_micro_cratememory_crate);
_inst.ind = 0;
swap_objs[0] = _inst;
_inst = instance_create_micro(positions[1], 297, "Over1", obj_micro_cratememory_crate);
_inst.ind = 1;
swap_objs[1] = _inst;
_inst = instance_create_micro(positions[2], 297, "Over1", obj_micro_cratememory_crate);
_inst.ind = 2;
swap_objs[2] = _inst;

with (controller)
    event_set_time(20);

timer[0] = 25;
controller.win = false;
