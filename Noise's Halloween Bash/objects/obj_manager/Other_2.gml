global.pumpkintotal = 0;
global.timer = 0;
global.collect = 0;
global.combo = 0;
var _validcrates = [];
array_copy(_validcrates, 0, global.levelrooms, 0, array_length(global.levelrooms) - 2);
global.cratecount = count_in_room(_validcrates, function(_room_inst, _index)
{
    return object_is_ancestor(asset_get_index(_room_inst.object_index), par_crate) || _room_inst.object_index == object_get_name(obj_destroyablenitroarrow);
});
global.destroyedcount = 0;
global.gems = 0;
global.playerhit = false;
global.switchstate = true;
global.saveroom = ds_map_create();
global.respawnroom = ds_map_create();
global.game_cycleMS = 0;
global.game_cycleF = 0;
