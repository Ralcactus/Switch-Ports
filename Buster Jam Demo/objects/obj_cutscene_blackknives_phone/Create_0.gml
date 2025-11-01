testvariablenothing = false;
event_inherited();
surf_phone = -4;
emitter = audio_emitter_create();
bus = audio_bus_create();
audio_emitter_bus(emitter, bus);
var _ef_hipass = audio_effect_create((3 << 0), 
{
    bypass: true,
    cutoff: 4000,
    q: 1.5
});
bus.effects[0] = _ef_hipass;
sound_play = audio_play_sound_on(emitter, snd_blackknives_spacecat, true, 0);
audio_last_pos = 0;

event_muffle = function()
{
    bus.effects[0].bypass = false;
    visible = false;
    audio_sound_gain(sound_play, 0.65, 0);
    
    if (layer_sequence_exists("GUI", my_seq))
        layer_sequence_destroy(my_seq);
    
    with (obj_cutscene_blackknives_cat_bg)
        instance_destroy();
};

get_cams();
my_seq = layer_sequence_create("GUI", camx + 960, camy + 540, seq_bridget_phone);
layer_sequence_pause(my_seq);
sound_effects = [];
array_push(sound_effects, [83, snd_blackknives_spacecat_like, false]);
array_push(sound_effects, [143, snd_blackknives_spacecat_follow, false]);
alarm[0] = 1;
