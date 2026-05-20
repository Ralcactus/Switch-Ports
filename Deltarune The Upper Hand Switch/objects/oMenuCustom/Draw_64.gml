op.useLang = op.language;

if (array_length(text) < 15)
{
    extraY = lerp(extraY, 0, 0.25);
}
else
{
    extraY = lerp(extraY, clamp(cur - 6, 0, array_length(text) - 12), 0.25);
    extraY = clamp(extraY, 0, array_length(text) - 12);
}

image_alpha = 0.25;
print(text_title[page], 320 + spinX(), (20 - (extraY * thic)) + spinY(), undefined, title_color, ["mid", "alph"]);
image_alpha = 1;
print(text_title[page], 320, 20 - (extraY * thic), undefined, title_color, ["mid"]);
drawCur(100, 70 + ((cur - extraY) * thic));
ext(sPixel, 0, 0, 0, 24, 480, undefined, 0);
ext(sPixel, 0, 640, 0, -24, 480, undefined, 0);
res_i();
i1 = sPixelRGB;
i2 = 4;

if (op.superMode)
    i1 = sPixelY;

if (room == rMusicPlayer)
{
    i1 = sEEF_star1;
    i2 = 2;
}

repeat (25)
{
    ext(i1, i, round(12 + (dsin((op.ty * 5) + (i * 30)) * 8)) + spinX(), (i * 20) + spinY(), i2, i2, undefined, undefined, 0.25);
    ext(i1, i, round(628 - (dsin((op.ty * 5) + (i * 30)) * 8)) + spinX(), (480 - (i * 20)) + spinY(), i2, i2, undefined, undefined, 0.25);
    ext(i1, i, round(12 + (dsin((op.ty * 5) + (i * 30)) * 8)), i * 20, i2, i2);
    ext(i1, i, round(628 - (dsin((op.ty * 5) + (i * 30)) * 8)), 480 - (i * 20), i2, i2);
    i++;
}

res_i();

repeat (array_length(text))
{
    op.useLang = op.language;
    use_x = 100;
    use_y = 60 + plus + ((i - extraY) * thic);
    sep_text = "";
    sep_color = 16777215;
    sep_seed = [];
    
    if (run[i] != -1)
        run[i]();
    
    op.useLang = op.language;
    print(text[i] + sep_text, use_x, use_y, undefined, sep_color, sep_seed);
    i++;
}
