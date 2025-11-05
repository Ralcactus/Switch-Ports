if (obj_drawcontroller.debugcam)
    exit;

var _gw = get_game_width();
var _gh = get_game_height();

if (!showjeg)
{
    if (showcursor)
        draw_sprite(cursorspr, cursorind, _gw / 2, _gh / 2);
    else
        draw_sprite_stretched_ext(spr_1x1, 0, (_gw / 2) - 2, (_gh / 2) - 2, 4, 4, c_black, 1);
}
else
{
    var _finalx = _gw / 2;
    var _finaly = (_gh / 2) + ((sprite_get_height(spr_jeg) / 2) * 4);
    var _scale = lerp(jegscale, 4, jegtransition);
    draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, _gw, _gh, c_black, jegtransition);
    draw_sprite_ext(spr_jeg, 0, lerp(jegposx, _finalx, jegtransition), lerp(jegposy, _finaly, jegtransition), _scale, _scale, 0, c_white, 1);
}

draw_set_font(global.font);
draw_set_colour(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
var _jegcaption = fmod_studio_system_get_parameter_by_name("jegcaption").final_value;

if (_jegcaption != 0)
    __draw_text_hook(get_game_width() / 2, get_game_height() - 80, secretstr[_jegcaption - 1]);
