draw_self()
if (fadeinAlpha > 0)
{
    draw_set_alpha(fadeinAlpha)
    draw_rectangle_color(-100, -100, 960, 540, c_black, c_black, c_black, c_black, false)
    fadeinAlpha -= 0.05
}
draw_set_alpha(1)
