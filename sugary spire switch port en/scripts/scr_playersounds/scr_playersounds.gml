function scr_playersounds_init()
{
	sndMach              = 0;
	sndMachStart         = 0;
	sndGalloping         = 0;
	sndSpinning          = 0;
	spinSoundBuffer      = 0;
	sndSuplex            = 0;
	sndKungFu            = 0;
	sndJump              = 0;
	sndFlip              = 0;
	sndWallkick          = 0;
	sndWallkickCancel    = 0;
	sndWallkickStart     = 0;
	sndWallkickLand      = 0;
	sndFreefall          = 0;
	sndSuperjump         = 0;
	sndSuperjumpRelease  = 0;
	sndCottonDigging     = 0;
	sndTumble            = 0;
	sndRoll              = 0;
	sndGrind             = 0;
	sndFireass           = 0;
	sndCrouchslide       = 0;
	sndRollGetUp         = 0;
	sndDive              = 0;
	sndMinecart          = 0;
	sndMinecartJump      = 0;
	voiceScream          = 0;
	voiceCollect         = 0;
	voiceTransfo         = 0;
	voiceDetransfo       = 0;
	voiceIdle            = 0;
	voiceHurt            = 0;
	transfoSound = undefined
	oldTransfoSound = undefined
	mySoundArray = [sndMach, sndMachStart, sndSuplex, sndKungFu, sndGalloping, sndJump, sndFlip, sndWallkick, sndWallkickCancel, sndWallkickStart, sndWallkickLand, sndFreefall, sndSuperjump, sndSuperjumpRelease, sndCottonDigging, sndMinecart, sndTumble, sndRoll, sndGrind, sndFireass, sndCrouchslide, sndRollGetUp, sndDive, sndMinecart, sndMinecartJump, voiceScream, voiceCollect, voiceTransfo, voiceDetransfo, voiceIdle, voiceHurt]
}

