function scr_sleep(amount = undefined)
{
    with (obj_camera)
    {
        if (global.hitstunalarm <= -1 && !global.freezeframe)
        {
            if (is_undefined(amount))
                freezetype = false;
            else
            {
                freezeval = amount;
                freezetype = true;
            }
            
            NextFreeze = true;
        }
    }
}
