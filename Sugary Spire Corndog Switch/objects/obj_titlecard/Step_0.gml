if (!shown)
{
    if (!fadein)
        fadealpha += 0.1;
    
    if (fadealpha >= 1)
    {
        alarm[0] = time_in_frames(0, 4);
        shown = true;
        room_goto_fixed(rm_titlecard);
        
        if (info.song != -4)
        {
            sound = fmod_createEventInstance(info.song);
            fmod_event_play(sound);
        }
        
        switch (info.bginfo[1])
        {
            case UnknownEnum.Value_0:
                bgY = -sprite_get_height(info.bginfo[0]);
                bgX = 0;
                break;
            
            case UnknownEnum.Value_1:
                bgY = sprite_get_height(info.bginfo[0]);
                bgX = 0;
                break;
            
            case UnknownEnum.Value_2:
                bgY = 0;
                bgX = -sprite_get_width(info.bginfo[0]);
                break;
            
            case UnknownEnum.Value_3:
                bgY = 0;
                bgX = sprite_get_width(info.bginfo[0]);
                break;
        }
        
        switch (info.titleinfo[1])
        {
            case UnknownEnum.Value_0:
                titleY = -750;
                titleX = 0;
                break;
            
            case UnknownEnum.Value_1:
                titleY = 750;
                titleX = 0;
                break;
            
            case UnknownEnum.Value_2:
                titleY = 0;
                titleX = -1280;
                break;
            
            case UnknownEnum.Value_3:
                titleY = 0;
                titleX = 1280;
                break;
        }
    }
}
else
{
    if (info.bginfo[2] == UnknownEnum.Value_5)
    {
        bgX = lerp(bgX, info.bginfo[4], 0.1) + ((info.bginfo[3] == UnknownEnum.Value_7) ? irandom_range(-2, 2) : 0);
        bgY = lerp(bgY, info.bginfo[5], 0.1) + ((info.bginfo[3] == UnknownEnum.Value_6) ? wave(2, -2, 5, 0) : 0) + ((info.bginfo[3] == UnknownEnum.Value_7) ? irandom_range(-2, 2) : 0);
    }
    else
    {
        bgX = approach(bgX, info.bginfo[4], 40) + ((info.bginfo[3] == UnknownEnum.Value_7) ? irandom_range(-2, 2) : 0);
        bgY = approach(bgY, info.bginfo[5], 40) + ((info.bginfo[3] == UnknownEnum.Value_6) ? wave(2, -2, 5, 0) : 0) + ((info.bginfo[3] == UnknownEnum.Value_7) ? irandom_range(-2, 2) : 0);
    }
    
    step += 0.025;
    
    if (round(step) > 0)
    {
        if (info.titleinfo[2] == UnknownEnum.Value_5)
        {
            titleX = lerp(titleX, info.titleinfo[4], 0.1) + ((info.titleinfo[3] == UnknownEnum.Value_7) ? irandom_range(-2, 2) : 0);
            titleY = lerp(titleY, info.titleinfo[5], 0.1) + ((info.titleinfo[3] == UnknownEnum.Value_6) ? wave(2, -2, 5, 0) : 0) + ((info.titleinfo[3] == UnknownEnum.Value_7) ? irandom_range(-2, 2) : 0);
        }
        else
        {
            titleX = approach(titleX, info.titleinfo[4], 40) + ((info.titleinfo[3] == UnknownEnum.Value_7) ? irandom_range(-2, 2) : 0);
            titleY = approach(titleY, info.titleinfo[5], 40) + ((info.titleinfo[3] == UnknownEnum.Value_6) ? wave(2, -2, 5, 0) : 0) + ((info.titleinfo[3] == UnknownEnum.Value_7) ? irandom_range(-2, 2) : 0);
        }
    }
}
