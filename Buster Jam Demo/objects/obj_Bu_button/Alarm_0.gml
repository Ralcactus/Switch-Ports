controller.win = true;
x = controller.game_width / 2;
y = controller.game_height / 2;
var _inst = instance_create_layer(0, 0, "Behind2", obj_microgame_bg);
_inst.ID = ID;
_inst.controller = controller;
_inst.col = 0;
