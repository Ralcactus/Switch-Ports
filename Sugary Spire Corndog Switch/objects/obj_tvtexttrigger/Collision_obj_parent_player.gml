if ((global.panic && panicmode) || !panicmode)
{
    if (ds_list_find_index(global.SaveRoom, id) == -1 && _message != -4 && can_activate && !activated)
    {
        with (obj_tvtexttrigger)
        {
            if (trigger == other.trigger)
                can_activate = true;
        }
        
        activated = true;
        scr_queue_message(_message, _message_tvspr);
        ds_list_add(global.SaveRoom, id);
        instance_destroy();
    }
    
    if (ds_list_find_index(global.SaveRoom, id) == -1 && _message_array[0][0] != -4 && can_activate && !activated)
    {
        with (obj_tvtexttrigger)
        {
            if (trigger == other.trigger)
                can_activate = true;
        }
        
        activated = true;
        
        for (var i = 0; i < array_length(_message_array); i++)
        {
            if (array_length(_message_array[i]) > 1)
                scr_queue_message(_message_array[i][0], _message_array[i][1]);
            else
                scr_queue_message(_message_array[i][0]);
        }
        
        ds_list_add(global.SaveRoom, id);
        instance_destroy();
    }
}
