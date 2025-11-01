scene[0] = "Dialogue/W1/puzzle_boulder.json";
var _beat = array_contains(global.save_data.puzzles_solved, "boomtown_fuseblock_boulder");

if (_beat)
{
    with (obj_map_npc_boulder)
        instance_destroy();
    
    with (obj_map_fuse_puzzle)
        event_auto_beat();
    
    instance_destroy();
}
