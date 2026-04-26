bgx++;
bgy++;

if (!selected)
{
    scr_getinput();
    
    if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > UnknownEnum.Value_0)
    {
        optionselected -= 1;
        event_play_oneshot("event:/SFX/ui/step");
    }
    
    if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < UnknownEnum.Value_3)
    {
        optionselected += 1;
        event_play_oneshot("event:/SFX/ui/step");
    }
    
    switch (optionselected)
    {
        case UnknownEnum.Value_0:
            subtitle = "GO BACK TO MAIN SCREEN";
            CursorY = -999;
            
            if (key_jump)
            {
                event_play_oneshot("event:/SFX/ui/confirm");
                instance_destroy();
            }
            
            break;
        
        case UnknownEnum.Value_1:
            subtitle = "ADJUST AUDIO SETTINGS";
            CursorY = 100;
            
            if (key_jump)
            {
                event_play_oneshot("event:/SFX/ui/confirm");
                selected = true;
                instance_create(0, 0, obj_Options_Audio);
            }
            
            break;
        
        case UnknownEnum.Value_2:
            subtitle = "ADJUST VIDEO SETTINGS";
            CursorY = 200;
            
            if (key_jump)
            {
                event_play_oneshot("event:/SFX/ui/confirm");
                selected = true;
                instance_create(0, 0, obj_Options_Video);
            }
            
            break;
        
        case UnknownEnum.Value_3:
            subtitle = "CHANGE CONTROL INPUTS";
            CursorY = 300;
            
            if (key_jump)
            {
                event_play_oneshot("event:/SFX/ui/confirm");
                selected = true;
                instance_create(0, 0, obj_Options_Input);
            }
            
            break;
        
        case UnknownEnum.Value_4:
            subtitle = "ADJUST MISCELLANEOUS SETTINGS";
            CursorY = 400;
            
            if (key_jump)
                event_play_oneshot("event:/SFX/ui/confirm");
            
            break;
    }
    
    if (key_slap2 || key_start)
    {
        event_play_oneshot("event:/SFX/ui/confirm");
        instance_destroy();
    }
}
