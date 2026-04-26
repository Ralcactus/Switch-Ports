scr_getinput();

if ((-key_left2 || keyboard_check_pressed(vk_left)) && optionselected > 0)
{
    optionselected -= 1;
    event_play_oneshot("event:/SFX/ui/step");
}

if ((key_right2 || keyboard_check_pressed(vk_right)) && optionselected < 1)
{
    optionselected += 1;
    event_play_oneshot("event:/SFX/ui/step");
}

if (optionselected == 1 && (key_jump || keyboard_check_pressed(vk_enter)))
{
    with (obj_playerhat)
        image_index = 0;
    
    with (obj_parent_player)
        scr_characterSprite();
    
    file_delete("saveData.ini");
    event_play_oneshot("event:/SFX/general/explosion");
    instance_destroy();
}

if (key_slap2 || keyboard_check_pressed(vk_escape) || (optionselected == 0 && (key_jump || keyboard_check_pressed(vk_enter))))
{
    event_play_oneshot("event:/SFX/ui/confirm");
    instance_destroy();
}
