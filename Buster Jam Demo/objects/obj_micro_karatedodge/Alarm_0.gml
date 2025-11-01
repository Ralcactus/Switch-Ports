controller.microgame_hspd = 28;
var _inst = instance_create_layer(0, controller.game_height, "Middle", obj_micro_karatedodge_ground);
_inst.ID = ID;
_inst.controller = controller;
var _h = sprite_get_height(spr_micro_karatedodge_ground);
var _w = sprite_get_width(spr_micro_karatedodge_run);
_inst = instance_create_micro(controller.game_width - _w - 50, controller.game_height - _h, "Over", obj_micro_karatedodge_player);
var _spikes = obj_micro_karatedodge_spikes;
var _ceil = obj_micro_karatedodge_ceiling;
var _obstacles_order = [_spikes, _ceil, _spikes, _ceil];
_obstacles_order = array_shuffle(_obstacles_order);
var _sep = 1600;

for (var i = 0; i < array_length(_obstacles_order); i++)
{
    var _x = -520 - (_sep * i);
    var _obj = _obstacles_order[i];
    var _y;
    
    if (_obj == obj_micro_karatedodge_spikes)
        _y = controller.game_height - sprite_get_height(spr_micro_karatedodge_spikes);
    else
        _y = 0;
    
    _inst = instance_create_layer(_x, _y, "Middle", _obj);
    _inst.ID = ID;
    _inst.controller = controller;
}

controller.win = true;
ready = true;
