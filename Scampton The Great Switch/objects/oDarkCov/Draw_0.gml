draw_self();

if (An)
{
    image_alpha += 0.05;
    
    if (image_alpha == 0.5)
        An = false;
}
