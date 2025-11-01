var _inst = instance_create_micro(x, y, "Over1", obj_micro_fx);

with (_inst)
    anim_play(spr_micro_monstertruck_explosion);

with (controller)
{
    screenshake[0] = 28;
    screenshake[1] = 28;
    zoom = 0.93;
}

draw = false;
var _mult = 3;

for (var i = 0; i < 15; i++)
{
    var _fx = instance_create_micro(x, y - 45 - 30, layer, obj_micro_monstertruck_shard);
    _fx.image_index = irandom_range(0, sprite_get_number(spr_micro_monstertruck_blockshard) - 1);
    _fx.x += irandom_range(-16, 16);
    _fx.y += irandom_range(-16, 16);
    _fx.vspd = random_range(-25, -42);
    _fx.hspd = random_range(-26, 26);
}

instance_create_micro(0, 0, "Over1", obj_micro_monstertruck_lose);
audio_play_sound_on(controller.audio, snd_micro_monstertruck_smash, false, 0);

if (audio_is_playing(scream_sound))
    audio_stop_sound(scream_sound);
