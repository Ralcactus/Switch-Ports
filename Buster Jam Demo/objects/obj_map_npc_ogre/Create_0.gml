testvariablenothing = false;
event_inherited();
glyph_player = true;
idle_is_talk = true;
anim_play(sprite_index);
char_speak = "ogre";

event_shake = function()
{
    shake = 1;
};

event_fly = function()
{
    zspd = -20;
    shake = 0;
    audio_play_sound(snd_explosion, 0, 0);
    var _fx = instance_create_layer(8832, 2400, "FX", obj_map_fx);
    _fx.anim_sprite = spr_fx_explosion;
    _fx.anim_index = 1;
    _fx.image_xscale = 1.8;
    _fx.image_yscale = 1.8;
    screen_shake(28, 28);
    
    with (interact)
        instance_destroy();
};

zspd = 0;
shake = 0;
