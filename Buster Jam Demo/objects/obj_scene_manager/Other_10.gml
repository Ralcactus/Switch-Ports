ID_next = -4;

with (par_map_cutscene)
{
    textbox_node_ID = other.ID;
    event_user(1);
}

if (instance_exists(my_interact))
{
    with (my_interact)
    {
        textbox_node_ID = other.ID;
        event_textbox_event();
    }
}

if (struct_exists(data, "textboxes"))
{
    for (var i = 0; i < array_length(data.textboxes); i++)
    {
        var _node = data.textboxes[i];
        
        if (_node.ID == ID)
        {
            node = 0;
            text_set = _node.text;
            var _portrait = _node.portrait;
            var _portrait_ind = _node.portrait_ind;
            
            with (obj_textbox)
            {
                text = other.text_set;
                portrait = _portrait;
                portrait_ind = _portrait_ind;
                event_user(0);
            }
            
            if (struct_exists(_node, "connect0_ID"))
                ID_next = _node.connect0_ID;
            
            break;
        }
    }
}

if (struct_exists(data, "choices"))
{
    for (var i = 0; i < array_length(data.choices); i++)
    {
        var _node = data.choices[i];
        
        if (_node.ID == ID)
        {
            instance_create_depth(0, 0, layer_get_depth("GUI") - 2, obj_choice_manager);
            
            with (obj_choice_manager)
            {
                for (var ii = 0; ii < 5; ii++)
                {
                    choice[ii] = {};
                    choice[ii].text = struct_get(_node, string("choice{0}", ii));
                    choice[ii].next = struct_get(_node, string("connect{0}_ID", ii));
                }
            }
            
            node = 1;
            ID_next = "choice";
            break;
        }
    }
}

if (struct_exists(data, "events"))
{
    for (var i = 0; i < array_length(data.events); i++)
    {
        var _node = data.events[i];
        
        if (_node.ID == ID)
        {
            var _script = asset_get_index(_node.event);
            script_execute(_script);
            node = 2;
            
            if (struct_exists(_node, "connect0_ID"))
            {
                ID = _node.connect0_ID;
                event_user(0);
            }
            else
            {
                finish_after = true;
            }
        }
    }
}

if (finish_after)
{
    if (fade_textbox_out)
    {
        with (obj_textbox)
            event_user(2);
        
        timer[0] = 20;
    }
    else
    {
        with (obj_textbox)
        {
            if (destroy)
                instance_destroy();
        }
        
        timer_func[0]();
    }
    
    with (my_interact)
        event_end();
    
    finished = true;
}

if (ID_next == -4)
    finish_after = true;
