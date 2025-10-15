function scr_pausemusic() //scr_pausemusic
{
    with (obj_music)
    {
        if (music != noone)
        {
            other.savedPauseMusic = audio_is_paused(obj_music.musicID)
            other.savedPauseSecret = audio_is_paused(obj_music.secretmusic)
            audio_pause_sound(obj_music.musicID)
            audio_pause_sound(obj_music.secretmusic)
        }
        other.savedPauseEscape = audio_is_playing(mu_botuctime)
        audio_pause_sound(mu_botuctime)
        other.savedPausePillar = audio_is_playing(bonoise_pillar)
        audio_pause_sound(bonoise_pillar)
    }
    if audio_is_playing(beepboop)
        audio_pause_sound(beepboop)
}

function scr_unpausemusic() //scr_unpausemusic
{
    with (obj_music)
    {
        if (music != noone)
        {
            if (musicID != -4)
                audio_resume_sound(obj_music.musicID)
            if (musicID != -4)
                audio_resume_sound(obj_music.secretmusicID)
        }
        if global.panic && !secret
		{
			audio_resume_sound(mu_botuctime)
		}
        audio_pause_sound(bonoise_pillar)
		
    }
    if (global.redcoin > 0)
        audio_resume_sound(beepboop)
    with (obj_pauseNew)
    {
        audio_pause_sound(mu_pause)
    }
}

function scr_pauseinstances() //scr_pauseinstances
{
    ds_list_clear(global.PauseInstances)
    for (var i = 0; i < instance_count; i++)
    {
        var me = instance_find(all, i)
        if (instance_exists(me) && me.object_index != obj_fmod && me.object_index != obj_pauseNew && me.object_index != obj_inputController && me.object_index != obj_music)
            ds_list_add(global.PauseInstances, me)
    }
    instance_deactivate_all(true)
    instance_activate_object(obj_fmod)
    instance_activate_object(obj_manager) // specil
    instance_activate_object(obj_savesystem)
    instance_activate_object(obj_pauseNew)
    instance_activate_object(obj_music)
    instance_activate_object(obj_inputController)
    instance_activate_object(obj_globaltimer)

}

function scr_unpauseinstances() //scr_unpauseinstances
{
	// lol
}

function pause_all_sounds(argument0) //pause_all_sounds
{
    trace(concat("pause_all_sounds()", string(argument0)))

}

function stop_all_sounds() //stop_all_sounds
{
    trace("stop_all_sounds()")
}

