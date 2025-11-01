event_inherited();
events = [function()
{
    event_camera_setup();
}, function()
{
    event_actor_create(0, obj_map_player_follower.x, obj_map_player_follower.y, obj_map_player_follower.z);
}, function()
{
    event_follower_visible(false);
}, function()
{
    event_actor_auto(0, 1);
}, function()
{
    event_actor_speed(0);
}, function()
{
    event_actor_move(0, 0, true);
}, function()
{
    event_player_visible(false);
}, function()
{
    event_actor_create(1, obj_map_player.x, obj_map_player.y, obj_map_player.z);
}, function()
{
    event_player_tie_actor(1);
}, function()
{
    event_actor_auto(1, 0);
}, function()
{
    event_actor_speed(1);
}, function()
{
    event_actor_move(1, 4, false);
}, function()
{
    event_actor_sprite(1, obj_map_player.anim_sprite, obj_map_player.anim_index);
}, function()
{
    event_camera_move(2304, 768);
}, function()
{
    event_camera_percent_tie_actor(0);
}, function()
{
    event_pause();
}, function()
{
    event_delay(90);
}, function()
{
    event_actor_move(0, 1, true);
}, function()
{
    event_pause();
}, function()
{
    event_delay(60);
}, function()
{
    event_actor_move(0, 2, true);
}, function()
{
    event_pause();
}, function()
{
    event_delay(60);
}, function()
{
    event_actor_facing(0, -1);
}, function()
{
    event_delay(60);
}, function()
{
    event_create_scene("Dialogue/W1/first_wall.json", 0);
}, function()
{
    event_actor_move(0, [obj_map_player_follower.x, obj_map_player_follower.y], true);
}, function()
{
    event_camera_return();
}, function()
{
    event_pause();
}, function()
{
    event_end();
}];
