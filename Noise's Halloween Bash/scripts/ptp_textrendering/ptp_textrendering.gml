#region PTP System Draw Functions
function __ptp_draw_text(_x, _y, _str, _xscale = 1, _yscale = 1, _angle = 0, _c1 = draw_get_color(), _c2 = draw_get_color(), _c3 = draw_get_color(), _c4 = draw_get_color(), _alpha = draw_get_alpha())
{
    var _prevshader = shader_current();
    var _sdf = font_get_sdf_enabled(draw_get_font());
    
    if (_sdf && _prevshader == shd_premultiply)
        shader_set(shd_sdf_premultiply);
    
    draw_text_transformed_colour(_x - 0.01, _y, _str, _xscale, _yscale, _angle, _c1, _c2, _c3, _c4, _alpha);
    
    if (_sdf && _prevshader == shd_premultiply)
        shader_set(_prevshader);
}

function __ptp_draw_text_ext(_x, _y, _str, _sep, _w, _xscale = 1, _yscale = 1, _angle = 0, _c1 = draw_get_color(), _c2 = draw_get_color(), _c3 = draw_get_color(), _c4 = draw_get_color(), _alpha = draw_get_alpha())
{
    var _prevshader = shader_current();
    var _sdf = font_get_sdf_enabled(draw_get_font());
    
    if (_sdf && _prevshader == shd_premultiply)
        shader_set(shd_sdf_premultiply);
    
    draw_text_ext_transformed_colour(_x - 0.01, _y, _str, _sep, _w, _xscale, _yscale, _angle, _c1, _c2, _c3, _c4, _alpha);
    
    if (_sdf && _prevshader == shd_premultiply)
        shader_set(_prevshader);
}
#endregion
#region PTP Wrapper Draw Functions
function __draw_text_hook(_x, _y, _str)
{
    __ptp_draw_text(_x, _y, _str);
}

function __draw_text_ext_hook(_x, _y, _str, _sep, _w)
{
    __ptp_draw_text_ext(_x, _y, _str, _sep, _w);
}

function __draw_text_colour_hook(_x, _y, _str, _c1, _c2, _c3, _c4, _alpha)
{
    __ptp_draw_text(_x, _y, _str, 1, 1, 0, _c1, _c2, _c3, _c4, _alpha);
}

function __draw_text_transformed_hook(_x, _y, _str, _xscale, _yscale, _angle)
{
    __ptp_draw_text(_x, _y, _str, _xscale, _yscale, _angle);
}

function __draw_text_ext_colour_hook(_x, _y, _str, _sep, _w, _c1, _c2, _c3, _c4, _alpha)
{
    __ptp_draw_text_ext(_x, _y, _str, _sep, _w, 1, 1, 0, _c1, _c2, _c3, _c4, _alpha);
}

function __draw_text_ext_transformed_hook(_x, _y, _str, _sep, _w, _xscale, _yscale, _angle)
{
    __ptp_draw_text_ext(_x, _y, _str, _sep, _w, _xscale, _yscale, _angle);
}

function __draw_text_transformed_colour_hook(_x, _y, _str, _xscale, _yscale, _angle, _c1, _c2, _c3, _c4, _alpha)
{
    __ptp_draw_text(_x, _y, _str, _xscale, _yscale, _angle, _c1, _c2, _c3, _c4, _alpha);
}

function __draw_text_ext_transformed_colour_hook(_x, _y, _str, _sep, _w, _xscale, _yscale, _angle, _c1, _c2, _c3, _c4, _alpha)
{
    __ptp_draw_text_ext(_x, _y, _str, _sep, _w, _xscale, _yscale, _angle, _c1, _c2, _c3, _c4, _alpha);
}
#endregion

function define_font_globals()
{
    global.FONTEXTRA = [];
    global.FONTEXTRA[global.font] = [spr_controllerbuttons, spr_keyboardkey, spr_keyfunctions, global.keyfont, 40, 0, 0, 6];
    global.FONTEXTRA[global.toonfont] = [spr_controllerbuttons, spr_keyboardkey, spr_keyfunctions, global.keyfont, 40, 0, 0, 6];
    global.FONTEXTRA[font_warning] = [spr_controllerbuttons, spr_keyboardkey, spr_keyfunctions, global.keyfont, 40, 0, 0, 0];
    global.FONTDEF = 
	[
		["font_caption", font_caption], 
		["font_debug", font_debug], 
		["font_warning", font_warning], 
		["font_fat", global.font], 
		["font_toon", global.toonfont]
	];
    global.COLOURDEF = 
	[
		["c_aqua", c_aqua], 
		["c_black", c_black], 
		["c_blue", c_blue], 
		["c_dkgrey", c_dkgrey], 
		["c_fuchsia", c_fuchsia], 
		["c_grey", c_grey], 
		["c_green", c_green], 
		["c_lime", c_lime], 
		["c_ltgrey", c_ltgrey], 
		["c_maroon", c_maroon], 
		["c_navy", c_navy], 
		["c_olive", c_olive], 
		["c_purple", c_purple], 
		["c_red", c_red], 
		["c_silver", c_silver], 
		["c_teal", c_teal], 
		["c_white", c_white], 
		["c_yellow", c_yellow]
	];
}

