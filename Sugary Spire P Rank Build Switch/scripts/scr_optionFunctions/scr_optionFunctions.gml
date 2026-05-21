function draw_option(x, y, _string, _activated)
{
    draw_set_color(c_white);
    
    if (_activated == false)
        draw_set_color(#666666);
    
    draw_text(x, y, _string);
    draw_set_color(c_white);
}
