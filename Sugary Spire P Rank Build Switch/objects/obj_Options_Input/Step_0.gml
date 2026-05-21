if (canmove == true)
{
    scr_getinput();
    ScrollY = lerp(ScrollY, (optionselected / OPTION_INPUTSELECTED.special) * -100, 0.15);
    
    if (selecting == false)
    {
        if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > OPTION_INPUTSELECTED.back)
        {
            optionselected -= 1;
            scr_sound(sound_step);
        }
        
        if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < OPTION_INPUTSELECTED.special)
        {
            optionselected += 1;
            scr_sound(sound_step);
        }
        
        if (key_slap2 || key_start)
        {
            ini_open("optionData.ini");
            ini_write_string("ControlsKeys", "up", global.key_up);
            ini_write_string("ControlsKeys", "right", global.key_right);
            ini_write_string("ControlsKeys", "left", global.key_left);
            ini_write_string("ControlsKeys", "down", global.key_down);
            ini_write_string("ControlsKeys", "jump", global.key_jump);
            ini_write_string("ControlsKeys", "slap", global.key_slap);
            ini_write_string("ControlsKeys", "taunt", global.key_taunt);
            ini_write_string("ControlsKeys", "shoot", global.key_shoot);
            ini_write_string("ControlsKeys", "attack", global.key_attack);
            ini_write_string("ControlsKeys", "start", global.key_start);
            ini_write_string("ControlsKeys", "special", global.key_special);
            ini_close();
            scr_sound(sound_enemythrow);
            instance_destroy();
        }
    }
    
    subtitle = "PRESS JUMP TO REBIND";
    
    switch (optionselected)
    {
        case OPTION_INPUTSELECTED.back:
            subtitle = "GO BACK TO MAIN SCREEN";
            
            if (key_jump || keyboard_check_pressed(vk_enter))
            {
                ini_open("optionData.ini");
                ini_write_string("ControlsKeys", "up", global.key_up);
                ini_write_string("ControlsKeys", "right", global.key_right);
                ini_write_string("ControlsKeys", "left", global.key_left);
                ini_write_string("ControlsKeys", "down", global.key_down);
                ini_write_string("ControlsKeys", "jump", global.key_jump);
                ini_write_string("ControlsKeys", "slap", global.key_slap);
                ini_write_string("ControlsKeys", "taunt", global.key_taunt);
                ini_write_string("ControlsKeys", "shoot", global.key_shoot);
                ini_write_string("ControlsKeys", "attack", global.key_attack);
                ini_write_string("ControlsKeys", "start", global.key_start);
                ini_write_string("ControlsKeys", "special", global.key_special);
                ini_close();
                scr_sound(sound_enemythrow);
                instance_destroy();
            }
            
            break;
        
        case OPTION_INPUTSELECTED.up:
            if (selecting == true)
            {
                if (keyboard_check_pressed(vk_anykey))
                {
                    global.key_up = keyboard_key;
                    selecting = false;
                }
            }
            
            if ((key_jump || keyboard_check_pressed(vk_enter)) && selecting == false)
            {
                selecting = true;
                global.key_up = -1;
            }
            
            break;
        
        case OPTION_INPUTSELECTED.right:
            if (selecting == true)
            {
                if (keyboard_check_pressed(vk_anykey))
                {
                    global.key_right = keyboard_key;
                    selecting = false;
                }
            }
            
            if ((key_jump || keyboard_check_pressed(vk_enter)) && selecting == false)
            {
                selecting = true;
                global.key_right = -1;
            }
            
            break;
        
        case OPTION_INPUTSELECTED.left:
            if (selecting == true)
            {
                if (keyboard_check_pressed(vk_anykey))
                {
                    global.key_left = keyboard_key;
                    selecting = false;
                }
            }
            
            if ((key_jump || keyboard_check_pressed(vk_enter)) && selecting == false)
            {
                selecting = true;
                global.key_left = -1;
            }
            
            break;
        
        case OPTION_INPUTSELECTED.down:
            if (selecting == true)
            {
                if (keyboard_check_pressed(vk_anykey))
                {
                    global.key_down = keyboard_key;
                    selecting = false;
                }
            }
            
            if ((key_jump || keyboard_check_pressed(vk_enter)) && selecting == false)
            {
                selecting = true;
                global.key_down = -1;
            }
            
            break;
        
        case OPTION_INPUTSELECTED.jump:
            if (selecting == true)
            {
                if (keyboard_check_pressed(vk_anykey))
                {
                    global.key_jump = keyboard_key;
                    selecting = false;
                }
            }
            
            if ((key_jump || keyboard_check_pressed(vk_enter)) && selecting == false)
            {
                selecting = true;
                global.key_jump = -1;
            }
            
            break;
        
        case OPTION_INPUTSELECTED.slap:
            if (selecting == true)
            {
                if (keyboard_check_pressed(vk_anykey))
                {
                    global.key_slap = keyboard_key;
                    selecting = false;
                }
            }
            
            if ((key_jump || keyboard_check_pressed(vk_enter)) && selecting == false)
            {
                selecting = true;
                global.key_slap = -1;
            }
            
            break;
        
        case OPTION_INPUTSELECTED.taunt:
            if (selecting == true)
            {
                if (keyboard_check_pressed(vk_anykey))
                {
                    global.key_taunt = keyboard_key;
                    selecting = false;
                }
            }
            
            if ((key_jump || keyboard_check_pressed(vk_enter)) && selecting == false)
            {
                selecting = true;
                global.key_taunt = -1;
            }
            
            break;
        
        case OPTION_INPUTSELECTED.shoot:
            if (selecting == true)
            {
                if (keyboard_check_pressed(vk_anykey))
                {
                    global.key_shoot = keyboard_key;
                    selecting = false;
                }
            }
            
            if ((key_jump || keyboard_check_pressed(vk_enter)) && selecting == false)
            {
                selecting = true;
                global.key_shoot = -1;
            }
            
            break;
        
        case OPTION_INPUTSELECTED.attack:
            if (selecting == true)
            {
                if (keyboard_check_pressed(vk_anykey))
                {
                    global.key_attack = keyboard_key;
                    selecting = false;
                }
            }
            
            if ((key_jump || keyboard_check_pressed(vk_enter)) && selecting == false)
            {
                selecting = true;
                global.key_attack = -1;
            }
            
            break;
        
        case OPTION_INPUTSELECTED.start:
            if (selecting == true)
            {
                if (keyboard_check_pressed(vk_anykey))
                {
                    global.key_start = keyboard_key;
                    selecting = false;
                }
            }
            
            if ((key_jump || keyboard_check_pressed(vk_enter)) && selecting == false)
            {
                selecting = true;
                global.key_start = -1;
            }
            
            break;
        
        case OPTION_INPUTSELECTED.special:
            if (selecting == true)
            {
                if (keyboard_check_pressed(vk_anykey))
                {
                    global.key_special = keyboard_key;
                    selecting = false;
                }
            }
            
            if ((key_jump || keyboard_check_pressed(vk_enter)) && selecting == false)
            {
                selecting = true;
                global.key_special = -1;
            }
            
            break;
    }
}