function draw_input(_x, _y, _alpha, _angle, _input_verb, _remap_check = true, _profile = input_profile_get(), _alternate = 0, 
	_controller_spr = spr_controllerbuttons, _keyboard_spr = spr_keyboardkey, _keyboard_func_spr = spr_keyfunctions, _keyfont = global.keyfont, _color = c_black
)
{
    var _width = 0;
    var _height = 0;
    var _rotxoff = 0;
    var _rotyoff = 0;
    
    if (_input_verb != "any")
    {
        var _icon = input_verb_get_icon(_input_verb, 0, _alternate, _profile);
        
        if (is_struct(_icon) || is_string(_icon))
        {
            if (_angle != 0)
            {
                _width = sprite_get_width(_keyboard_spr);
                _height = sprite_get_height(_keyboard_spr);
                _rotxoff = (_width / 2) - lengthdir_x(_width / 2, _angle);
                _rotyoff = (_height / 2) - lengthdir_y(_height / 2, _angle - 90);
                _rotxoff -= ((_height / 2) - lengthdir_y(_height / 2, _angle) - (_height / 2));
                _rotyoff -= ((_width / 2) - lengthdir_x(_width / 2, _angle - 90) - (_width / 2));
            }
            
            draw_sprite_ext(_keyboard_spr, 0, _x + _rotxoff, _y + _rotyoff, 1, 1, _angle, c_white, _alpha);
            
            if (is_string(_icon))
            {
                var _prevfont = draw_get_font();
                draw_set_font(_keyfont);
                
                if (_angle != 0)
                {
                    _width = string_width(_icon);
                    _height = string_height(_icon);
                    _rotxoff = (_width / 2) - lengthdir_x(_width / 2, _angle);
                    _rotyoff = (_height / 2) - lengthdir_y(_height / 2, _angle - 90);
                    _rotxoff -= ((_height / 2) - lengthdir_y(_height / 2, _angle) - (_height / 2));
                    _rotyoff -= ((_width / 2) - lengthdir_x(_width / 2, _angle - 90) - (_width / 2));
                }
                
                __draw_text_transformed_colour_hook(_x + _rotxoff, _y + _rotyoff, _icon, 1, 1, _angle, _color, _color, _color, _color, _alpha);
                draw_set_font(_prevfont);
            }
            else
            {
                if (_angle != 0)
                {
                    _width = sprite_get_width(_keyboard_func_spr);
                    _height = sprite_get_height(_keyboard_func_spr);
                    _rotxoff = (_width / 2) - lengthdir_x(_width / 2, _angle);
                    _rotyoff = (_height / 2) - lengthdir_y(_height / 2, _angle - 90);
                    _rotxoff -= ((_height / 2) - lengthdir_y(_height / 2, _angle) - (_height / 2));
                    _rotyoff -= ((_width / 2) - lengthdir_x(_width / 2, _angle - 90) - (_width / 2));
                }
                
                draw_sprite_ext(_keyboard_func_spr, _icon.key, _x + _rotxoff, _y + _rotyoff, 1, 1, _angle, _color, _alpha);
            }
        }
        else
        {
            var _ind = _icon;
            
			// Remaps all Direction Icons to use Arrows
            if (_remap_check)
            {
                switch (_ind)
                {
                    case 7: // Left Dpad
                    case 15: // Left LStick
                    case 20: // Left RStick
						// Left Arrow Image Index
                        _ind = 39;
                        break;
                    
                    case 5: // Right Dpad
                    case 13: // Right LStick
                    case 18: // Right RStick
						// Right Arrow Image Index
                        _ind = 37;
                        break;
                    
					// I think you get the point
                    case 6:
                    case 14:
                    case 19:
						// Up Arrow Image Index
                        _ind = 38;
                        break;
                    
                    case 4:
                    case 12:
                    case 17:
						// Down Arrow Image Index
                        _ind = 36;
                        break;
                }
            }
            
            if (_angle != 0)
            {
                _width = sprite_get_width(_controller_spr);
                _height = sprite_get_height(_controller_spr);
                _rotxoff = (_width / 2) - lengthdir_x(_width / 2, _angle);
                _rotyoff = (_height / 2) - lengthdir_y(_height / 2, _angle - 90);
                _rotxoff -= ((_height / 2) - lengthdir_y(_height / 2, _angle) - (_height / 2));
                _rotyoff -= ((_width / 2) - lengthdir_x(_width / 2, _angle - 90) - (_width / 2));
            }
            
            draw_sprite_ext(_controller_spr, _ind, _x + _rotxoff, _y + _rotyoff, 1, 1, _angle, c_white, _alpha);
        }
    }
    else
    {
        if (_angle != 0)
        {
            _width = sprite_get_width(_controller_spr);
            _height = sprite_get_height(_controller_spr);
            _rotxoff = (_width / 2) - lengthdir_x(_width / 2, _angle);
            _rotyoff = (_height / 2) - lengthdir_y(_height / 2, _angle - 90);
            _rotxoff -= ((_height / 2) - lengthdir_y(_height / 2, _angle) - (_height / 2));
            _rotyoff -= ((_width / 2) - lengthdir_x(_width / 2, _angle - 90) - (_width / 2));
        }
        
        draw_sprite_ext(_controller_spr, 35, _x + _rotxoff, _y + _rotyoff, 1, 1, _angle, c_white, _alpha);
    }
}

