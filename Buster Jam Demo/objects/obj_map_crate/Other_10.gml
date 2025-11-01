for (var i = 0; i < irandom_range(8, 10); i++)
{
    var _fx = instance_create_layer(x + 32, (y + 32 + z) - 16, "FX", obj_map_fx);
    _fx.rot_spd = choose(-8, 8);
    _fx.grav = 0.5;
    _fx.vspd = random_range(-5, -2);
    _fx.hspd = random_range(-10, 10);
    _fx.anim_sprite = spr_fx_crate;
    _fx.anim_end_die = false;
    _fx.fadeout = true;
    _fx.fade_spd = 0.05;
    _fx.image_alpha = 1.8;
    
    if (freeze_ignore)
        array_push(global.map_freeze_ignore, _fx);
}

var _snd = audio_stop_play(snd_crate, 0, 0);
audio_sound_pitch(_snd, choose(0.9, 1, 1.1));
screen_shake(5.5, 5.5);
instance_destroy();

if (!already_got)
{
    var _key = string("{0} x:{1} y: {2} z: {3}", room_get_name(room), xstart, ystart, zstart);
    ds_map_add(global.map_got, _key, 1);
}
