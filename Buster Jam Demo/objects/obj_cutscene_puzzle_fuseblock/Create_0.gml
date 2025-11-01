testvariablenothing = false;
bgm_play = -4;
event_inherited();
array_timers = [];
scene_path = "Dialogue/W1/puzzle_ogre.json";
array_push(global.save_data.puzzles_solved, "boomtown_fuseblock_boulder");
events = [function()
{
    event_delay(3);
}, function()
{
    event_camera_setup();
}, function()
{
    event_delay(60);
}, function()
{
    with (obj_map_npc_boulder)
        event_shake();
}, function()
{
    event_delay(60);
}, function()
{
    with (obj_map_npc_boulder)
        event_fly();
}, function()
{
    event_delay(90);
}, function()
{
    event_end();
}];
