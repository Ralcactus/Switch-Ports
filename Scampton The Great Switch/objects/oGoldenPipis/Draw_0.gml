if ((round(Tyme / 2) * 2) == Tyme)
{
    ShowX = x;
    ShowY = y;
    ShakeX = irandom_range(-1, 1) * 2;
    ShakeY = irandom_range(-1, 1) * 2;
    
    if (GlassesTime >= 525 && image_index == 0)
    {
        ShakeX = 0;
        ShakeY = 0;
    }
}

scrSha_RGBa(White, White, White, 0);
draw_sprite_ext(sprite_index, image_index, ShowX + ShakeX, ShowY + ShakeY, 2, 2, 0, c_white, 1);
shader_reset();

if (White != 0)
    White -= 0.1;

draw_sprite_ext(sprite_index, 2, ShowX + GlassesX, ShowY + (round(GlassesY / 2) * 2), 2, 2, GlassesROT, c_white, 1);
