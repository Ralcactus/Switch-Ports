/// @function								scr_sound(sound...)
/// @param {Asset.GMSound}  sound					The soundeffect to play
/// @description							Plays soundeffect.
function scr_sound()
{
    var snd = audio_play_sound(argument[irandom(argument_count - 1)], 1, false);
    audio_sound_gain(snd, global.soundVolume, 0);
    return snd;
}

/// @function								scr_soundloop(sound...)
/// @param {Asset.GMSound}  sound					The soundeffect to play
/// @description							Plays soundeffect but looped.
function scr_soundloop()
{
	if (argument[irandom(argument_count - 1)] == -4)
		return -4;
		
    var snd = audio_play_sound(argument[irandom(argument_count - 1)], 1, true);
    audio_sound_gain(snd, global.soundVolume, 0);
    return snd;
}

/// @function								scr_dialogue(sound...)
/// @param {asset}  sound					The sound to play
/// @description							Plays dialogue.
function scr_dialogue()
{
    var snd = audio_play_sound(argument[irandom(argument_count - 1)], 1, false);
    audio_sound_gain(snd, global.dialogueVolume, 0);
    return snd;
}

/// @function								scr_music(sound, loop_begin, loop_end)
/// @param {real}  sound					The Music to play
/// @param {real}  loop_begin_inSeconds		Where the loop starts
/// @param {real}  loop_end_inSeconds		Where the loop ends
/// @description							Plays music.
function scr_music(snd, loop_begin = 0, loop_end = undefined)// so it actually does jack shit
{
    var _snd = audio_play_sound(snd, 10, true);
    audio_sound_gain(_snd, global.musicVolume, 0);
    return _snd;
}

/// @function								scr_musicnoloop(sound)
/// @param {real}  sound					The Music to play
/// @description							Plays music with no loops.
function scr_musicnoloop(snd)
{
    global.music = audio_play_sound(snd, 10, false);
    audio_sound_gain(global.music, global.musicVolume, 0);
    return global.music;
}

function audio_stop_all_music()
{
    with (obj_music)
    {
        audio_stop_sound(global.music);
        audio_stop_sound(prevmuID);
        audio_stop_sound(global.secretmusic);
        audio_stop_sound(global.harrymusic);
        global.music = noone;
        prevmuID = noone;
        global.secretmusic = noone;
        global.harrymusic = noone;
    }
}

function force_song(_song, _secret_song, reset_on_room_change = true, _loop_begin = 0, _loop_end = undefined)
{
    with (obj_music)
    {
        room_details = 
        {
            rm: devroom,
            song: _song,
            secret_song: _secret_song,
            continuous: false,
            loop_begin: _loop_begin,
            loop_end: _loop_end
        };
        ignore_change = true;
        hard_force = reset_on_room_change;
        unforce_continuous = true;
        event_perform(ev_other, ev_room_start);
    }
    return;
}

function scr_get_music_loop(snd)
{
    if (!audio_is_playing(snd))
        return 0;
    
    var file = asset_get_index(audio_get_name(snd));
    
    switch (file)
    {
        default:
            return 0;
            break;
        
        case mu_sucrose:
            return 8.15;
            break;
    }
}
