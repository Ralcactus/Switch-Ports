// Wait time then moveon
function cutscene_wait(arg0)
{
    timer++;
    if (timer >= arg0)
    {
        timer = 0;
        
        with (obj_cutsceneManager)
            cutscene_event_end();
    }
    return;
}

function cutscene_end_player()
{
    obj_player.state = states.normal;
    obj_player.hsp = 0;
    obj_player.vsp = 0;
    obj_player.sprite_index = obj_player.spr_idle;
    cutscene_event_end();
}

function cutscene_start_player()
{
    obj_player.state = states.actor;
    obj_player.hsp = 0;
    obj_player.vsp = 0;
    obj_player.sprite_index = obj_player.spr_idle;
    cutscene_event_end();
}

function cutscene_create_instance(_x, _y, _obj)
{
    instance_create(_x, _y, _obj);
    cutscene_event_end();
}

function cutscene_do_func(func)
{
    func();
    cutscene_event_end();
}

function cutscene_with_actor(_actor, func)
{
    var finish = false;
    var _realActor = cutscene_get_actor(_actor);
    cutscene_event_end();
    
    with (_realActor)
        return func();
}

function cutscene_do_dialog(dialog, instant = false)
{
    queue_dialogue(dialog, instant);
    
    with (obj_dialogue)
        instant_destroy = instant;
    
    cutscene_event_end();
}

function cutscene_wait_dialog()
{
    var finish = false;
    
    if (!instance_exists(obj_dialogue) && !instance_exists(obj_dialogue_choices))
        finish = true;
    
    if (finish)
        cutscene_event_end();
}

function cutscene_lerp_actor(_actor, _x, _y, interp)
{
    var finish = false;
    var _realActor = cutscene_get_actor(_actor);
    
    with (_realActor)
    {
        x = lerp(x, _x, interp);
        y = lerp(y, _y, interp);
        
        if (distance_to_point(_x, _y) <= 4)
        {
            finish = true;
            x = _x;
            y = _y;
        }
    }
    
    if (finish)
        cutscene_event_end();
}

function cutscene_move_actor(_actor, _x, _y, _speed)
{
    var finish = false;
    var _realActor = cutscene_get_actor(_actor);
    
    with (_realActor)
    {
        var _angel = point_direction(x, y, _x, _y);
        var _dirx = lengthdir_x(_speed, _angel);
        var _diry = lengthdir_y(_speed, _angel);
        x = approach(x, _x, _dirx);
        y = approach(y, _y, _diry);
        
        if (x == _x && y == _y)
            finish = true;
    }
    
    if (finish || !_realActor)
        cutscene_event_end();
}

function cutscene_new_actor(_x, _y, _sprite, _actor_name)
{
    var _new_actor = instance_create(_x, _y, obj_actor);
    _new_actor.sprite_index = _sprite;
    
    with (_new_actor)
        cutscene_declare_actor(id, _actor_name);
    
    cutscene_event_end();
    return _new_actor;
}

function cutscene_actor_animend(_actor)
{
    var finish = true;
    var _realActor = cutscene_get_actor(_actor);
    
    with (_realActor)
    {
        if (animation_end())
            finish = false;
    }
    
    if (finish)
        cutscene_event_end();
}
