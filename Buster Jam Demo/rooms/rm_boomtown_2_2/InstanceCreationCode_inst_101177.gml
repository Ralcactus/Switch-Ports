scene[0] = "Dialogue/W1/puzzle_ogre.json";
scene[1] = "Dialogue/W1/puzzle_ogre.json";
scene[2] = "Dialogue/W1/puzzle_ogre.json";
scene[3] = "Dialogue/W1/puzzle_ogre.json";
scene[4] = "Dialogue/W1/puzzle_ogre.json";
scene[5] = "Dialogue/W1/puzzle_ogre.json";
scene[6] = "Dialogue/W1/puzzle_ogre.json";
starts = 
{
    _0: 0,
    _1: 8,
    _2: 8,
    _3: 8,
    _4: 8,
    _5: 17,
    _6: 8
};
var _beat = array_contains(global.save_data.puzzles_solved, "boomtown_fuseblock_ogre");

if (_beat)
{
    with (obj_map_npc_ogre)
        instance_destroy();
    
    with (obj_map_fuse_puzzle)
        event_auto_beat();
    
    instance_destroy();
}
