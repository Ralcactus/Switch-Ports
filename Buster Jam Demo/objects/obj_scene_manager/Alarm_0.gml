finish_after = false;

if (file_exists(scene))
{
    data = json_load(scene);
    
    if (ID_start == -4)
        ID_start = data.starting_node;
}

ID = ID_start;
instance_create_depth(0, 0, layer_get_depth("GUI") - 1, obj_textbox);
event_user(0);

event_next = function()
{
    ID = ID_next;
    event_user(0);
};
