if (global.gamePaused && !instance_exists(obj_optionsmenu))
{
    draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, get_game_width(), get_game_height(), c_black, pausealpha);
    var _x = pause_pizzascoreX;
    var _y = pause_pizzascoreY;
    draw_sprite(spr_pause_pumpkin, 0, floor(_x), floor(_y));
    
    for (var i = 0; i < array_length(options); i++)
        draw_sprite(spr_pause_options, options[i][0], _x - 312, floor((_y + (sprite_get_height(spr_pause_options) * i)) - ((sprite_get_height(spr_pause_options) * array_length(options)) / 2)) + 16);
    
    pal_swap_set(obj_player.palettespr, obj_player.curpalette, false);
    draw_sprite(spr_pause_noise, -1, pause_portraitX, pause_portraitY);
    pal_swap_reset();
    
    if (!manual)
    {
        cursorx = -312 - (sprite_get_width(spr_pause_options) / 2);
        cursory = floor(((sprite_get_height(spr_pause_options) * selected) - ((sprite_get_height(spr_pause_options) * array_length(options)) / 2)) + (sprite_get_height(spr_pause_options) / 2)) + 16;
        draw_sprite(spr_pause_pointer, 0, floor(_x + cursorx) + irandom_range(-2, 2), floor(_y + cursory) + irandom_range(-2, 2));
    }
    
    var _shakemanual = manual && !instance_exists(obj_manual);
    draw_sprite_ext(spr_pause_manual, manual, irandom_range(-2, 2) * _shakemanual, irandom_range(-2, 2) * _shakemanual, 1, 1, 0, c_white, pausealpha * 2);
    
    if (!manual)
        draw_input(80, 70, pausealpha * 2, 0, "left");
}
