var _dir = input_check_opposing_pressed("up", "down");
var _prevselected = selected;
selected += _dir;

if (selected < 0)
    selected += array_length(musiclist);

if (selected > (array_length(musiclist) - 1))
    selected -= array_length(musiclist);

if (selected != _prevselected)
    event_play_oneshot("event:/sfx/pausemenu/move");

if (input_check_pressed("jump"))
{
    if (super < array_length(superCode))
    {
        if (selected == superCode[super])
        {
            if (++super == array_length(superCode))
            {
                easteregged = true;
                save_easteregg("joyIsEndless");
            }
        }
        else
            super = 0;
    }
    
    if (muevent != noone && selected == curmusic)
        fmod_studio_event_instance_set_paused(muevent, !fmod_studio_event_instance_get_paused(muevent));
    else
    {
        if (muevent != noone)
            destroy_sounds([muevent]);
        
        curmusic = selected;
        muevent = event_instance(musiclist[selected][0]);
        fmod_studio_event_instance_set_callback(muevent, FMOD_STUDIO_EVENT_CALLBACK.TIMELINE_BEAT);
        fmod_studio_event_instance_start(muevent);
        flowstate = false;
        vinylspin = 0;
    }
}

if (input_check_pressed("attack"))
{
    input_verb_consume(["jump", "attack", "inv"]);
    
    if (muevent != noone)
    {
        destroy_sounds([muevent]);
        muevent = noone;
        flowstate = false;
    }
    else
    {
        muevent = noone;
        instance_destroy();
    }
}

if (flowspr != spr_soundtestflow && sprite_animation_end(flowspr, flowframe, undefined, 0.35))
{
    flowspr = spr_soundtestflow;
    flowframe = 0;
}
else
    flowframe += 0.35;

if (easteregged)
{
    if (muevent != noone)
    {
        if (!fmod_studio_event_instance_get_paused(muevent))
        {
            vinylspin++;
            vinylspin %= 360;
        }
    }
    else
        vinylspin = 0;
}
