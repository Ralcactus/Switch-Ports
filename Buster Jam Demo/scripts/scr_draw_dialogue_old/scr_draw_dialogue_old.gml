function scr_draw_dialogue_old(arg0 = 198, arg1 = 764, arg2 = 1480, arg3 = "No text set.", arg4 = false, arg5 = 6, arg6 = false, arg7 = 106)
{
    var _x = arg0;
    var _y = arg1;
    var _w = 0;
    var _ly = 0;
    var _linemaxW = arg2;
    var _line_height = arg7;
    var _wsep = 2;
    var _wsep_blank = 35;
    var _wave = false;
    var _shake = 0;
    var _hueshift = false;
    var _circle = false;
    var _nopause = false;
    var _chrcount = 0;
    var _line_widths = [];
    var _cur_width = 0;
    
    for (var i = 0; i < string_length(arg3); i++)
    {
        var _chr = string_char_at(arg3, i + 1);
        
        if (_chr == "<")
        {
            var _lookchr = "";
            var _lookind = i + 1;
            var _count = 0;
            var _event_str = "";
            
            while (_lookchr != ">" && _count < 50)
            {
                _lookchr = string_char_at(arg3, _lookind);
                _event_str += _lookchr;
                _lookind++;
                _count++;
            }
            
            if (string_pos("break", _event_str) > 0)
            {
                array_push(_line_widths, _cur_width);
                _cur_width = 0;
            }
        }
        else if (_chr == " ")
        {
            var _lookw = _cur_width;
            var _linebreak = false;
            
            for (var ii = 2; ii < 100; ii++)
            {
                var _lookchr = string_char_at(arg3, i + ii);
                
                if (_lookchr == " ")
                    break;
                
                if (_lookchr == "<")
                {
                    var _count2 = 0;
                    var _lookending = "";
                    
                    while (_lookending != ">" && _count2 < 50)
                    {
                        _lookending = string_char_at(arg3, i + ii + _count2);
                        _count2++;
                    }
                    
                    ii += (_count2 - 1);
                }
                else
                {
                    _lookw += string_width(_lookchr);
                    
                    if (_lookw >= arg2)
                    {
                        _linebreak = true;
                        break;
                    }
                }
            }
            
            if (_linebreak)
            {
                array_push(_line_widths, _cur_width);
                _cur_width = 0;
                continue;
            }
            
            _cur_width += _wsep_blank;
        }
        else
        {
            _cur_width += (string_width(_chr) + _wsep);
        }
    }
    
    array_push(_line_widths, _cur_width);
    
    for (var i = 0; i < type_index; i++)
    {
        var _xoff = 0;
        var _yoff = 0;
        var _event = false;
        var _ind = i + 1;
        var _chr = string_char_at(arg3, _ind);
        
        switch (_chr)
        {
            case "<":
                _event = true;
                break;
            
            case " ":
                var _lookw = _w;
                var _linebreak = false;
                
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
                        
                        if (_lookw >= _linemaxW)
                        {
                            _linebreak = true;
                            break;
                        }
                    }
                }
                
                if (_linebreak)
                {
                    _w = 0;
                    _ly += _line_height;
                    continue;
                }
                
                break;
        }
        
        if (_event)
        {
            var _lookstr = "";
            var _lookstr_each = "";
            var _lookchr = "";
            var _lookind = _ind;
            var _count = 0;
            var _texts = [];
            
            while (_lookchr != ">")
            {
                _lookstr = string_insert(_lookchr, _lookstr, string_length(arg3) + 1);
                _lookstr_each = string_insert(_lookchr, _lookstr_each, string_length(arg3) + 1);
                _lookind++;
                _count++;
                _lookchr = string_char_at(arg3, _lookind);
                
                if (_lookchr == " " || _lookchr == ">")
                {
                    array_push(_texts, _lookstr_each);
                    _lookstr_each = "";
                }
                
                if (_count >= 50)
                {
                    text = "";
                    scr_dialogue_reset();
                    show_message("ERROR: No event ending '>' found!");
                    break;
                }
            }
            
            for (var ii = 0; ii < array_length(_texts); ii++)
            {
                if (ii > 0)
                    _texts[ii] = string_delete(_texts[ii], 1, 1);
            }
            
            if (_texts[0] == "col")
            {
                switch (_texts[1])
                {
                    case "white":
                        draw_set_color(c_white);
                        break;
                    
                    case "red":
                        draw_set_color(c_red);
                        break;
                    
                    case "lime":
                        draw_set_color(c_lime);
                        break;
                    
                    case "orange":
                        draw_set_color(c_orange);
                        break;
                    
                    case "yellow":
                        draw_set_color(c_yellow);
                        break;
                }
            }
            else if (_texts[0] == "blip")
            {
                if (!array_contains(blip_swaps, i))
                {
                    blip_group = real(_texts[1]);
                    array_push(blip_swaps, i);
                }
            }
            else if (_texts[0] == "pitch")
            {
                blip_pitch = real(_texts[1]);
            }
            else if (_texts[0] == "noskip")
            {
                skippable = false;
            }
            else if (_texts[0] == "auto")
            {
                auto = true;
                
                if (array_length(_texts) > 1)
                    auto_delay = _texts[1];
            }
            else if (_texts[0] == "break")
            {
                var _linebreak = true;
                _w = 0;
                _ly += _line_height;
            }
            else if (_texts[0] == "pause")
            {
                if (!array_contains(pauses, i))
                {
                    pause = _texts[1];
                    array_push(pauses, i);
                }
            }
            else if (_texts[0] == "nopause")
            {
                _nopause = true;
            }
            else if (_texts[0] == "yespause")
            {
                _nopause = false;
            }
            else if (_texts[0] == "wave")
            {
                _wave = !_wave;
            }
            else if (_texts[0] == "shake")
            {
                _shake = real(_texts[1]);
            }
            else if (_texts[0] == "hueshift")
            {
                _hueshift = !_hueshift;
                
                if (!_hueshift)
                    draw_set_color(c_white);
            }
            else if (_texts[0] == "circle")
            {
                _circle = !_circle;
            }
            
            if (!array_contains(skips, i))
            {
                array_push(skips, i);
                type_index += _count;
                type_index = min(type_index, string_length(arg3));
            }
            
            i += _count;
        }
        else
        {
            if (_wave)
                _yoff += (sin(time + (i * 0.2)) * 3);
            
            _xoff += irandom_range(-_shake, _shake);
            _yoff += irandom_range(-_shake, _shake);
            
            if (_hueshift)
            {
                var _hue = ((time * 12) + (_chrcount * 3)) % 255;
                draw_set_color(make_color_hsv(_hue, 185, 255));
            }
            
            if (_circle)
            {
                _xoff += (sin((time * 1.5) + (i * 0.75)) * 2);
                _yoff += (cos((time * 1.5) + (i * 0.75)) * 2);
            }
            
            var _before = chr_in[i];
            chr_in[i] = approach(chr_in[i], 1, 0.15);
            var _ended;
            
            if (object_index == obj_textbox)
                _ended = text_ended;
            else if (object_index == obj_map_name)
                _ended = true;
            else
                _ended = false;
            
            if (_before == 0 && chr_in[i] != 0 && !_ended)
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
            var _inoff = _amnt - (_amnt * chr_in[i]);
            
            if (_chr == "y" || _chr == "g")
                _w -= 6;
            else if (_chr == "," || _chr == ".")
                _w += 4;
            else if (_chr == "!")
                _w += 2;
            
            var _line_index = _ly div _line_height;
            var _center_off = 0;
            
            if (arg6)
                _center_off = -(_line_widths[_line_index] / 2);
            
            var __x = round(_x + _w + _xoff + _center_off);
            var __y = round(_y + _yoff + _inoff + _ly);
            var interval = 80;
            var index = ((time * 60) div interval) % array_length(array);
            var _xscale_off = array[index][0];
            var _yscale_off = array[index][1];
            draw_text_transformed(__x - ((string_width(_chr) / 2) * _xscale_off), __y - ((string_height(_chr) / 2) * _yscale_off), _chr, 1 + _xscale_off, 1 + _yscale_off, 0);
            _chrcount++;
            
            if (_chr == " ")
                _w += _wsep_blank;
            else
                _w += (string_width(_chr) + _wsep);
            
            if (_chr == "Y")
                _w -= 6;
            else if (_chr == "'")
                _w += 3;
        }
    }
    
    draw_set_color(c_white);
}
