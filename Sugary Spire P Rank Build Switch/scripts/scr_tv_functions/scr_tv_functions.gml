function scr_queue_tvanim(spr = noone, buffer = 150)
{
    with (obj_tv)
    {
        if (expressionsprite != spr && spr != idletvspr)
        {
            expressionsprite = spr;
            draw_static = true;
            state = states.tv_transition;
            static_index = 0;
            expressiontime = buffer;
        }
    }
}

function scr_forceplay_tvanim(arg0 = -4, arg1 = 150)
{
	///@param sprite_index
	///@param anim_length
    obj_tv.tvsprite = ds_queue_dequeue(arg0);
    obj_tv.tvlength = ds_queue_dequeue(arg1);
    ds_queue_clear(global.newhudtvanim);
}

function scr_queue_message(arg0 = "", arg1 = noone)
{
	///@param string
	///@param insert_sprite_here_to_activate_talkingsprs
    ds_queue_enqueue(global.newhudmessage, arg0);
    
    if (arg1 != noone)
        scr_queue_tvanim(arg1, 1000);
}

function scr_controlprompt(prompt = "[spr_promptfont]No prompt set", save = prompt, time = string_length(prompt) * 15)
{
    time = clamp(time, 60, 450);
    var type = 0;
    
    if (save == noone)
        type = 1;
    
    if (save == -1)
        type = 2;
    
    with (obj_tv)
    {
        if (type != 2)
        {
            if (!ds_list_find_index(global.saveroom, save) || type == 1)
            {
                controlprompt = prompt;
                prompt_timer = time;
                ds_list_add(global.saveroom, save);
            }
        }
        else
        {
            controlprompt = prompt;
            prompt_timer = 2;
        }
    }
    return;
}
