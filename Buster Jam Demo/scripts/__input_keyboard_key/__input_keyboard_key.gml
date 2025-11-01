function __input_keyboard_key()
{
    static _global = __input_global();
    
    if (_global.__keyboard_allowed && keyboard_check(vk_anykey))
    {
        switch (0)
        {
            case 4:
                if (keyboard_check(ord(keyboard_lastchar)))
                    return ord(keyboard_lastchar);
                
                if (keyboard_check(vk_left))
                    return 37;
                
                if (keyboard_check(vk_up))
                    return 38;
                
                if (keyboard_check(vk_down))
                    return 40;
                
                if (keyboard_check(vk_right))
                    return 39;
                
                if (keyboard_check(vk_backspace))
                    return 8;
                
                return 0;
                break;
            
            case 21:
                if (keyboard_check(ord(keyboard_lastchar)))
                    return ord(keyboard_lastchar);
                
                var _i = 254;
                
                repeat (248)
                {
                    if (keyboard_check(_i))
                        return _i;
                    
                    _i--;
                }
                
                return 0;
                break;
            
            default:
                if (keyboard_key == vk_anykey)
                    return 0;
                
                return keyboard_key;
                break;
        }
    }
    
    return 0;
}
