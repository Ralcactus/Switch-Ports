testvariablenothing = false;

event_continue = function()
{
    index++;
    events[index]();
    
    if (!instance_exists(id))
        exit;
    
    if (timer[0] == -1 && !paused)
        event_continue();
};

event_delay = function(arg0)
{
    timer[0] = arg0;
};

timer[0] = -1;

timer_func[0] = function()
{
    event_continue();
};

event_end = function()
{
    event_follower_visible(true);
    event_player_visible(true);
    event_actor_destroy_all();
    
    with (obj_map_player)
        deac = false;
    
    global.cam_follow = obj_map_cam.id;
    instance_destroy();
};

event_pause = function()
{
    paused = true;
};

function event_actor_create_player_auto(arg0)
{
    event_actor_create(arg0, obj_map_player.x, obj_map_player.y, obj_map_player.z);
    event_player_visible(false);
    event_actor_auto(arg0, 0);
    event_actor_speed(arg0);
}

function event_actor_create_follower_auto(arg0)
{
    event_actor_create(arg0, obj_map_player_follower.x, obj_map_player_follower.y, obj_map_player_follower.z);
    event_follower_visible(false);
    event_actor_auto(arg0, 1);
    event_actor_speed(arg0);
}

event_follower_visible = function(arg0)
{
    with (obj_map_player_follower)
        draw_me = arg0;
};

event_player_visible = function(arg0)
{
    with (obj_map_player)
        draw_me = arg0;
};

function event_actor_create(arg0, arg1, arg2, arg3)
{
    var _inst = instance_create_layer(arg1, arg2, "Instances", obj_map_actor);
    _inst.z = arg3;
    _inst.ID = arg0;
    
    with (_inst)
    {
        scr_shadow_z();
        
        if (instance_place_3d(x, y, z + 1, obj_solid))
            my_shadow.draw_me = false;
    }
}

event_actor_destroy_all = function()
{
    with (obj_map_actor)
        instance_destroy();
};

function event_actor_sprite(arg0, arg1, arg2 = 0)
{
    event_actor_auto(arg0, -4);
    
    with (obj_map_actor)
    {
        if (ID == arg0)
        {
            anim_sprite = arg1;
            
            if (arg2 != -1)
                anim_index = arg2;
        }
    }
}

function event_actor_sprite_speed(arg0, arg1)
{
    with (obj_map_actor)
    {
        if (ID == arg0)
            anim_speed = arg1;
    }
}

function event_actor_shake(arg0, arg1 = 1)
{
    with (obj_map_actor)
    {
        if (ID == arg0)
            shake = arg1;
    }
}

function event_actor_squish(arg0)
{
    with (obj_map_actor)
    {
        if (ID == arg0)
            event_squish();
    }
}

function event_actor_facing(arg0, arg1)
{
    with (obj_map_actor)
    {
        if (ID == arg0)
            facing = arg1;
    }
}

function event_actor_move(arg0, arg1, arg2, arg3 = false, arg4 = 2)
{
    with (obj_map_actor)
    {
        if (ID == arg0)
        {
            marker_ID = arg1;
            
            if (is_array(arg1))
                pos_move = [arg1[0], arg1[1]];
            else
                pos_move = [];
            
            unpause_when_done = arg2;
            move_lerp = arg3;
            move_lerp_lag = arg4;
            move_jump = false;
            event_user(0);
        }
    }
    
    if (arg0 == player_tie_actor)
        event_player_move(arg1, false);
}

function event_actor_move_jump(arg0, arg1, arg2, arg3 = 64)
{
    with (obj_map_actor)
    {
        if (ID == arg0)
        {
            marker_ID = arg1;
            
            if (is_array(arg1))
                pos_move = [arg1[0], arg1[1]];
            else
                pos_move = [];
            
            unpause_when_done = arg2;
            move_jump = true;
            jump_height = arg3;
            event_user(0);
        }
    }
}

function event_actor_get_pos(arg0)
{
    var _pos = [];
    
    with (obj_map_actor)
    {
        if (ID == arg0)
        {
            _pos[0] = x;
            _pos[1] = y;
        }
    }
    
    return _pos;
}

function event_actor_snap(arg0, arg1, arg2, arg3)
{
    with (obj_map_actor)
    {
        if (ID == arg0)
        {
            x = arg1;
            y = arg2;
            z = arg3;
            xto = x;
            yto = y;
            zto = z;
        }
    }
}

function event_actor_snap_to_marker(arg0, arg1)
{
    var XPOS = 0;
    var YPOS = 0;
    var ZPOS = 0;
    
    with (obj_map_actor_marker)
    {
        if (ID == arg1)
        {
            XPOS = x;
            YPOS = y;
            ZPOS = z;
        }
    }
    
    with (obj_map_actor)
    {
        if (ID == arg0)
        {
            x = XPOS;
            y = YPOS;
            z = ZPOS;
            xto = x;
            yto = y;
            zto = z;
        }
    }
}

function event_actor_visible(arg0, arg1)
{
    with (obj_map_actor)
    {
        if (ID == arg0)
            draw_me = arg1;
    }
}

