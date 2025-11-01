function scr_draw_dialogue(arg0 = 198, arg1 = 764, arg2 = undefined, arg3 = "No text set.", arg4 = false, arg5 = 6, arg6 = 106, arg7 = true)
{
    var argument_arr = array_create(argument_count);
    
    for (var i = 0; i < argument_count; i++)
        argument_arr[i] = argument[i];
    
    if (live_call_ext(argument_arr))
        return global.live_result;
    
    var _x = arg0;
    var _y = arg1;
    var _w = 0;
    var _ly = 0;
    var _line_height = arg6;
    var _wsep = 2;
    var _lines = 0;
    var _wave = false;
    var _shake = 0;
    var _hueshift = false;
    var _circle = false;
    var _glyph = -4;
    var _nopause = false;
    var _chrcount = 0;
    
    for (var i = 0; i < (array_length(chr_total) - 1); i++)
    {
        if (!center_setup)
        {
            if (i > (type_index - 1))
                break;
        }
        
        var _xoff = 0;
        var _yoff = 0;
        var _ind = i + 1;
        var _chr = chr_total[i];
        
        if (_chr == "" && !center_setup)
        {
            func_skip_chr(i);
        }
        else
        {
            var _event;
            
            if (struct_exists(struct_text_effects, string("i{0}", i)))
                _event = struct_get(struct_text_effects, string("i{0}", i));
            else
                _event = false;
            
            var _linebreak = false;
            
            if (!_linebreak && _chr == " ")
            {
                var _lookw = _w;
                
                for (var ii = 2; ii < 100; ii++)
                {
                    var _lookchr = string_char_at(arg3, i + ii);
                    
                    if (_lookchr == " ")
                        break;
                    
                    if (_lookchr == "<")
                    {
                        var _count = 0;
                        var _lookending = "";
                        
                        while (_lookending != ">")
                        {
                            _lookending = string_char_at(arg3, i + ii + _count);
                            _count++;
                        }
                        
                        ii += (_count - 1);
                    }
                    else
                    {
                        _lookw += string_width(_lookchr);
                        
                        if (_lookw >= text_linemaxW)
                        {
                            _linebreak = true;
                            break;
                        }
                    }
                }
            }
            
            var _center_stop;
            
            if (center_setup && _event != false)
            {
                _center_stop = true;
                
                if (_event[0] == "break")
                    _center_stop = false;
            }
            else
            {
                _center_stop = false;
            }
            
            if (_event != false && !_center_stop)
            {
                switch (_event[0])
                {
                    case "textspd":
                        if (!array_contains(text_speeds, i))
                        {
                            array_push(text_speeds, i);
                            text_spd = real(_event[1]);
                        }
                        
                        break;
                    
                    case "break":
                        _linebreak = true;
                        break;
                    
                    case "nopause":
                        _nopause = true;
                        break;
                    
                    case "blip":
                        if (!array_contains(blip_swaps, i))
                        {
                            blip_group = real(_event[1]);
                            array_push(blip_swaps, i);
                        }
                        
                        break;
                    
                    case "pitch":
                        if (!array_contains(blip_swaps, i))
                        {
                            blip_pitch = real(_event[1]);
                            array_push(blip_swaps, i);
                        }
                        
                        break;
                    
                    case "auto":
                        auto = true;
                        
                        if (array_length(_event) > 1)
                            auto_delay = _event[1];
                        
                        break;
                    
                    case "yespause":
                        _nopause = false;
                        break;
                    
                    case "wave":
                        _wave = !_wave;
                        break;
                    
                    case "shake":
                        _shake = _event[1];
                        break;
                    
                    case "col":
                        if (_event[1] == "red")
                            draw_set_color(c_red);
                        else if (_event[1] == "yellow")
                            draw_set_color(c_yellow);
                        else if (_event[1] == "white")
                            draw_set_color(c_white);
                        else if (_event[1] == "zig")
                            draw_set_color(#CE95FF);
                        else if (_event[1] == "wizard")
                            draw_set_color(#D3FF24);
                        
                        break;
                    
                    case "hueshift":
                        _hueshift = !_hueshift;
                        
                        if (!_hueshift)
                            draw_set_color(c_white);
                        
                        break;
                    
                    case "circle":
                        _circle = !_circle;
                        break;
                    
                    case "glyph":
                        if (_event[1] == "gp_cross")
                        {
                            if (input_source_using(__input_global().__source_keyboard))
                                _glyph = spr_glyph_kb_z;
                            else
                                _glyph = spr_glyph_gp_cross;
                        }
                        else if (_event[1] == "gp_square")
                        {
                            _glyph = spr_glyph_gp_square;
                        }
                        else if (_event[1] == "gp_triangle")
                        {
                            if (input_source_using(__input_global().__source_keyboard))
                                _glyph = spr_glyph_kb_c;
                            else
                                _glyph = spr_glyph_gp_triangle;
                        }
                        else if (_event[1] == "gp_circle")
                        {
                            if (input_source_using(__input_global().__source_keyboard))
                                _glyph = spr_glyph_kb_x;
                            else
                                _glyph = spr_glyph_gp_circle;
                        }
                        
                        break;
                    
                    case "pause":
                        if (!array_contains(pauses, i) && !text_ended)
                        {
                            pause = _event[1];
                            type_index = _ind - 1;
                            
                            if (type_index < 0)
                                type_index = 0;
                            
                            array_push(pauses, i);
                        }
                        
                        break;
                }
                
                func_skip_chr(i);
            }
            
            if (_linebreak)
            {
                if (center_setup)
                {
                    array_push(text_center_info, 
                    {
                        w: _w,
                        line: _lines
                    });
                }
                
                _w = 0;
                _ly += _line_height;
                _lines++;
            }
            else if (_event != false)
            {
            }
            else
            {
                if (_wave)
                    _yoff += (sin(time - (i * 0.65)) * 3);
                
                _xoff += irandom_range(-_shake, _shake);
                _yoff += irandom_range(-_shake, _shake);
                
                if (_hueshift)
                {
                    var _hue = ((time * 12) + (_chrcount * -3)) % 255;
                    draw_set_color(make_color_hsv(_hue, 185, 255));
                }
                
                if (_circle)
                {
                    _xoff += (sin((time * 1.5) + (i * 0.75)) * 2);
                    _yoff += (cos((time * 1.5) + (i * 0.75)) * 2);
                }
                
                var _inoff;
                
                if (!center_setup && !text_finished)
                {
                    var _before = chr_in[i];
                    chr_in[i] = approach(chr_in[i], 1, 0.15);
                    var _ended;
                    
                    if (object_index == obj_textbox)
                        _ended = text_ended;
                    else if (object_index == obj_map_name)
                        _ended = true;
                    else
                        _ended = false;
                    
                    if (_before == 0 && chr_in[i] != 0 && !_ended && !center_setup)
                    {
                        if (_chr == " ")
                            type_index++;
                        
                        if (arg4 && blip != -4 && _chr != "." && _chr != " " && _chr != "," && _chr != "!" && _chr != "?" && _chr != "(" && _chr != ")")
                        {
                            var _blip = irandom_range(0, array_length(blip[blip_group]) - 1);
                            var _override = true;
                            
                            if (!audio_is_playing(blip_play) || _override)
                            {
                                var _snd = blip[blip_group][_blip];
                                blip_play = audio_play_sound(_snd, 0, 0);
                                
                                if (_snd != snd_micro_ballbattle_textblip)
                                {
                                    var _shift = 0.03;
                                    audio_sound_pitch(blip_play, random_range(blip_pitch - _shift, blip_pitch + _shift));
                                }
                            }
                        }
                        
                        if (_chr == ",")
                        {
                            type_index = _ind;
                            pause = 12;
                        }
                        else if (_chr == "-" && string_char_at(arg3, _ind + 1) == " ")
                        {
                            type_index = _ind;
                            pause = 12;
                        }
                        else if ((_chr == "!" || _chr == "?" || _chr == ".") && (string_char_at(arg3, _ind + 1) == " " || string_char_at(arg3, _ind + 1) == "<"))
                        {
                            type_index = _ind;
                            pause = 24;
                        }
                        
                        if (_nopause)
                            pause = 0;
                    }
                    
                    var _amnt = arg5;
                    _inoff = _amnt - (_amnt * chr_in[i]);
                }
                else
                {
                    _inoff = 0;
                }
                
                var _map_spacing = global.map_font_spacing;
                var _map_spacing_after = global.map_font_spacing_after;
                _map_spacing_after = global.map_font_spacing_after;
                
                if (ds_map_exists(_map_spacing, _chr))
                    _w += ds_map_find_value(_map_spacing, _chr);
                
                var _centerxoff;
                
                if (center && !center_setup)
                    _centerxoff = (text_linemaxW - text_center_info[_lines].w) / 2;
                else
                    _centerxoff = 0;
                
                var __x = round(_x + _w + _xoff) + _centerxoff;
                var __y = round(_y + _yoff + _inoff + _ly);
                var _xscale_off, _yscale_off;
                
                if (arg7 && !center_setup)
                {
                    var interval = 80;
                    var index = ((time * 60) div interval) % array_length(array);
                    _xscale_off = array[index][0];
                    _yscale_off = array[index][1];
                }
                else
                {
                    _xscale_off = 0;
                    _yscale_off = 0;
                }
                
                if (!center_setup)
                {
                    draw_text_transformed(__x - ((string_width(_chr) / 2) * _xscale_off), __y - ((string_height(_chr) / 2) * _yscale_off), _chr, 1 + _xscale_off, 1 + _yscale_off, 0);
                    
                    if (_glyph != -4)
                    {
                        draw_sprite_ext(_glyph, global.keyboard, (__x + 8) - ((string_width(_chr) / 2) * _xscale_off), (__y + 36) - ((string_height(_chr) / 2) * _yscale_off), 1, 1, 0, c_white, 1);
                        _w += 82;
                        _glyph = -4;
                    }
                }
                
                _chrcount++;
                
                if (_chr != " ")
                    _w += (string_width(_chr) + _wsep);
                
                if (ds_map_exists(_map_spacing_after, _chr))
                    _w += ds_map_find_value(_map_spacing_after, _chr);
            }
        }
    }
    
    if (center_setup)
    {
        array_push(text_center_info, 
        {
            w: _w,
            line: _lines
        });
    }
    
    draw_set_color(c_white);
}
