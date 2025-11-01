with (controller)
    event_set_time(8);

var _inst = instance_create_micro(0, 0, "Over", obj_micro_demoswing_man);
_inst.hits_needed = balls;
controller.win = false;
timer[0] = irandom_range(35, 90);
