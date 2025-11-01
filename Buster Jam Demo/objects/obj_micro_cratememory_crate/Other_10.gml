audio_play_sound_on(controller.audio, snd_break_barrel, 0, 0);
var _ind_off = irandom_range(-2, 2);

for (var i = 0; i < irandom_range(5, 7); i++)
{
    var _x = x + 25 + irandom_range(25, 243);
    var _y = y + 25 + irandom_range(293, 171);
    var _fx = instance_create_micro(_x, _y, "Over1", obj_micro_cratememory_shard);
    _fx.image_speed = 0;
    _fx.image_index = i + _ind_off;
    _fx.hspd = random_range(3.5, 7.5);
    _fx.vspd = random_range(-5, -10);
    _fx.hspd *= choose(-1, 1);
}

if (has_coin)
{
    scr_micro_win();
    instance_create_micro(x, y, layer, obj_micro_cratememory_coingot);
    audio_play_sound_on(controller.audio, snd_coin, 0, 0);
    obj_micro_cratememory.buster_spr = spr_micro_cratememory_buster_win;
}
else
{
    obj_micro_cratememory.buster_spr = spr_micro_cratememory_buster_loss;
    audio_play_sound_on(controller.audio, voice_buster_ow2, 0, 0);
}

obj_micro_cratememory.buster_ind = 0;
controller.screenshake[0] = 12;
controller.screenshake[1] = 12;
instance_destroy();
