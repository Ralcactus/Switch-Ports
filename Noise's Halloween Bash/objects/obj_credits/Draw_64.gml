if (!endshot)
{
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    draw_set_font(global.namefont);
    
    if (namefade > 0)
        __draw_text_colour_hook(get_game_width() / 2, get_game_height() / 2, string_get("credits/gamename"), c_white, c_white, c_white, c_white, namefade);
    
    var _angle1 = -((anim * 360) + 90);
    var _angle2 = (anim2 * 360) + 90;
    draw_set_valign(fa_top);
    var _textx = floor((get_game_width() / 2) + lengthdir_x(200, _angle1));
    var _texty = floor(get_game_height() + lengthdir_y(get_game_height() / 2, _angle1));
    
    if (is_array(currname))
    {
        var _name = currname[0];
        var _nameh = string_height(_name);
        var _pumpkins = array_create(0);
        array_copy(_pumpkins, 0, currname, 1, array_length(currname) - 1);
        __draw_text_hook(_textx, _texty + (_nameh / 2), _name);
        var _len = array_length(_pumpkins);
        var _trows = (_len - 1) div 6;
        
        for (var _i = 0; _i < _len; _i++)
        {
            var _row = _i div 6;
            var _x = (_textx - (((min(_len - (_row * 6), 6) - 1) * 80) / 2)) + (80 * (_i % 6));
            var _y = _texty - (_nameh / 2) - (40 * (_trows - _row));
            draw_sprite(spr_pumpkin, pumpkinind, _x, _y);
            draw_sprite(spr_pumpkinface, _pumpkins[_i], _x, _y);
        }
    }
    else
        __draw_text_hook(_textx, _texty, currname);
    
    draw_set_halign(fa_left);
    draw_set_font(global.rolefont);
    __draw_text_hook(floor(100 + lengthdir_x(100, _angle2)), floor(-50 + lengthdir_y(100, _angle2)), currrole);
    
    if (device_mouse_y_to_gui(0) > 33 && !input_player_using_gamepad() && namefade <= 0)
        draw_sprite(cursorspr, cursorind, global.screenmouse_x, global.screenmouse_y);
}
else
{
    draw_sprite_ext(spr_endgraphictext, current_month == 10, get_game_width() / 2, get_game_height() / 2, 1, 1, 0, c_white, endfade);
    draw_sprite_ext(spr_endgraphic, 0, get_game_width() / 2, get_game_height() / 2, 1, 1, 0, c_white, endfade);
    draw_set_font(global.font);
    draw_set_valign(fa_middle);
    
    if (endtiptimer <= 0)
    {
        draw_set_halign(fa_center);
        draw_text_fancy(get_game_width() / 2, get_game_height() - 32, endtipstr, c_white, 1);
    }
    
    var _x1 = lerp(0, get_game_width() / 2, perfectfade);
    var _x2 = lerp(get_game_width(), get_game_width() / 2, perfectfade);
    var _y = get_game_height() / 2;
    draw_set_halign(fa_right);
    draw_text_fancy(_x1, _y, perfectstrs[0], c_white, 1);
    draw_set_halign(fa_left);
    draw_text_fancy(_x2, _y, perfectstrs[1], c_white, 1);
    draw_sprite_ext(spr_creditsbluesphere, 0, _x1 - perfectwidths[0] - 16, _y, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_creditsbluesphere, 0, _x2 + perfectwidths[1] + 16, _y, -1, 1, 0, c_white, 1);
}
