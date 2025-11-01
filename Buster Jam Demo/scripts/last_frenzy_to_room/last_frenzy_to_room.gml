function last_frenzy_to_room(arg0)
{
    var _struct = 
    {
        undefined: 
        {
            rm: rm_boomtown_intro,
            spawnID: 0,
            rm: rm_boomtown_intro,
            spawnID: 0
        },
        boomtown_map_statue: 
        {
            rm: rm_boomtown_wall,
            spawnID: 0,
            rm_beat: rm_boomtown_wall,
            spawnID_beat: 2
        },
        boomtown_boss_blackknives: 
        {
            rm: rm_boomtown_stairs,
            spawnID: 0,
            rm_beat: rm_boomtown_stairs,
            spawnID: 0
        }
    };
    var _result = struct_get(_struct, arg0);
    return _result;
}
