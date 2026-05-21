var songTimer = audio_sound_get_track_position(global.music);
var _fps = 60 / game_get_speed(gamespeed_fps);
var checkBeat = floor(songTimer / (spb * _fps));

if (beat != checkBeat)
{
    beat = checkBeat;
    show_debug_message("Flip");
    scr_sound(sfx_bloop);
}
