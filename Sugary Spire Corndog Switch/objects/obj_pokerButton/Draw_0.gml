if (enabled)
{
    if (interactCondition())
    {
        image_index = 0;
        
        if (point_in_rectangle(mouse_x, mouse_y, x, y, x + buttonWidth, y + buttonHeight))
            image_index = mouse_check_button(mb_left) ? 2 : 1;
    }
    else
    {
        image_index = 3;
    }
    
    draw_sprite_stretched(sprite_index, image_index, x, y, buttonWidth, buttonHeight);
    draw_set_color(c_black);
    draw_set_font(font_poker_big_temp);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(x + (buttonWidth / 2), y + (buttonHeight / 2), buttonText);
}