function string_clean(_str)
{
    _str = string_replace_all(_str, "{S}", "");
    _str = string_replace_all(_str, "{V}", "");
    _str = string_replace_all(_str, "{W}", "");
    _str = string_replace_all(_str, "{R}", "");
    _str = string_replace_all(_str, "{/}", "");
    _str = string_replace_all(_str, "{/S}", "");
    _str = string_replace_all(_str, "{/V}", "");
    _str = string_replace_all(_str, "{/W}", "");
    _str = string_replace_all(_str, "{/R}", "");
    _str = string_replace_all(_str, "{/H}", "");
    _str = string_replace_all(_str, "{/C}", "");
    _str = string_replace_all(_str, "{/F}", "");
    
    repeat (string_count("{H:", _str))
    {
        var _hyperlinkstart = string_pos("{H:", _str);
        var _hyperlinkend = string_pos_ext("}", _str, _hyperlinkstart);
        _str = string_delete(_str, _hyperlinkstart, (_hyperlinkend + 1) - _hyperlinkstart);
    }
    
    repeat (string_count("{C:", _str))
    {
        var _colstart = string_pos("{C:", _str);
        var _colend = string_pos_ext("}", _str, _colstart);
        _str = string_delete(_str, _colstart, (_colend + 1) - _colstart);
    }
    
    repeat (string_count("{F:", _str))
    {
        var _fontstart = string_pos("{F:", _str);
        var _fontend = string_pos_ext("}", _str, _fontstart);
        _str = string_delete(_str, _fontstart, (_fontend + 1) - _fontstart);
    }
    
    return _str;
}

function string_width_fancy(_str)
{
    var _width = 0;
    var _font = draw_get_font();
    _str = string_clean(_str);
    var _arrays = ds_map_keys_to_array(global.inputs);
    
    for (var _i = 0; _i < array_length(_arrays); _i++)
    {
        _width += (global.FONTEXTRA[_font][4] * string_count(_arrays[_i], _str));
        _str = string_replace_all(_str, _arrays[_i], "");
    }
    
    _width += string_width(_str);
    return _width;
}

function string_height_fancy(_str)
{
    var _height = 0;
    var _font = draw_get_font();
    _str = string_clean(_str);
    var _strh = string_height("A");
    _height += ((string_count("\n", _str) + 1) * _strh);
    _height += (string_count("\n", _str) * global.FONTEXTRA[_font][7]);
    var _arrays = ds_map_keys_to_array(global.inputs);
    
    for (var _i = 0; _i < array_length(_arrays); _i++)
    {
        if (string_count(_arrays[_i], _str))
        {
            _height += (_strh - global.FONTEXTRA[_font][4]);
            break;
        }
    }
    
    return _height;
}

