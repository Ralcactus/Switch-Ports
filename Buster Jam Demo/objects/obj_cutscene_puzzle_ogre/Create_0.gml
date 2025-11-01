testvariablenothing = false;
bgm_play = -4;
event_inherited();
array_timers = [];
scene_path = "Dialogue/W1/puzzle_ogre.json";
array_push(global.save_data.puzzles_solved, "boomtown_fuseblock_ogre");
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
    event_camera_move(7392, undefined, true, 0.04);
}, function()
{
    event_pause();
}, function()
{
    with (obj_map_npc_ogre)
        event_shake();
}, function()
{
    event_delay(60);
}, function()
{
    with (obj_map_npc_ogre)
        event_fly();
}, function()
{
    event_delay(15);
}, function()
{
    scene_create(scene_path, 11);
}, function()
{
    event_pause();
}, function()
{
    event_camera_move(cam_start_xpos, undefined, true, 0.02);
}, function()
{
    event_pause();
}, function()
{
    event_delay(30);
}, function()
{
    scene_create(scene_path, 12);
}, function()
{
    event_end();
}];
