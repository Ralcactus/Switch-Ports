if (sprite_index == ans[0])
    image_index = round(oP.Tyme / 10);

if (Wg > 0)
{
    W = 0;
    W = Wg / 20;
    Wg--;
}

if (Wg == 0)
{
    if (glow)
        W = 0.5 + (sin(oP.Tyme * 0.1) * 0.5);
    else
        W = 0;
}

scrSha_RGBa(W, W, W, 0);
draw_self();
shader_reset();
