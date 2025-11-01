testvariablenothing = false;
event_inherited();

if (surface_exists(surf_phone))
    surface_free(surf_phone);

if (audio_is_playing(sound_play))
    audio_stop_sound(sound_play);

if (audio_emitter_exists(emitter))
    audio_emitter_free(emitter);

if (layer_sequence_exists(my_seq, "GUI"))
    layer_sequence_destroy(my_seq);
