event_inherited();

if (global.hp == global.hpmax)
{
    event_cash();
    audio_queue(choose(voice_buster_wow, voice_buster_wow2, voice_buster_wow3, voice_buster_wowbig), 12, true, true);
}
else
{
    global.hp++;
    audio_play_sound(snd_hp, 0, 0);
    audio_queue(choose(voice_buster_wow, voice_buster_wow2, voice_buster_wow3, voice_buster_wowbig), 15, true, true);
    instance_destroy();
}
