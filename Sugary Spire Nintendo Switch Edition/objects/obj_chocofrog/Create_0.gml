event_inherited()
depth = 4
image_speed = 0.35
deadSpr = spr_chocofrogbigdead
croakingNoise = fmod_createEventInstance("event:/SFX/general/frogcroaking")
fmod_event_set3DPosition(croakingNoise, x, y)
fmod_studio_event_instance_start(croakingNoise)
