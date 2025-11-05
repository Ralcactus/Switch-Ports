if (async_load[? "type"] != "fmod_studio_event_description_set_callback")
    exit;

if (async_load[? "kind"] != FMOD_STUDIO_EVENT_CALLBACK.TIMELINE_BEAT)
    exit;

flowstate = !flowstate;
flowspr = flowstate ? spr_soundtestflowright : spr_soundtestflowleft;
flowframe = 0;
