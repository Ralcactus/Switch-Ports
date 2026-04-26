condition = function()
{
    return (place_meeting(x, y, obj_parent_player) && obj_parent_player.state == UnknownEnum.Value_96) || (place_meeting(x, y, obj_parent_player) && obj_parent_player.state == UnknownEnum.Value_87);
};

output = function()
{
    portal_activate(102600, true);
    
    with (102600)
    {
        y = ystart + 32;
        image_alpha = 0;
        
        if (!(ds_list_find_index(other.flags.saveroom, other.id) != -1))
        {
            with (instance_place(x, ystart - 1, obj_parent_player))
                y = other.y - 46;
            
            with (102701)
                y = 750;
        }
    }
    
    var lay_id = layer_get_id("Tiles_6");
    layer_y(lay_id, 32);
};