function event_actor_speed(arg0, arg1 = 10, arg2 = undefined)
{
    with (obj_map_actor)
    {
        if (ID == arg0)
        {
            movespd = arg1;
            shift_override = arg2;
        }
    }
}

function event_actor_auto(arg0, arg1)
{
    with (obj_map_actor)
    {
        if (ID == arg0)
        {
            auto = arg1;
            event_user(1);
        }
    }
}

function event_create_scene(arg0, arg1, arg2 = true)
{
    scene_create(arg0, arg1, arg2);
    paused = true;
    scene_created = true;
}

function event_camera_setup()
{
    global.cam_follow = id;
    x = camera_get_view_x(view_camera[0]);
    y = camera_get_view_y(view_camera[0]);
    cam_start_xpos = x;
    cam_start_ypos = y;
}

function event_camera_move(arg0, arg1, arg2 = false, arg3 = 0.02)
{
    cam_xstart = x;
    cam_ystart = y;
    cam_xto = arg0;
    cam_yto = arg1;
    camera_move = true;
    percent_camera = 0;
    camera_unpause_when_finished = arg2;
    cam_speed = arg3;
}

function event_camera_return(arg0 = false)
{
    with (obj_map_cam)
    {
        x_follow = follow.x;
        y_follow = follow.y;
        z_follow = follow.z;
        y_follow = (follow.y - 72) + follow.z;
        
        if (x_follow < (x - (x_radius / 2)))
            x = x_follow + (x_radius / 2);
        
        if (x_follow > (x + (x_radius / 2)))
            x = x_follow - (x_radius / 2);
        
        y = y_follow - (y_radius / 2);
        x = clamp(x, myclamp[3] + 960, myclamp[2] - 960);
        y = clamp(y, myclamp[0] + 540, myclamp[1] - 540);
    }
    
    event_camera_move(obj_map_cam.x - 960, obj_map_cam.y - 540, arg0);
}

function event_camera_percent_tie_actor(arg0)
{
    percent_tie = arg0;
}

function event_create_shot(arg0, arg1, arg2 = 0)
{
    var _inst = instance_create_layer(0, 0, "GUI", obj_cutscene_shot);
    _inst.anim_sprite = arg0;
    _inst.anim_index = arg1;
    _inst.anim_speed = arg2;
}

function event_destroy_shot()
{
    with (obj_cutscene_shot)
        instance_destroy();
}

function event_change_shot(arg0, arg1, arg2 = 0)
{
    event_destroy_shot();
    event_create_shot(arg0, arg1, arg2);
}

function event_player_move(arg0, arg1)
{
    var _x, _y;
    
    with (obj_map_actor_marker)
    {
        if (ID == arg0)
        {
            _x = x;
            _y = y;
        }
    }
    
    with (obj_map_player)
    {
        cutscene_move = true;
        cutscene_move_xto = _x;
        cutscene_move_yto = _y;
    }
}

function event_player_tie_actor(arg0)
{
    player_tie_actor = arg0;
}

function event_player_respawn(arg0, arg1, arg2 = 0, arg3 = 1, arg4 = 1)
{
    obj_map_player.x = arg0;
    obj_map_player.y = arg1;
    obj_map_player.z = arg2;
    obj_map_player_follower.x = arg0;
    obj_map_player_follower.y = arg1;
    obj_map_player_follower.z = arg2;
    
    with (obj_map_player)
    {
        for (var ii = 0; ii < 21; ii++)
        {
            var _y;
            
            if (arg4 == 1)
            {
                var _x = x;
                _y = y - (10 * (21 - ii));
            }
            else if (arg4 == 0)
            {
                var _x = x;
                _y = y + (10 * (21 - ii));
            }
            else if (arg4 == 3)
            {
                var _x = x - (10 * (21 - ii));
                _y = y;
            }
            else if (arg4 == 2)
            {
                var _x = x + (10 * (21 - ii));
                _y = y;
            }
            
            var _struct = 
            {
                x: x,
                y: _y,
                z: z,
                hspd: hspd,
                vspd: vspd,
                zspd: zspd,
                grounded: grounded,
                dir: dir,
                facing: facing,
                jump: false,
                running: false,
                state: state
            };
            array_push(array_record, _struct);
            
            if (array_length(array_record) == record_max)
                array_shift(array_record);
        }
    }
    
    with (obj_map_player_follower)
        event_user(0);
}

function event_player_respawn_at_actor(arg0, arg1 = 1)
{
    var _x, _y, _z;
    
    with (obj_map_actor)
    {
        if (ID == arg0)
        {
            _x = x;
            _y = y;
            _z = z;
        }
    }
    
    event_player_respawn(_x, _y, _z, arg1);
}

function event_debug_get_actor_coords(arg0)
{
    with (obj_map_actor)
    {
        if (ID == arg0)
            show_message(string("Actor {0}\nX: {1}\nY:{2}\nZ: {3}", ID, x, y, z));
    }
}

event_message = function(arg0)
{
    show_message(arg0);
    event_continue();
};
