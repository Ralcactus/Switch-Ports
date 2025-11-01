if (gui || !ready)
    exit;

get_cams();
var _x = x + (camx * dist);
var _y = y + (camy * dist);

if (special != -4)
{
    var _scale = 1;
    draw_sprite_ext(special, swap, _x, _y, image_xscale * _scale, image_yscale * _scale, image_angle, image_blend, image_alpha);
    exit;
}

if (global.input[0].input_last == 0)
{
    var _spr;
    
    if (global.input[0].key[control] == 8)
        _spr = spr_key_backspace;
    else if (global.input[0].key[control] == 13)
        _spr = spr_key_enter;
    else if (global.input[0].key[control] == 27)
        _spr = spr_key_escape;
    else if (global.input[0].key[control] == 16)
        _spr = spr_key_shift;
    else if (global.input[0].key[control] == 32)
        _spr = spr_key_spacebar;
    else if (global.input[0].key[control] == 17)
        _spr = spr_key_control;
    else
        _spr = spr_keyboards;
    
    var _scale;
    
    if (_spr != spr_keyboards)
        _scale = 0.8;
    else
        _scale = 1;
    
    draw_sprite_ext(_spr, swap, _x, _y, image_xscale * _scale, image_yscale * _scale, image_angle, image_blend, image_alpha);
    
    if (_spr == spr_keyboards)
    {
        draw_set_font(obj_persistent.font_controls);
        draw_set_alpha(image_alpha);
        draw_text_transformed((_x - (74 * image_xscale)) + (image_xscale * (9 * swap)), (_y - (65 * image_yscale)) + (image_yscale * (16 * swap)), get_key(global.input[0].key[control]), image_xscale, image_yscale, 0);
        draw_set_alpha(1);
    }
}
else
{
    var _spr;
    
    if (swap)
        _spr = spr_controls_press;
    else
        _spr = spr_controls;
    
    draw_sprite_ext(_spr, image_index, _x, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
