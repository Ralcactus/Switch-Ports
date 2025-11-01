event_inherited();
scene = "Dialogue/W1/subway_stairs.json";
events = [function()
{
    event_delay(60);
}, function()
{
    event_create_scene(scene, 0);
}, function()
{
    event_end();
}];
array_push(global.save_data.cutscenes_watched, "boomtown_subway_stairs");
