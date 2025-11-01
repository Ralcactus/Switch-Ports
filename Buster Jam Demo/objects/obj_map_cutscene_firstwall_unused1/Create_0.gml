event_inherited();
events = [function()
{
    event_camera_setup();
}, function()
{
    event_actor_create_player_auto(0);
}, function()
{
    event_actor_create_follower_auto(1);
}, function()
{
    event_create_scene("Dialogue/W1/first_wall.json", 0);
}, function()
{
    event_actor_move(0, 0, true);
}, function()
{
    event_camera_move(2304, 768);
}, function()
{
    event_camera_percent_tie_actor(0);
}, function()
{
    event_actor_move(1, 1, false);
}, function()
{
    event_pause();
}, function()
{
    event_delay(30);
}, function()
{
    event_actor_facing(0, -1);
}, function()
{
    event_create_scene("Dialogue/W1/first_wall.json", 1);
}, function()
{
    event_actor_facing(0, 1);
}, function()
{
    event_delay(40);
}, function()
{
    custom_event_createspin();
}, function()
{
    event_actor_visible(0, false);
}, function()
{
    event_delay(300);
}, function()
{
    event_create_scene("Dialogue/W1/first_wall.json", 4);
}, function()
{
    event_delay(60);
}, function()
{
    custom_event_lastspin();
}, function()
{
    event_pause();
}, function()
{
    event_actor_facing(0, -1);
}, function()
{
    event_actor_snap(0, obj_map_cutscene_firstwall_busterspin.x, obj_map_cutscene_firstwall_busterspin.y, obj_map_cutscene_firstwall_busterspin.z);
}, function()
{
    event_delay(1);
}, function()
{
    event_actor_visible(0, true);
}, function()
{
    with (obj_map_cutscene_firstwall_busterspin)
        instance_destroy();
}, function()
{
    event_delay(30);
}, function()
{
    event_create_scene("Dialogue/W1/first_wall.json", 5);
}, function()
{
    event_delay(120);
}, function()
{
    event_actor_sprite(0, spr_buster_d_walk, 0);
}, function()
{
    event_actor_sprite(1, spr_bridget_d_walk, 0);
}, function()
{
    event_delay(60);
}, function()
{
    event_actor_auto(1, 1);
}, function()
{
    event_actor_auto(0, 0);
}, function()
{
    event_create_scene("Dialogue/W1/first_wall.json", 12);
}, function()
{
    event_actor_facing(0, 1);
}, function()
{
    event_player_respawn_at_actor(0, 1);
}, function()
{
    event_actor_move(1, [obj_map_player_follower.x, obj_map_player_follower.y], true);
}, function()
{
    event_camera_return();
}, function()
{
    event_camera_percent_tie_actor(1);
}, function()
{
    event_pause();
}, function()
{
    event_end();
}];

textbox_events[6] = function()
{
    event_actor_facing(0, 1);
};

textbox_events[9] = function()
{
    event_actor_facing(0, -1);
};

var _func = function()
{
    event_actor_sprite(0, spr_map_buster_spin, 0);
    event_actor_sprite(1, spr_map_buster_spin, 0);
    event_actor_facing(0, -1);
};

textbox_events[11] = _func;

custom_event_createspin = function()
{
    var _x, _y;
    
    with (obj_map_actor)
    {
        if (ID == 0)
        {
            _x = x;
            _y = y;
        }
    }
    
    instance_create_layer(_x, _y, layer, obj_map_cutscene_firstwall_busterspin);
};

custom_event_lastspin = function()
{
    with (obj_map_cutscene_firstwall_busterspin)
        last_spin = true;
};
