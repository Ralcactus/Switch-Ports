if (savestate != save_state.idle)
{
    saveiconalpha = 3;
    
    if (savestate == save_state.dumpconfig)
        saveiconspr = spr_configsaveindicator;
    else
        saveiconspr = spr_saveindicator;
}
else
{
    saveiconalpha -= 0.05;
    
    if (saveiconalpha < 0)
        saveiconalpha = 0;
    
    if (!ds_queue_empty(savequeue))
    {
        var _queuedfunc = ds_queue_dequeue(savequeue);
        _queuedfunc();
    }
}

saveiconind += 0.25;
saveiconind %= sprite_get_number(saveiconspr);
