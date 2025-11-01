testvariablenothing = false;
print(string("BGM:{0}", global.bgm_vol));
print(string("SFX:{0}", global.sfx_vol));
print(string("Master:{0}", global.master_vol));
var _volSFX = global.sfx_vol * global.master_vol;
var _volBGM = global.bgm_vol * global.master_vol;
print(string("_volSFX:{0}", _volSFX));
print(string("_volBGM:{0}", _volBGM));

for (var i = 0; i < array_length(musics); i++)
{
    var _snd = asset_get_index(musics[i][0]);
    var _vol = musics[i][1];
    print(string("musics[i] {0}", _volBGM * _vol));
    audio_sound_gain(_snd, _volBGM * _vol, 0);
}

for (var i = 0; i < array_length(sounds); i++)
{
    var _snd = asset_get_index(sounds[i][0]);
    var _vol = sounds[i][1];
    audio_sound_gain(_snd, _volSFX * _vol, 0);
}
