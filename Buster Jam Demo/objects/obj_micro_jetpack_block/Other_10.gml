var _snd = audio_play_sound_on(controller.audio, snd_micro_jetpack_break, false, 0);
audio_sound_pitch(_snd, choose(0.95, 1, 1.05));
instance_destroy();
var _exists = false;

with (obj_micro_jetpack_block)
{
    if (ID == other.ID)
        _exists = true;
}

if (!_exists)
{
    scr_micro_win();
    controller.zoom = 0.94;
    
    with (controller)
    {
        win = true;
        zoom = 0.94;
        
        if (timer[0] > (60 * time_bpm_to_seconds(140) * 4))
            event_round_time(4);
    }
    
    with (obj_micro_jetpack_bg)
    {
        if (ID == other.ID)
            event_user(0);
    }
}

var istart = irandom_range(0, sprite_get_number(spr_Bu_smash_shards) - 1);

for (var i = 0; i < irandom_range(4, 6); i++)
{
    var _inst = instance_create_micro(x + irandom_range(-70, 70), y + irandom_range(-70, 70), layer, obj_micro_jetpack_shard);
    _inst.image_index = istart + i;
    
    if (_inst.x > x)
        _inst.hspd = irandom_range(8, 12);
    else
        _inst.hspd = irandom_range(-8, -12);
    
    _inst.vspd = irandom_range(-6, -12);
    _inst.image_angle = irandom_range(0, 360);
}
