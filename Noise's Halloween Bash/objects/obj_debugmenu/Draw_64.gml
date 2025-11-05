if (open)
{
    draw_set_font(font_debug);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    ds_stack_top(optionstack).drawoptions();
}
