cutscene = obj_map_cutscene_firstwall;
var _beaten = array_contains(global.save_data.frenzies_beaten, "boomtown_map_statue");

if (_beaten)
    instance_destroy();
