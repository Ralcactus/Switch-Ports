scr_collision_init()
grav = 0.5
depth = -4
event_play_oneshot("event:/SFX/player/breakdanceSpawn", x, y)
songInst = fmod_createEventInstance("event:/SFX/player/breakdance")
fmod_studio_event_instance_start(songInst)
fmod_studio_event_instance_set_paused(songInst, true)
fmod_quick3D(songInst)
