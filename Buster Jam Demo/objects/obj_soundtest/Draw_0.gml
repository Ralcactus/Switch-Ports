testvariablenothing = false;
draw_sprite_tiled_ext(spr_pattern_endless, 0, -time, time * 0.5, 2, 2, c_white, 1);
draw_sprite_tiled_ext(spr_pattern_endless, 0, -time, time * 0.5, 2, 2, c_black, 0.7);
draw_set_font(fnt_adlib);

if (!loaded)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(960, 540, "Loading...");
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    exit;
}

for (var j = 0; j < 2; j++)
{
    var _x;
    
    if (j == 1)
        _x = 960;
    else
        _x = 20;
    
    var _y = 100;
    var _scale = 0.65;
    var _sep = 72 * _scale;
    var _pageX = 20 + (960 * j);
    var _pageY = 20;
    draw_text(_pageX, _pageY, string("Page: {0}/{1}", page[j] + 1, page_max[j] + 1));
    var _barX = _pageX + 220;
    var _barY = _pageY + 15;
    var _barH = 20;
    var _barW = 400;
    draw_set_alpha(0.45);
    draw_rectangle(_barX, _barY, _barX + _barW, _barY + _barH, false);
    draw_set_alpha(1);
    var _pos, _max, _percent;
    
    if (audio_is_playing(audio_played[j]))
    {
        _pos = audio_sound_get_track_position(audio_played[j]);
        _max = audio_sound_length(audio_played[j]);
        _percent = _pos / _max;
    }
    else
    {
        _pos = 0;
        _max = 0;
        _percent = 0;
    }
    
    draw_text(_barX + _barW + 10, _pageY, string("{0}", _pos));
    draw_text(_barX + _barW + 10 + (string_length(string(_pos)) * string_width("0")), _pageY, string("/ {0}", _max));
    var _stampX = _barX + (_barW * _percent);
    var _stampY = _barY;
    var _stampH = _barH;
    draw_line_width(_stampX, _stampY - (_barH / 2) - 4, _stampX, _stampY + 40, 4);
    
    if (point_in_rectangle(mouse_x, mouse_y, _barX, _barY, _barX + _barW, _barY + _barH) && audio_is_playing(audio_played[j]))
    {
        var _percent_jump = (mouse_x - _barX) / _barW;
        _percent_jump = clamp(_percent_jump, 0, 1);
        
        if (mouse_check_button(mb_left))
            audio_sound_set_track_position(audio_played[j], _max * _percent_jump);
    }
    
    var i = page[j] * 20;
    
    while (i < array_length(data_order[j]))
    {
        var _snd = data_order[j][i][0];
        var _vol = audio_sound_get_gain(asset_get_index(_snd));
        var _str = string("{0}.  {1}  (vol: {2})", i, _snd, _vol);
        var _myX = _x;
        var _myY = _y + (_sep * (i - (page[j] * 20)));
        var _hover = point_in_rectangle(mouse_x, mouse_y, _myX, _myY, _myX + 800, (_myY + _sep) - 1);
        
        if (_hover || (selected[0] == j && selected[1] == i))
        {
            var _alpha, _col;
            
            if (selected == i)
            {
                _alpha = 0.38;
                _col = 16777215;
            }
            else
            {
                _alpha = 0.5;
                _col = 0;
            }
            
            draw_set_alpha(_alpha);
            draw_rectangle_color(_myX, _myY, _myX + (string_width(_str) * _scale), (_myY + _sep) - 14, _col, _col, _col, _col, false);
            draw_set_alpha(1);
        }
        
        draw_text_transformed(_myX, _myY, _str, _scale, _scale, 0);
        
        if (_hover)
        {
            if (mouse_check_button_pressed(mb_left))
                selected = [j, i];
        }
        
        i++;
    }
}
