event_inherited();
scene = "Dialogue/W1/boomtown_opening.json";
events = [function()
{
    event_delay(60);
}, function()
{
    event_create_scene(scene, 25);
}, function()
{
    event_end();
}];
array_push(global.save_data.cutscenes_watched, "boomtown_opening");
