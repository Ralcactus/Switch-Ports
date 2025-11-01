if (!deac)
{
    var _option = selected_option;
    menu_move(menu);
    
    if (selected_option != _option)
        exists_alpha = 0;
}

if (deac)
{
    exists_alpha = 0;
    
    if (keyboard_check_pressed(vk_anykey))
    {
        var _exists = false;
        var _key = get_key(keyboard_lastkey, false, true);
        
        for (var i = 0; i <= 10; i++)
        {
            if (input.key[i] == keyboard_lastkey)
            {
                _exists = true;
                break;
            }
        }
        
        if (_key == -4 || _exists)
        {
            audio_stop_play(snd_wrong, 0, 0);
        }
        else
        {
            input.key[selected_option] = keyboard_lastkey;
            audio_stop_play(snd_coin, 0, 0);
        }
        
        if (_exists)
        {
            exists_pop = selected_option;
            exists_alpha = 3;
        }
        
        alarm[0] = -1;
        deac = false;
        keyboard_clear(keyboard_lastkey);
    }
}

exists_alpha = approach(exists_alpha, 0, 0.05);