function scr_playersounds()
{
	var saved_state = global.freezeframe ? frozenState : state
	
	if (saved_state != PlayerState.actor)
	{
		transfoSound = scr_transformationCheck(saved_state)
		var _has_transfo = !is_undefined(transfoSound)
		fmod_studio_system_set_parameter_by_name("transfo", _has_transfo, false)
		
		if (oldTransfoSound != transfoSound && transfoSound != "Ball")
		{
			oldTransfoSound = transfoSound
			
			if (chance(50))
				fmod_studio_event_instance_start(_has_transfo ? voiceTransfo : voiceDetransfo)
			
			event_play_oneshot(_has_transfo ? "event:/SFX/general/transfo" : "event:/SFX/general/detransfo", x, y)
			
			switch (_has_transfo ? transfoSound : oldTransfoSound)
			{
				case "Werecotton":
					if (!_has_transfo)
						event_play_oneshot("event:/SFX/cotton/lose", x, y)
					
					break
			}
		}
	}
	
	if (sprite_index == spr_tumblestart || sprite_index == spr_tumble)
	{
		if (!event_instance_isplaying(sndTumble))
		{
			if (sprite_index == spr_tumblestart)
				fmod_studio_event_instance_set_parameter_by_name(sndTumble, "state", 0, true)
			else
				fmod_studio_event_instance_set_parameter_by_name(sndTumble, "state", 1, true)
			
			fmod_studio_event_instance_start(sndTumble)
		}
	}
	else if (event_instance_isplaying(sndTumble))
	{
		fmod_studio_event_instance_stop(sndTumble, false)
	}
	
	if (event_instance_isplaying(sndSuplex) && saved_state != PlayerState.grabdash)
		fmod_studio_event_instance_stop(sndSuplex, true)
	
	if (saved_state == PlayerState.wallkick && (sprite_index == spr_wallJumpIntro || sprite_index == spr_wallJump))
	{
		if (!event_instance_isplaying(sndWallkick))
			fmod_studio_event_instance_start(sndWallkick)
	}
	else
	{
		fmod_studio_event_instance_stop(sndWallkick, false)
	}
	
	if (saved_state == PlayerState.minecart && grounded && vsp > 0 && sprite_index != spr_player_PZ_minecart_spinOut)
	{
		if (!event_instance_isplaying(sndMinecart))
			fmod_studio_event_instance_start(sndMinecart)
	}
	else
	{
		fmod_studio_event_instance_stop(sndMinecart, false)
	}
	
	if ((saved_state == PlayerState.grind && grounded && vsp > 0) || saved_state == PlayerState.hang)
	{
		if (!event_instance_isplaying(sndGrind))
			fmod_studio_event_instance_start(sndGrind)
	}
	else
	{
		fmod_studio_event_instance_stop(sndGrind, false)
	}
	
	if (saved_state == PlayerState.charge)
	{
		if (spinSoundBuffer-- < 0)
		{
			fmod_studio_event_instance_start(sndSpinning)
			fmod_event_set3DPosition(sndSpinning, x, y, 0)
			spinSoundBuffer = 14
		}
	}
	else
	{
		spinSoundBuffer = 0
		fmod_studio_event_instance_stop(sndSpinning, true)
	}
	
	if (saved_state == PlayerState.cottondig && place_meeting(x, y, obj_cottonsolid))
	{
		if (!event_instance_isplaying(sndCottonDigging))
		{
			fmod_studio_event_instance_start(sndCottonDigging)
			event_play_oneshot("event:/SFX/cotton/digIn", x, y)
		}
	}
	else if (event_instance_isplaying(sndCottonDigging))
	{
		fmod_studio_event_instance_stop(sndCottonDigging, false)
		event_play_oneshot("event:/SFX/cotton/digOut", x, y)
	}
	
	if (saved_state == PlayerState.machroll)
	{
		if (!event_instance_isplaying(sndRoll))
			fmod_studio_event_instance_start(sndRoll)
		else
			fmod_studio_event_instance_set_parameter_by_name(sndRoll, "state", mach3Roll > 0, true)
	}
	else
	{
		fmod_studio_event_instance_stop(sndRoll, true)
	}
	
	if (grounded && saved_state == PlayerState.doughmount && movespeed >= 12 && sprite_index != spr_player_PZ_dogMount_skid)
	{
		if (!event_instance_isplaying(sndGalloping))
			fmod_studio_event_instance_start(sndGalloping)
	}
	else if (event_instance_isplaying(sndGalloping))
	{
		fmod_studio_event_instance_stop(sndGalloping, true)
	}
	
	if (saved_state == PlayerState.freefall || saved_state == PlayerState.freefallprep || saved_state == PlayerState.superslam)
	{
		if (!event_instance_isplaying(sndFreefall))
			fmod_studio_event_instance_start(sndFreefall)
	}
	else
	{
		fmod_studio_event_instance_stop(sndFreefall, true)
	}
	
	if (saved_state == PlayerState.Sjumpprep)
	{
		if (!event_instance_isplaying(sndSuperjump))
			fmod_studio_event_instance_start(sndSuperjump)
	}
	else if (event_instance_isplaying(sndSuperjump))
	{
		fmod_studio_event_instance_stop(sndSuperjump, true)
		fmod_studio_event_instance_start(sndSuperjumpRelease)
	}
	
	if ((saved_state != PlayerState.Sjump || sprite_index == spr_superjumpCancelIntro) && event_instance_isplaying(sndSuperjumpRelease))
		fmod_studio_event_instance_stop(sndSuperjumpRelease, true)
	
	if (saved_state == PlayerState.mach2 || saved_state == PlayerState.run || saved_state == PlayerState.mach3 || saved_state == PlayerState.climbwall)
	{
		if (!event_instance_isplaying(sndMach))
			fmod_studio_event_instance_start(sndMach)
		
		var machsnd = 0
		
		if ((saved_state == PlayerState.mach2 && sprite_index == spr_mach1) || (saved_state == PlayerState.run && sprite_index == spr_mach1))
			machsnd = 1
		else if ((saved_state == PlayerState.mach2 && sprite_index == spr_mach2) || (saved_state == PlayerState.run && movespeed < 12) || (saved_state == PlayerState.climbwall && verticalMovespeed < 12))
			machsnd = 2
		else if ((saved_state == PlayerState.mach3 && sprite_index != spr_crazyrun) || saved_state == PlayerState.run || (saved_state == PlayerState.climbwall && verticalMovespeed >= 12))
			machsnd = 3
		else if (sprite_index == spr_crazyrun)
			machsnd = 4
		
		fmod_studio_event_instance_set_paused(sndMach, false)
		fmod_studio_event_instance_set_parameter_by_name(sndMach, "state", machsnd, true)
	}
	else
	{
		fmod_studio_event_instance_stop(sndMach, true)
	}
	
	for (var i = 0; i < array_length(mySoundArray); i++)
	{
		var snd_id = mySoundArray[i]
		
		if (event_instance_isplaying(snd_id))
			fmod_quick3D(snd_id)
	}
}
