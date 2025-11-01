with (controller)
    event_set_time(16);

instance_create_micro(0, 0, "Behind2", obj_micro_gartjump_bg);
instance_create_micro(0, ystart + 615, "Over2", obj_micro_gartjump_razor);
instance_create_micro(controller.game_width, ystart + 615, "Over2", obj_micro_gartjump_razor);
controller.win = true;
