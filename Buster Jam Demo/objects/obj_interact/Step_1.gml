if (!ready || instance_exists(obj_scene_manager))
{
    if (instance_exists(my_character))
        my_character.touching = false;
    
    if (instance_exists(obj_textbox) && instance_exists(my_character))
    {
        if (obj_textbox.char_speak == my_character.char_speak && obj_textbox.type_index < string_length(obj_textbox.text))
        {
            with (my_character)
            {
                if (!talking && idle_is_talk)
                    anim_index = 1;
                
                talking = true;
            }
        }
        else
        {
            with (my_character)
                talking = false;
        }
    }
    
    exit;
}

event_user(0);
