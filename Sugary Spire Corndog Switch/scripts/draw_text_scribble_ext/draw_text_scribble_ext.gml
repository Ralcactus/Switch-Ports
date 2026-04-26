function draw_text_scribble_ext(arg0, arg1, arg2, arg3, arg4 = undefined)
{
    var _font = draw_get_font();
    _font = !font_exists(_font) ? global.__scribble_default_font : font_get_name(_font);
    var _element = scribble(arg2).align(draw_get_halign(), draw_get_valign()).starting_format(_font, 16777215).blend(draw_get_color(), draw_get_alpha()).wrap(arg3);
    
    if (arg4 != undefined)
        _element.reveal(arg4);
    
    _element.draw(arg0, arg1);
    return _element;
}
