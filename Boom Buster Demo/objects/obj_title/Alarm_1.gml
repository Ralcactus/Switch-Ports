state++;

if (state == 2)
{
    audio_play_sound(snd_explosion, 0, 0);
    explosion = instance_create_layer(960, 540, "Transition", obj_trans_explosion);
}
