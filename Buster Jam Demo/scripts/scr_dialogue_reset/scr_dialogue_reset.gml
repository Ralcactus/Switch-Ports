function scr_dialogue_reset(arg0, arg1 = false)
{
    if (!variable_instance_exists(id, "text_spd_default"))
        text_spd_default = 0.43;
    
    text_spd = text_spd_default;
    char_speak = -4;
    text_finished = arg1;
    chr_total = [];
    
    if (!variable_instance_exists(id, "text_linemaxW"))
        text_linemaxW = 99999;
    
    func_skip_chr = function(arg0)
    {
        if (!array_contains(skips, arg0))
        {
            array_push(skips, arg0);
            type_index++;
            
            if (type_index > (array_length(chr_total) - 1))
                type_index = array_length(chr_total) - 1;
        }
    };
    
    center = false;
    
    if (object_index == obj_textbox)
    {
        skippable = true;
        sprite_index = spr_textbox;
        destroy = true;
    }
    
    struct_text_effects = 
    {
        test: "test"
    };
    blip_play = -4;
    blip = [[snd_textbox_default]];
    blip_pitch = 1;
    
    if (object_index == obj_textbox && portrait != -4)
    {
        switch (portrait)
        {
            case spr_portrait_buster:
                blip = [[snd_textbox_buster]];
                break;
            
            case spr_portrait_bridget:
                blip = [[snd_textbox_bridget], [snd_textbox_bridget_scream]];
                break;
            
            case spr_portrait_wizard:
                blip = [[snd_textbox_wizard]];
                break;
            
            case spr_portrait_lance:
                blip = [[snd_textbox_lance]];
                break;
            
            case spr_portrait_dennis:
                blip = [[snd_textbox_dennis_0], [snd_textbox_dennis_1], [snd_textbox_dennis_0, snd_textbox_dennis_0, snd_textbox_dennis_0, snd_textbox_dennis_1]];
                break;
            
            case spr_portrait_jade:
                blip = [[snd_textbox_jade]];
                break;
        }
    }
    
    blip_group = 0;
    type_index = 0;
    
    for (var i = 0; i < (string_length(arg0) + 1); i++)
    {
        chr_in[i] = 0;
        chr_total[i] = "";
    }
    
    skips = [];
    pauses = [];
    text_speeds = [];
    blip_swaps = [];
    auto = false;
    auto_delay = 90;
    skippable = true;
    draw_portrait = true;
    
    for (var i = 0; i < string_length(arg0); i++)
    {
        var _ind = i + 1;
        var _chr = string_char_at(arg0, _ind);
        
        if (_chr == "<")
        {
            chr_total[i] = _chr;
            var _lookstr = "";
            var _lookstr_each = "";
            var _lookchr = "";
            var _lookind = _ind;
            var _count = 0;
            var _texts = [];
            
            while (_lookchr != ">")
            {
                _lookstr = string_insert(_lookchr, _lookstr, string_length(arg0) + 1);
                _lookstr_each = string_insert(_lookchr, _lookstr_each, string_length(arg0) + 1);
                _lookind++;
                _count++;
                _lookchr = string_char_at(arg0, _lookind);
                
                if (_lookchr == " " || _lookchr == ">")
                {
                    array_push(_texts, _lookstr_each);
                    _lookstr_each = "";
                }
                
                if (_count >= 50)
                {
                    show_message("ERROR: No event ending '>' found!");
                    break;
                }
            }
            
            for (var ii = 0; ii < array_length(_texts); ii++)
            {
                if (ii > 0)
                    _texts[ii] = string_delete(_texts[ii], 1, 1);
            }
            
            if (object_index == obj_textbox)
            {
                if (_texts[0] == "noskip" || _texts[0] == "auto")
                    skippable = false;
                else if (_texts[0] == "transparent")
                    sprite_index = spr_textbox_transparent;
                else if (_texts[0] == "donotdestroy")
                    destroy = false;
                else if (_texts[0] == "no_portrait")
                    draw_portrait = false;
                else if (_texts[0] == "char_speak")
                    char_speak = _texts[1];
            }
            
            if (_texts[0] == "center")
                center = true;
            
            struct_set(struct_text_effects, string("i{0}", i), _texts);
            i += _count;
        }
        else
        {
            chr_total[i] = _chr;
        }
    }
    
    text_center_info = [];
    center_setup = true;
    scr_draw_dialogue(0, 0, text_linemaxW, arg0, true);
    center_setup = false;
    pause = 0;
}
