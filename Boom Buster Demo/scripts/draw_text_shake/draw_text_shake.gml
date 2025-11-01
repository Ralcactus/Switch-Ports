function draw_text_shake(arg0, arg1, arg2, arg3 = 0.5)
{
    var _xoff;
    
    if (draw_get_halign() == 1)
        _xoff = -(string_width(arg2) / 2);
    else if (draw_get_halign() == 2)
        _xoff = -string_width(arg2);
    else
        _xoff = 0;
    
    var _before = draw_get_halign();
    draw_set_halign(fa_left);
    
    for (var i = 0; i < string_length(arg2); i++)
    {
        var _chr = string_char_at(arg2, i + 1);
        var _chance = random_range(0, 1);
        var _shake = _chance <= arg3;
        var _xshake = _shake * random_range(-1, 1);
        var _yshake = _shake * random_range(-1, 1);
        draw_text(arg0 + _xshake + _xoff, arg1 + _yshake, _chr);
        _xoff += string_width(string_char_at(arg2, i + 1));
    }
    
    draw_set_halign(_before);
}
