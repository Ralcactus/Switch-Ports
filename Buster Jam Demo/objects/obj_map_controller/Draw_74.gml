testvariablenothing = false;

if (!trailer)
{
    draw_sprite_ext(spr_map_ui_coin, 0, gui_coins_xoff, 0, 1, 1, 0, c_white, gui_alpha);
    draw_set_font(global.font_score);
    draw_set_alpha(gui_alpha);
    draw_set_halign(fa_right);
    var _str = string_add_zeros(global.coins, 3);
    draw_text(1765 + gui_coins_xoff, 966, _str);
    draw_set_halign(fa_left);
    draw_set_alpha(1);
}

if (!instance_exists(obj_scene_manager))
{
    with (obj_interact)
    {
        if (touching)
        {
            get_cams();
            var _glyph;
            
            if (input_source_using(__input_global().__source_keyboard))
                _glyph = spr_glyph_kb_z;
            else
                _glyph = spr_glyph_gp_cross;
            
            var _x = -999;
            var _y = -999;
            var _glyph_player = true;
            
            if (instance_exists(my_character))
                _glyph_player = my_character.glyph_player;
            
            if (_glyph_player)
            {
                if (instance_exists(obj_map_player))
                {
                    _x = obj_map_player.x;
                    _y = (obj_map_player.y - 250) + obj_map_player.z;
                }
            }
            else if (instance_exists(my_character))
            {
                _x = my_character.x;
                _y = (my_character.bbox_top - 64) + my_character.z;
            }
            
            draw_sprite_ext(_glyph, global.keyboard, _x - camx, _y - camy, 0.9, 0.9, 0, c_white, 1);
        }
    }
}
