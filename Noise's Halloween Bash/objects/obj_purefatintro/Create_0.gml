enum intro
{
	pep_mouthopen = 0,
	pep_recliner = 1,
	pep_recliner_zoomout = 2,
	truck_enter_wZoomout = 3,
	truck_enter = 4,
	truck_door_fall = 5,
	logo_enter = 6,
	logo_fade = 7
}

introstate = intro.pep_mouthopen;
frontx = 352;
fronty = 64;
frontind = 0;
sidex = 864;
sidey = 544;
sidezoom = 1;
sidezoomtarget = 0.37;
truckx = -438;
trucky = 57;
trucktargetx = -10;
truckspeed = 7;
truckreachedmax = 0;
truckdoory = 0;
truckdoorspeed = 0.6;
truckdoorspeedtarget = 3;
logofade = 1;
introaudio = event_instance("event:/music/introaudio");
fmod_studio_event_instance_start(introaudio);
