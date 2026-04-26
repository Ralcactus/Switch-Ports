function string_width_scribble(arg0)
{
    var _font = draw_get_font();
    _font = !font_exists(_font) ? global.__scribble_default_font : font_get_name(_font);
    return scribble(arg0).starting_format(_font, 16777215).get_width();
}
