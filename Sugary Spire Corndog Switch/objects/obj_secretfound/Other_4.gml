if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    global.secretfound++;
    
    with (obj_tv)
    {
        if (room != rm_garcon)
            scr_controlprompt("[spr_promptfont]You have found " + string(global.secretfound) + ((global.secretfound > 1) ? " secrets out of 3!" : " secret out of 3!"), -4, 150);
        else
            scr_controlprompt("[spr_promptfont]You have found 1 secret.");
        
        showtext = 1;
        alarm[0] = 150;
    }
    
    ds_list_add(global.SaveRoom, id);
}
