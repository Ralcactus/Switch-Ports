condition = function()
{
    return place_meeting(x, y, obj_parent_player) && obj_parent_player.state == UnknownEnum.Value_70;
};

output = function()
{
    portal_activate(103901, true);
    
    with (103707)
    {
        y = ystart + 32;
        
        if (!(ds_list_find_index(other.flags.saveroom, other.id) != -1))
        {
            camera_shake_add(20, 40);
            event_play_oneshot("event:/SFX/general/breakblock", x, y);
            event_play_oneshot("event:/SFX/general/breakmetal", x, y);
            
            with (instance_place(x, ystart - 1, obj_parent_player))
                y = other.y - 46;
        }
    }
    
    var lay_id = layer_get_id("Tiles_6");
    layer_y(lay_id, 32);
};
