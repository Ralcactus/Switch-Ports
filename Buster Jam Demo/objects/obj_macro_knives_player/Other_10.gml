testvariablenothing = false;
global.microgame_hspd = 0;
audio_play_sound(voice_buster_ow2, 0, 0);

with (obj_macro_knives_controller)
{
    shake = 1;
    shake_dec = 0.04;
}

if (side == 1)
    y += down_yoff;

layer = layer_get_id("Player");
instance_create_layer(x, y, layer, obj_macro_knives_player_death);
instance_destroy();
