function play_impact()
{
    audio_play_sound(asset_get_index(string("snd_impact{0}", irandom_range(0, 6))), 0, 0);
}
