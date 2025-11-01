testvariablenothing = false;
event_inherited();
idle_is_talk = true;
anim_play(sprite_index);

event_shake = function()
{
    shake = 1;
};

event_fly = function()
{
    zspd = -21;
    shake = 0;
    audio_play_sound(snd_explosion, 0, 0);
    var _fx = instance_create_layer(1779, 4004, "FX", obj_map_fx);
    _fx.anim_sprite = spr_fx_explosion;
    _fx.anim_index = 1;
    screen_shake(16, 16);
    
    with (interact)
        instance_destroy();
};

zspd = 0;
shake = 0;
