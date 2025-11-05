fmod_studio_system_set_parameter_by_name("mastermute", global.unfocusedmute && !window_has_focus(), false);

if (global.musicattenuation)
{
    if (global.attenuationwait > 0)
    {
        if (media_playback_get_state() == 4)
            attenuationwait = floor(global.attenuationwait * 60);
        else
        {
            attenuationwait--;
            
            if (attenuationwait < 0)
                attenuationwait = 0;
        }
    }
    else
        attenuationwait = media_playback_get_state() == 4;
}
else
    attenuationwait = 0;

fmod_studio_system_set_parameter_by_name("musicmute", attenuationwait > 0, false);
soundtestmuted = instance_exists(obj_soundtest) || instance_exists(obj_devvideos);
soundtestmute = approach(soundtestmute, !soundtestmuted, 0.05);
fmod_studio_system_set_parameter_by_name("mastervol", global.mastervolume, false);
fmod_studio_system_set_parameter_by_name("musicvol", global.musicvolume * soundtestmute, false);
fmod_studio_system_set_parameter_by_name("sfxvol", global.sfxvolume, false);
fmod_studio_system_update();
global.dspval = array_create(0);

if (!dsp_init)
{
    var _group = fmod_studio_bus_get_channel_group(soundtestbus);
    
    if (fmod_last_result() != FMOD_RESULT.ERR_STUDIO_NOT_LOADED)
    {
        fmod_channel_control_add_dsp(_group, FMOD_CHANNELCONTROL_DSP_INDEX.HEAD, global.dsp);
        fmod_dsp_set_parameter_int(global.dsp, 1, 0);
        fmod_dsp_set_parameter_int(global.dsp, 0, resolution);
        dsp_init = true;
    }
}
else if (instance_exists(obj_soundtest))
{
    if (obj_soundtest.muevent != noone)
    {
        var _reqsize = fmod_dsp_get_parameter_data(global.dsp, 4, global.dspbuff);
        
        if (buffer_get_size(global.dspbuff) < _reqsize)
            buffer_resize(global.dspbuff, _reqsize);
        
        buffer_seek(global.dspbuff, buffer_seek_start, 0);
        var _datsize = buffer_read(global.dspbuff, buffer_s32);
        var _datchannels = min(buffer_read(global.dspbuff, buffer_s32), 2);
        
        for (var i = 0; i < _datchannels; i++)
        {
            for (var b = 0; b < (_datsize / 2); b++)
                array_push(global.dspval, buffer_read(global.dspbuff, buffer_f32));
            
            buffer_seek(global.dspbuff, buffer_seek_relative, (_datsize / 2) * buffer_sizeof(buffer_f32));
        }
    }
}
