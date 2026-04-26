canmove = false;
event_play_oneshot("event:/SFX/ui/confirm");
fmod_event_setParameter(pauseMusic, "state", 1, false);
instance_create(0, 0, obj_optionNew);
