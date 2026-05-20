Tyme += 1;

if (Tyme == 1)
{
    speed = 4 * image_yscale;
    
    if (image_index == 0)
    {
        audio_stop_sound(snd_break_blue);
        sou(107);
    }
    
    if (oSoul.Seed != "AN" && image_index == 0)
    {
        if (image_yscale > 1.9)
            oTP.TP += 3;
        else
            oTP.TP += 1;
    }
}

RGB = make_color_rgb(_R, _G, _B);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, RGB, image_alpha);
speed *= 0.8;

if (Tyme >= 2)
    image_alpha -= 0.1;

if (image_alpha <= 0)
    instance_destroy();
