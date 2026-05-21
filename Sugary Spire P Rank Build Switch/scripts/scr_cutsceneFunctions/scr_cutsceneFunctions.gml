/// @function cutscene_create
/// @description This creates a cutscene handler.
/// @param {array} functions an array of functions
function cutscene_create(functions)
{
    global.cutsceneManager = instance_create(0, 0, obj_cutsceneManager);
    
    with (global.cutsceneManager)
    {
        show_debug_message("QUEUED FUNCTIONS");
        Event = functions[0];
        show_debug_message(functions[0]);
        
        for (var i = 1; i < array_length(functions); i++)
        {
            ds_queue_enqueue(Cutscene, functions[i]);
            show_debug_message(functions[i]);
        }
    }
    
    return global.cutsceneManager;
}

/// @function cutscene_event_end
/// @description This ends the current Cutscene Event.
function cutscene_event_end()
{
    if (!ds_queue_empty(Cutscene))
    {
        var _event = ds_queue_dequeue(Cutscene);
        Event = _event;
        show_debug_message("NEW EVENT");
        show_debug_message(Event);
    }
    else
    {
        instance_destroy();
    }
}

/// @function cutscene_declare_actor
/// @description This sets an object as an actor. Call after cutscene_create().
/// @param {real} obj The id of the actor
/// @param {string} name The key of the actor
function cutscene_declare_actor(obj, name)
{
    with (global.cutsceneManager)
    {
        if (ds_exists(ActorMap, ds_type_map))
            ActorMap[? name] = obj;
    }
    
    return true;
}

/// @function cutscene_get_actor
/// @description This gets an actor.
/// @param {string} name The key of the actor
function cutscene_get_actor(name)
{
    with (global.cutsceneManager)
    {
        if (ds_exists(ActorMap, ds_type_map))
            return ActorMap[? name];
    }
    
    return false;
}
