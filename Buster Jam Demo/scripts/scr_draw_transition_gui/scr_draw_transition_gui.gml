function scr_draw_transition_gui()
{
    if (room != rm_transition_test && object_get_parent(object_index) == par_boss_transition)
        exit;
    
    var _sep = 17;
    var _w = sprite_get_width(spr_trans_hp) + _sep;
    var _grid = 32;
    var _mx = floor(mouse_x / _grid) * _grid;
    var _my = floor(mouse_y / _grid) * _grid;
    
    if (keyboard_check(vk_f1) && room == rm_transition_test)
    {
        for (var i = 0; i < 4; i++)
            draw_sprite_ext(global.hp_spr, 0, _mx + (_w * i), _my, 1, 1, 0, c_white, 0.6);
        
        if (mouse_check_button_pressed(mb_left))
        {
            hp_x = _mx;
            hp_y = _my;
        }
    }
    
    for (var i = 0; i < global.hp_max; i++)
    {
        var _scale = 1;
        var _inst;
        
        if (instance_exists(par_boss))
            _inst = par_boss;
        else if (instance_exists(obj_map_frenzy_gui))
            _inst = obj_map_frenzy_gui;
        else if (instance_exists(obj_macro_lose))
            _inst = obj_macro_lose;
        else
            _inst = -4;
        
        var _spr, _ind;
        
        if (instance_exists(_inst))
        {
            if (_inst.hp > i)
            {
                _spr = global.hp_spr;
                _scale = hp_scale[i];
                _ind = hp_ind;
            }
            else
            {
                _spr = global.hp_spr_lose;
                _scale = 1;
                _ind = 0;
            }
        }
        else
        {
            _spr = global.hp_spr;
            _ind = current_time * 0.004;
        }
        
        draw_sprite_ext(_spr, _ind, hp_x + (_w * i), hp_y, _scale, _scale, 0, c_white, image_alpha);
    }
    
    if (keyboard_check(vk_f2) && room == rm_transition_test)
    {
        draw_set_font(global.font_score);
        draw_set_alpha(0.6);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        var _score = 99;
        var _scale = 3;
        _w = 0;
        
        for (var i = 0; i < 2; i++)
        {
            var _str = string_char_at(_score, i + 1);
            draw_text_transformed(_mx + (_w * _scale), _my, _str, _scale, _scale, dsin(current_time) * 0.8);
            _w += (string_width(_str) + 4);
        }
        
        draw_set_alpha(1);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        
        if (mouse_check_button_pressed(mb_left))
        {
            score_x = _mx;
            score_y = _my;
        }
    }
    
    if (global.hp > 0 && object_index != obj_macro_lose)
    {
        draw_set_font(global.font_score);
        _w = 0;
        var _score;
        
        if (instance_exists(obj_frenzy))
            _score = string_add_zeros(obj_frenzy.game, 2);
        else
            _score = 99;
        
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_alpha(image_alpha);
        var _scale = 3;
        
        for (var i = 0; i < 2; i++)
        {
            var _str = string_char_at(_score, i + 1);
            draw_text_transformed(score_x + (_w * _scale), score_y, _str, _scale, _scale, dsin(current_time) * 0.8);
            _w += (string_width(_str) + 4);
        }
        
        draw_set_alpha(1);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
    
    if (keyboard_check_pressed(vk_space) && room == rm_transition_test)
        show_message(string("SCORE: {0},{1}\nHP: {2},{3}", score_x, score_y, hp_x, hp_y));
    
    with (obj_frenzy_hp_lose)
        event_user(0);
}
