function scr_get_keyboard_num()
{
    if (keyboard_check_pressed(ord("0")))
        return 0;
    
    if (keyboard_check_pressed(ord("1")))
        return 1;
    
    if (keyboard_check_pressed(ord("2")))
        return 2;
    
    if (keyboard_check_pressed(ord("3")))
        return 3;
    
    if (keyboard_check_pressed(ord("4")))
        return 4;
    
    if (keyboard_check_pressed(ord("5")))
        return 5;
    
    if (keyboard_check_pressed(ord("6")))
        return 6;
    
    if (keyboard_check_pressed(ord("7")))
        return 7;
    
    if (keyboard_check_pressed(ord("8")))
        return 8;
    
    if (keyboard_check_pressed(ord("9")))
        return 9;
}
