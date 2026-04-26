if (canmove)
{
    scr_getinput();
    
    if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > UnknownEnum.Value_0)
    {
        optionselected -= 1;
        event_play_multiple("event:/SFX/ui/step");
        optionsaved_masterVolume = global.masterVolume;
        optionsaved_musicVolume = global.musicVolume;
        optionsaved_dialogueVolume = global.dialogueVolume;
        optionsaved_soundVolume = global.soundVolume;
        set_volume_options();
    }
    
    if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < UnknownEnum.Value_4)
    {
        optionselected += 1;
        event_play_multiple("event:/SFX/ui/step");
        optionsaved_masterVolume = global.masterVolume;
        optionsaved_musicVolume = global.musicVolume;
        optionsaved_dialogueVolume = global.dialogueVolume;
        optionsaved_soundVolume = global.soundVolume;
        set_volume_options();
    }
    
    switch (optionselected)
    {
        case UnknownEnum.Value_0:
            subtitle = "GO BACK TO MAIN SCREEN";
            CursorY = -999;
            
            if (key_jump)
            {
                set_volume_options();
                event_play_multiple("event:/SFX/ui/step");
                instance_destroy();
            }
            
            break;
        
        case UnknownEnum.Value_1:
            subtitle = "ADJUST MASTER VOLUME";
            CursorY = 100;
            optionsaved_masterVolume += ((key_right + key_left) / (key_attack ? 200 : 400));
            optionsaved_masterVolume = clamp(optionsaved_masterVolume, 0, 1);
            set_volume_options(optionsaved_masterVolume);
            
            if (key_jump)
            {
                event_play_multiple("event:/SFX/ui/confirm");
                ini_open("optionData.ini");
                ini_write_real("Settings", "mastervol", optionsaved_masterVolume);
                ini_close();
                global.masterVolume = optionsaved_masterVolume;
                set_volume_options();
            }
            
            break;
        
        case UnknownEnum.Value_2:
            subtitle = "ADJUST MUSIC VOLUME";
            CursorY = 200;
            optionsaved_musicVolume += ((key_right + key_left) / (key_attack ? 200 : 400));
            optionsaved_musicVolume = clamp(optionsaved_musicVolume, 0, 1);
            set_volume_options(undefined, optionsaved_musicVolume);
            
            if (key_jump)
            {
                event_play_multiple("event:/SFX/ui/confirm");
                ini_open("optionData.ini");
                ini_write_real("Settings", "musicvol", optionsaved_musicVolume);
                ini_close();
                global.musicVolume = optionsaved_musicVolume;
                set_volume_options();
            }
            
            break;
        
        case UnknownEnum.Value_3:
            subtitle = "ADJUST SOUNDEFFECTS VOLUME";
            CursorY = 300;
            optionsaved_soundVolume += ((key_right + key_left) / (key_attack ? 200 : 400));
            optionsaved_soundVolume = clamp(optionsaved_soundVolume, 0, 1);
            set_volume_options(undefined, undefined, optionsaved_soundVolume);
            
            if (key_jump)
            {
                event_play_multiple("event:/SFX/ui/confirm");
                ini_open("optionData.ini");
                ini_write_real("Settings", "soundvol", optionsaved_soundVolume);
                ini_close();
                global.soundVolume = optionsaved_soundVolume;
                set_volume_options();
            }
            
            break;
        
        case UnknownEnum.Value_4:
            subtitle = "ADJUST DIALOGUE VOLUME";
            CursorY = 400;
            optionsaved_dialogueVolume += ((key_right + key_left) / (key_attack ? 200 : 400));
            optionsaved_dialogueVolume = clamp(optionsaved_dialogueVolume, 0, 1);
            
            if (key_jump)
            {
                event_play_multiple("event:/SFX/ui/confirm");
                ini_open("optionData.ini");
                ini_write_real("Settings", "dialoguevol", optionsaved_dialogueVolume);
                ini_close();
                global.dialogueVolume = optionsaved_dialogueVolume;
                set_volume_options();
            }
            
            break;
    }
    
    if (key_slap2 || key_start)
    {
        event_play_multiple("event:/SFX/ui/confirm");
        instance_destroy();
    }
    
    obj_Options_Main.CursorY = CursorY;
}
