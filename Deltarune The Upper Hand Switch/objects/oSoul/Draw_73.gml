if (drawL == 1)
    ext(sprite_index, image_index, x, y, image_xscale * size, image_yscale * size, spin[1], color, image_alpha, flash);

ext(sGraze2, 0, x, y, image_xscale, image_yscale, 0, 16777215, grazeAlpha, 0);

if (grazeAlpha > 0)
    grazeAlpha -= 0.1;
