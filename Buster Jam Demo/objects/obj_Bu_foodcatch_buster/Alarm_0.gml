pattern[0] = [665 - (1920 - controller.game_width), 1294];
pattern[1] = [1627 - (1920 - controller.game_width), 897];
pattern[2] = [controller.game_width / 2, (controller.game_width / 2) - 500];
pattern[3] = [controller.game_width / 2, (controller.game_width / 2) + 500];
var _choose = irandom_range(0, array_length(pattern) - 1);
var _swap = choose(true, false);

if (_swap)
{
    var _0 = pattern[_choose][0];
    var _1 = pattern[_choose][1];
    pattern[_choose][0] = _1;
    pattern[_choose][1] = _0;
}

x = pattern[_choose][0];
x += irandom_range(-60, 60);
var _inst = instance_create_layer(pattern[_choose][1] + irandom_range(-60, 60), 0 - sprite_get_height(spr_Bu_foodcatch_food) - 100 - 80, "Over", obj_Bu_foodcatch_food);
_inst.controller = controller;
_inst.ID = ID;
