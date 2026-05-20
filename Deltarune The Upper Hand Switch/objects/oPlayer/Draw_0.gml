if (shake > 0)
{
    shake--;
    
    if (shakeX == 0 || shakeX == -2)
        shakeX = 2;
    else
        shakeX = -2;
}
else
{
    shakeX = 0;
}

if (draw)
    ext(sprite, image_index, x + shakeX, y + ey, image_xscale * 2);

if (dodgeAlpha > 0)
{
    shader_set(shaRGB);
    shader_set_uniform_f(shader_get_uniform(shaRGB, "col_r"), 1);
    shader_set_uniform_f(shader_get_uniform(shaRGB, "col_g"), -1);
    shader_set_uniform_f(shader_get_uniform(shaRGB, "col_b"), -1);
    shader_set_uniform_f(shader_get_uniform(shaRGB, "col_a"), 0);
    ext(sprite, image_index, x - 2, y, image_xscale * 2, undefined, undefined, undefined, 0.8 * dodgeAlpha);
    ext(sprite, image_index, x + 2, y, image_xscale * 2, undefined, undefined, undefined, 0.8 * dodgeAlpha);
    ext(sprite, image_index, x, y - 2, image_xscale * 2, undefined, undefined, undefined, 0.8 * dodgeAlpha);
    ext(sprite, image_index, x, y + 2, image_xscale * 2, undefined, undefined, undefined, 0.8 * dodgeAlpha);
    shader_reset();
    ext(sprite, image_index, x, y, image_xscale * 2);
    gpu_set_fog(true, merge_color(c_black, c_dkgray, 0.5), 0, 0);
    ext(sprite, image_index, x, y, image_xscale * 2, undefined, undefined, undefined, 0.8 * dodgeAlpha);
    gpu_set_fog(false, c_black, 0, 0);
    ext(sSoul, 1, x, y - 28, 1, 1, undefined, undefined, 0.8 * dodgeAlpha);
}
