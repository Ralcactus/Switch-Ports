condition = function()
{
    return place_meeting(x, y, obj_player) && obj_player.state == states.freefallland;
};

output = function()
{
    portal_activate(inst_1E7702B1, true);
    
    with (inst_5AA2CE59)
    {
        y = ystart + 32;
        
        if (!(ds_list_find_index(other.flags.saveroom, other.id) != -1))
        {
            camera_shake(20, 40);
            scr_sound(sound_destroyblock1, sound_destroyblock2);
            scr_sound(sound_metaldestroy);
            
            with (instance_place(x, ystart - 1, obj_player))
                y = other.y - 46;
        }
    }
    
    var lay_id = layer_get_id("Tiles_6");
    layer_y(lay_id, 32);
};
