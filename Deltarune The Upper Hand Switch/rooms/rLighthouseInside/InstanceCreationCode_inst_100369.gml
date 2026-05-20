op.parameter = [0, 0, 0, 0];
op.camMode = 0;
op.camX = 0;
op.camY = 0;
audio_stop_all();
ow_music_stop();
audio_play_sound(mus_crystal, -999, true);
audio_sound_pitch(mus_crystal, 1);
audio_sound_gain(mus_crystal, 0, 0);
create_char("s", 320, 560, sSock_Up, 0);
char("s").image_alpha = 0;
res_i();
i = -100;
i1 = -20;
i2 = 1;
i3 = false;
i4 = 1;

funcStep = function()
{
    i++;
    
    if (i == 1)
    {
        move_char("s", 90, 320, 410, sSock_Up, 1, function()
        {
            other.image_speed = 0;
            other.image_index = 1;
        });
    }
    
    if (i == 160)
    {
        move_char("s", 90, 320, 376, sSock_Up, 0.5, function()
        {
            other.image_speed = 0;
            other.image_index = 1;
        });
    }
    
    if (i == 240)
    {
        char("s").shake = 10;
        oLighthouseInside.shake = 1;
    }
    
    if (i == 250)
    {
        move_char("s", 10, 320, 404, sSock_Sprites, 0, undefined, ["arc3"]);
        char("s").image_index = 9;
        audio_sound_pitch(snd_star, 1);
        snd(snd_star);
        oLighthouseInside.waves = [[22, 3], [22, 6], [22, 9]];
        oLighthouseInside.ballSize = 30;
    }
    
    if (i == 260)
        char("s").shake = 3;
    
    if (i == 350)
        char("s").shake = 10;
    
    if (i == 360)
        sprite_char("s", sSock_Up, 1, 0);
    
    if (i == 390)
        oLighthouseInside.removePedestal = true;
    
    if (i == 450)
    {
        oLighthouseInside.targetSize = 12;
        oLighthouseInside.shake = 2;
        oLighthouseInside.waves = [];
        oLighthouseInside.distanceModifier = 0;
        sprite_char("s", sSock_Sprites, 9, 0);
        char("s").shake = 3;
    }
    
    if (i == 570)
    {
        audio_stop_all();
        audio_sound_pitch(snd_star, 0.5);
        snd(snd_star, 0);
        oLighthouseInside.waves = [[oLighthouseInside.ballSize, 3], [oLighthouseInside.ballSize, 6], [oLighthouseInside.ballSize, 9]];
        oLighthouseInside.distanceModifier = 1;
    }
    
    if (i >= 570 && i < 720)
    {
        oLighthouseInside.targetSize = 60;
        oLighthouseInside.y += (10 - oLighthouseInside.y) / 5;
        oLighthouseInside.shake = 1;
    }
    
    if (i == 570)
    {
        char("s").shake = 900;
        audio_play_sound(mus_crystal, -999, true);
        audio_sound_gain(mus_crystal, 0, 0);
    }
    
    if (i == 660)
        char("s").shake = 0;
    
    if (i == 760)
    {
        sprite_char("s", sSock_Up, 1, 0);
        char("s").shake = 3;
    }
    
    if (i == 820)
    {
        sprite_char("s", sSock_Sprites, 10, 0);
        char("s").shake = 3;
    }
    
    if (i == 880)
    {
        sprite_char("s", sSock_Sprites, 11, 0);
        char("s").shake = 3;
        oLighthouseInside.drawCrystal = false;
        audio_stop_all();
        oLighthouseInside.distanceModifier = -2;
        audio_sound_pitch(snd_star, 2);
        snd(snd_star);
        oLighthouseInside.waves = [[22, 3], [22, 6], [22, 9]];
    }
    
    if (i == 940)
    {
        audio_play_sound(mus_crystal, -999, true);
        audio_sound_pitch(mus_crystal, i2);
        audio_sound_gain(mus_crystal, 0.5, 0);
        char("s").shake = 900;
    }
    
    if (i >= 940)
    {
        i1++;
        oLighthouseInside.targetSize += i1 / 4;
        audio_sound_pitch(mus_crystal, i2);
        i2 += 0.2;
    }
    
    if (i == 1040)
    {
        i3 = true;
        audio_stop_all();
        room_goto(rSockTransformation);
    }
};

funcDrawGUI = function()
{
    gpu_set_blendmode(bm_subtract);
    ext(sPixel, 0, 0, 0, 999, 999, 0, make_color_rgb(255 * i4, 255 * i4, 255 * i4), 1);
    gpu_set_blendmode(bm_normal);
    
    if (i4 > 0)
        i4 -= 0.011111111111111112;
    
    if (i3)
        ext(sPixel, 0, 0, 0, 999, 999, 0, 0, 1);
};