function draw_text_fancy(_x, _y, _str, _color = c_white, _alpha = 1, _remapkeys = true, _profile = input_profile_get(), _alternate = 0, _override_pause = false)
{
    var _font = draw_get_font();
    var _halign = draw_get_halign();
    var _valign = draw_get_valign();
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    draw_set_colour(_color);
    var _width = -5;
    var _lines = string_split(_str, "\n");
    
    for (var l = 0; l < array_length(_lines); l++)
    {
        if (string_width(_lines[l]) > _width)
            _width = string_width_fancy(_lines[l]);
    }
    
    var _startingx = _x;
    var _firstline = string_copy(_str, 1, string_pos("\n", _str));
    
    if (string_pos("\n", _str) == 0)
        _firstline = _str;
    
    if (_halign == 1)
        _x -= (string_width_fancy(_firstline) / 2);
    else if (_halign == 2)
        _x -= string_width_fancy(_firstline);
    
    var _lineheight = string_height("A") + global.FONTEXTRA[_font][7];
    var _height = (string_count("\n", _str) + 1) * _lineheight;
    
    if (_valign == 1)
        _y -= (_height / 2);
    else if (_valign == 2)
        _y -= _height;
    
    var _frame = floor(current_time / 16.666666666666668);
    var _shake = false;
    var _vertshake = false;
    var _wave = false;
    var _rotwave = false;
    var _hyperlink = -1;
    var _codefont = draw_get_font();
    var _codecolour = draw_get_colour();
    var _vertshakedir = floor(_frame / 2) % 2;
    var _drawinputs = [];
    var _prevshader = shader_current();
    var _sdf = font_get_sdf_enabled(_codefont);
    
    if (_sdf && _prevshader == shd_premultiply)
        shader_set(shd_sdf_premultiply);
    
    for (var i = 1; i < (string_length(_str) + 1); i++)
    {
        var _char = string_char_at(_str, i);
        var _input = string_copy(_str, i, 3);
        var _xoff = 0;
        var _yoff = 0;
        var _rotoff = 0;
        
        if (_char == "\n")
        {
            _y += _lineheight;
            var _nextlineendpos = string_pos_ext("\n", _str, i + 1);
            
            if (_nextlineendpos == 0)
                _nextlineendpos = string_length(_str);
            
            _nextlineendpos -= i;
            var _nextlinestr = string_copy(_str, i + 1, _nextlineendpos);
            _x = _startingx;
            
            if (_halign == 1)
                _x -= (string_width_fancy(_nextlinestr) / 2);
            
            if (_halign == 2)
                _x -= string_width_fancy(_nextlinestr);
        }
        else
        {
			switch (_input)
            {
                case "{S}":
                    _shake = true;
                    i += 2;
                    break;
					
                case "{V}":
                    _vertshake = true;
                    i += 2;
                    break;
					
                case "{W}":
                    _wave = true;
                    i += 2;
                    break;
					
                case "{R}":
                    _rotwave = true;
                    i += 2;
                    break;
					
                case "{H:":
                    i += 2;
                    var _startpos = i + 1;
                    var _endpos = string_pos_ext("}", _str, i);
                    i = _endpos;
                    _hyperlink = string_copy(_str, _startpos, (_endpos - _startpos));
                    break;
					
                case "{F:":
                    i += 2;
                    _startpos = i + 1;
                    _endpos = string_pos_ext("}", _str, i);
                    i = _endpos;
                    var _fnt = string_copy(_str, _startpos, (_endpos - _startpos));
                    var f = 0;
					
                    while (f < array_length(global.FONTDEF))
                    {
                        if (global.FONTDEF[f][0] == _fnt)
                        {
                            draw_set_font(global.FONTDEF[f][1]);
                            _font = global.FONTDEF[f][1];
                            break;
                        }
                        else
                        {
                            f++
                            continue;
                        }
                    }
                    break;
					
                case "{C:":
                    i += 2;
                    _startpos = i + 1;
                    _endpos = string_pos_ext("}", _str, i);
                    i = _endpos;
                    var _col = string_copy(_str, _startpos, (_endpos - _startpos));
                    var _colset = false;
                    var c = 0;
					
                    while (c < array_length(global.COLOURDEF))
                    {
                        if (global.COLOURDEF[c][0] == _col)
                        {
                            draw_set_colour(global.COLOURDEF[c][1]);
                            _color = global.COLOURDEF[c][1];
                            _colset = true;
                            break;
                        }
                        else
                        {
                            c++
                            continue;
                        }
                    }
                    if (_colset == false)
                    {
                        var _hexcol = hexstr_to_col(_col);
                        draw_set_colour(_hexcol);
                        _color = _hexcol;
                    }
                    break;
					
                case "{/S":
                    _shake = false;
                    i += 3;
                    break;
					
                case "{/V":
                    _vertshake = false;
                    i += 3;
                    break;
					
                case "{/W":
                    _wave = false;
                    i += 3;
                    break;
					
                case "{/R":
                    _rotwave = false;
                    i += 3;
                    break;
					
                case "{/H":
                    _hyperlink = -1;
                    i += 3;
                    break;
					
                case "{/F":
                    draw_set_font(_codefont);
                    _font = _codefont;
                    i += 3;
                    break;
					
                case "{/C":
                    draw_set_colour(_codecolour);
                    _color = _codecolour;
                    i += 3;
                    break;
					
                case "{/}":
                    _shake = false;
                    _vertshake = false;
                    _wave = false;
                    _rotwave = false;
                    _hyperlink = -1;
                    draw_set_font(_codefont);
                    draw_set_colour(_codecolour);
                    _color = _codecolour;
                    i += 2;
                    break;
					
                default:
                    if (!game_paused() || _override_pause)
                    {
                        if (_shake)
                        {
                            _xoff = irandom_range(-1, 1);
                            _yoff = irandom_range(-1, 1);
                        }
						
                        _vertshakedir = !_vertshakedir;
						
                        if (_vertshake)
                            _yoff = _vertshakedir;
                        if (_wave)
                            _yoff = wave(-2, 2, 1, ((i - 1) * 250));
                        if (_rotwave)
                            _rotoff = wave(-12, 12, 1, ((i - 1) * 50));
                    }
                    if !is_undefined(global.inputs[? _input])
                    {
                        var _verb = global.inputs[? _input];
                        array_push(_drawinputs, [round(_x + global.FONTEXTRA[_font][5] + _xoff), round(_y + global.FONTEXTRA[_font][6] + _yoff), _rotoff, _verb, _font]);
                        _x += global.FONTEXTRA[_font][4];
                        i += 2;
                        break;
                    }
                    else
                    {
                        _width = string_width(_char);
                        _height = string_height(_char);
                        _rotxoff = _width / 2 - (lengthdir_x((_width / 2), _rotoff));
                        _rotyoff = _height / 2 - (lengthdir_y((_height / 2), (_rotoff - 90)));
                        _rotxoff -= (_height / 2 - (lengthdir_y((_height / 2), _rotoff)) - _height / 2);
                        _rotyoff -= (_width / 2 - (lengthdir_x((_width / 2), (_rotoff - 90))) - _width / 2);
                        var _charx = (round(_x + _xoff)) + _rotxoff;
                        var _chary = (round(_y + _yoff)) + _rotyoff;
                        draw_text_transformed_colour(_charx, _chary, _char, 1, 1, _rotoff, _color, _color, _color, _color, _alpha);
                        _prevshader = shader_current();
                        var _prevalpha = draw_get_alpha();
                        shader_reset();
                        draw_set_alpha(_alpha);
						
                        if (_hyperlink != -1)
                        {
                            draw_line((_charx - 1), (_chary + string_height(_char)), (_charx + string_width(_char) + 1), (_chary + string_height(_char)));
                            if point_in_rectangle(global.screenmouse_x, global.screenmouse_y, (_charx - 1), (_chary - 1), (_charx + string_width(_char) + 1), (_chary + _lineheight))
                            {
                                obj_drawcontroller.hovering = true;
                                obj_drawcontroller.clicklink = _hyperlink;
                                obj_drawcontroller.alarm[0] = 2;
                            }
                        }
						
                        draw_set_alpha(_prevalpha);
                        shader_set(_prevshader);
                        _x += string_width(_char);
                    }
            }
        }
    }
    
    if (_sdf && _prevshader == shd_premultiply)
        shader_set(_prevshader);
    
    for (var _i = 0; _i < array_length(_drawinputs); _i++)
        draw_input(_drawinputs[_i][0], _drawinputs[_i][1], _alpha, _drawinputs[_i][2], _drawinputs[_i][3], _remapkeys, _profile, _alternate, global.FONTEXTRA[_drawinputs[_i][4]][0], global.FONTEXTRA[_drawinputs[_i][4]][1], global.FONTEXTRA[_drawinputs[_i][4]][2], global.FONTEXTRA[_drawinputs[_i][4]][3]);
    
    draw_set_halign(_halign);
    draw_set_valign(_valign);
    draw_set_font(_codefont);
    draw_set_colour(_codecolour);
}
