draw_set_font(global.toonfont);
draw_set_colour(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
var _x = -string_width(text) / 2;
var _y = -60;

for (var i = 1; i < (string_length(text) + 1); i++)
{
    var _char = string_char_at(text, i);
    var _anim1 = clamp(anim1total - (i - 1), 0, 1);
    var _anim2 = max(anim2total - (i - 1), 0);
    var _animx = lerp(0, _x, _anim1);
    _animx = lerp(_animx, _animx - 80, _anim2);
    var _animy = lerp(0, _y, _anim1);
    var _scale = lerp(0.5, 1, _anim1);
    var _wave = wave(-4, 4, 2, i * 500, global.game_cycleMS);
    
    if (_anim1 != 0)
    {
        draw_text_billboard(x + _animx, y + _animy + _wave, z, _char, _scale, _scale, 0, 12512, 12512, 63736, 63736, 1);
        draw_text_billboard(x + _animx, y + _animy + _wave, z, _char, _scale, _scale, 0);
    }
    
    _x += string_width(_char);
    
    if (i == 0)
    {
        if (point_distance(x + _animx, y + _animy + _wave, obj_player.x, obj_player.y) > 700 && sign((x + _animx) - obj_player.x) == 1)
            instance_destroy();
    }
    
    if (i == string_length(text))
    {
        if (point_distance(x + _animx, y + _animy + _wave, obj_player.x, obj_player.y) > 700 && sign((x + _animx) - obj_player.x) == -1)
            instance_destroy();
    }
}
