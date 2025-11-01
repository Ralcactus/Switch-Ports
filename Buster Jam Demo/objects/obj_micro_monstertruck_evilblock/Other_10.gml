var _inst = instance_create_micro(x, y, "Over1", obj_micro_fx);

with (_inst)
    anim_play(spr_micro_monstertruck_explosion);

with (controller)
{
    screenshake[0] = 12;
    screenshake[1] = 12;
    zoom = 0.955;
}

instance_destroy();
var _mult = 3;

for (var i = 0; i < irandom_range(6, 8); i++)
{
    var _fx = instance_create_micro(x, y - 45, layer, obj_micro_monstertruck_shard);
    _fx.image_index = irandom_range(0, sprite_get_number(spr_micro_monstertruck_blockshard) - 1);
    _fx.x += irandom_range(-16, 16);
    _fx.y += irandom_range(-16, 16);
}

audio_play_sound_on(controller.audio, snd_micro_monstertruck_smash, false, 0);
