audio_stop_sound(sound_taunt1);
audio_stop_sound(sound_taunt2);
audio_stop_sound(sound_taunt3);
audio_stop_sound(sound_taunt4);
audio_stop_sound(sound_taunt5);
audio_stop_sound(sound_taunt6);
audio_stop_sound(sound_taunt7);
audio_stop_sound(sound_taunt8);
var tauntsound = choose(sound_taunt1, sound_taunt2, sound_taunt3, sound_taunt4, sound_taunt5, sound_taunt6, sound_taunt7, sound_taunt8);

if (bbox_in_camera(view_camera[0]))
    scr_sound(tauntsound);

image_speed = 0.5;
