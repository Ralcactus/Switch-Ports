testvariablenothing = false;
var _fx = instance_create_layer(x, y - 120, "FX", obj_universal_fx);

with (_fx)
{
    anim_play(spr_fx_explosion);
    image_xscale = 1.6;
    image_yscale = 1.6;
}

audio_play_sound(snd_explosion, 0, 0);
instance_destroy();
