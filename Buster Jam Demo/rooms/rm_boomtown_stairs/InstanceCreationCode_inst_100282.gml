cutscene = obj_map_cutscene_stairs;
var _watched = array_contains(global.save_data.cutscenes_watched, "boomtown_subway_stairs");

if (_watched)
    instance_destroy();
