function scr_double_click()
{
    if (global.double_click)
    {
        global.double_click = false;
        clicks = 0;
        click_delay = 0;
    }
    
    if (click_delay)
    {
        click_delay--;
        
        if (click_delay == 0)
            clicks = false;
    }
    
    if (mouse_check_button_pressed(mb_left))
    {
        clicks++;
        click_delay = 15;
    }
    
    if (clicks == 2)
        global.double_click = true;
}
