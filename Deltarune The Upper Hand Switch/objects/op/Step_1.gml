if (keyboard_check(vk_f4))
{
    if (F4toggle)
    {
        F4toggle = false;
        
        if (F4state == 0)
        {
            window_set_fullscreen(true);
            F4state = 1;
        }
        else
        {
            window_set_fullscreen(false);
            F4state = 0;
            window_set_size(1280, 960);
            window_center();
        }
    }
}
else
{
    F4toggle = true;
}

temp = false;

if (global.gamepad_main != undefined)
{
    if (gamepad_button_check(global.gamepad_main, gp_start))
        temp = true;
}

if (keyboard_check(vk_escape) || temp)
{
    if (room == rMainMenu)
    {
        escape += 1;
    }
    else if (room != rTest)
    {
        if (escape < 39)
            escape = 39;
        
        if (escape < 39 && (debug || customMode))
            escape = 39;
        
        escape += 1;
    }
}
else
{
    escape = 0;
}

if (room != rEnding)
{
    srt_msec++;
    
    if (srt_msec >= 30)
    {
        srt_msec = 0;
        srt_sec++;
    }
    
    if (srt_sec >= 60)
    {
        srt_sec = 0;
        srt_min++;
    }
}

if (room == rMainMenu)
    eggCounter = 0;

if (!keyboard_check(vk_f9))
    codeCheck = false;

if (keyboard_check_pressed(vk_f9) && code != 1)
{
    code++;
    codeString = "";
    codeCheck = true;
}

if (benAlways)
    benMode = true;

if (alexAlways)
    alexMode = true;
