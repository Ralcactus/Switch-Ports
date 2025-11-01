var istart = irandom_range(0, sprite_get_number(spr_Bu_smash_shards) - 1);

for (var i = 0; i < (sprite_get_number(spr_Bu_smash_shards) - 1); i++)
{
    var _inst = instance_create_layer(x + irandom_range(-120, 120), y + irandom_range(-120, 120), layer, obj_Bu_smash_shard);
    _inst.image_index = istart + i;
    _inst.controller = controller;
    _inst.ID = controller.ID;
    
    if (_inst.x > x)
        _inst.hspd = irandom_range(8, 12);
    else
        _inst.hspd = irandom_range(-8, -12);
    
    _inst.vspd = irandom_range(-6, -12);
    _inst.image_angle = irandom_range(0, 360);
}

audio_play_sound_on(controller.audio, snd_Bu_smash_brick, 0, 0);
