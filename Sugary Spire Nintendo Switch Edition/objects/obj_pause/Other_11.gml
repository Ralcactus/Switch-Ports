canmove = false
event_play_oneshot("event:/SFX/ui/confirm")
fmod_studio_event_instance_set_parameter_by_name(pauseMusic, "state", 1, false)
instance_create(0, 0, obj_option)
