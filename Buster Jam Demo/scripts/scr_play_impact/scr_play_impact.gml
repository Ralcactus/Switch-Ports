function scr_play_impact()
{
    var _num = irandom_range(0, 6);
    var _snd = asset_get_index(string("snd_impact{0}", _num));
    return audio_play_sound(_snd, 0, false);
}
