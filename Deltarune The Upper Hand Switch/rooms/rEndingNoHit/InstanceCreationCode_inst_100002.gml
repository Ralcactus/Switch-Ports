op.parameter = [0, 0, 0, 0];
op.camMode = 0;
op.camX = 0;
op.camY = 0;
audio_stop_all();
ow_music_stop();
res_i();
i1 = 1;
i2 = 340;
i3 = 0;
i5 = 0;

funcDraw = function()
{
    i++;
    
    if (i == 120)
    {
        snd(snd_bfdiyay);
        snd(snd_THUMB_UP);
        i3 = 20;
    }
    
    if (i == 200)
        i5 = 1;
    
    if (i5 == 0)
    {
        if (i1 > 0)
            i1 -= 0.1;
        
        if (i > 60)
            i2 = lerp(i2, 0, 0.1);
    }
    else
    {
        if (i1 < 1)
            i1 += 0.1;
        
        if (i1 == 1)
            room_goto(rMainMenu);
    }
    
    if (op.alexMode)
    {
        draw_sprite_tiled(sAlex_SpamtonMarioBG, 1, op.ty, op.ty);
    }
    else
    {
        res_j();
        j1 = rgb(109, 85, 127);
        
        repeat (75)
        {
            ext(sThumb3, 0, (i - 570) + (j * 20), (i - 640) + (j * 20), 1, 1, 0, j1, 1);
            j++;
        }
    }
    
    ext(sThumb1, 0, 330, 480 + i2 + 10, 1, 1, 0, 0, 0.25);
    ext(sThumb1, 0, 320, 480 + i2, 1, 1, 0, 16777215, 1);
    i4 = [irandom_range(-i3, i3), irandom_range(-i3, i3)];
    
    if (i3 > 0)
        i3--;
    
    ext(sThumb2, 0 + (op.language - 1), 320 + i4[0] + 10, ((130 + i4[1]) - i2) + 10, 1, 1, 0, 0, 0.25);
    ext(sThumb2, 0 + (op.language - 1), 320 + i4[0], (130 - i2) + i4[1], 1, 1, 0, 16777215, 1);
    ext(sPixel, 0, 0, 0, 640, 480, 0, 0, i1);
};
