if (room == realtitlescreen && instance_exists(obj_mainfartselect))
    obj_mainfartselect.alarm[0] = 3;

if (instance_exists(obj_pause))
{
    obj_pause.alarm[0] = 3;
    fmod_event_setParameter(obj_pause.pauseMusic, "state", 0, false);
    obj_pause.key_jump = false;
}
