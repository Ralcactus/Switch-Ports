testvariablenothing = false;

if (state == 2)
{
    draw_sprite(spr_micro_nudematch_win, 1, 0, 0);
    draw_sprite(spr_micro_nudematch_win, 0, 0, 0);
    var _spr;
    
    if (char == 1)
        _spr = spr_micro_nudematch_win_buster;
    else
        _spr = spr_micro_nudematch_win_bridget;
    
    win_ind += ((sprite_get_speed(_spr) / 60) * global.delta_game_factor);
    draw_sprite(_spr, win_ind, 0, 0);
    var _scale = 0.3645224171539961;
    var _x, _y;
    
    if (char == 1)
    {
        _x = 1080;
        _y = 41;
    }
    else
    {
        _x = 1037;
        _y = 14;
    }
    
    draw_sprite_ext(spr_micro_nudematch_heads, char, _x, _y, _scale, _scale, 0, c_white, 1);
    draw_sprite_ext(spr_micro_nudematch_eyes, eyes, _x, _y, _scale, _scale, 0, c_white, 1);
    draw_sprite_ext(spr_micro_nudematch_mouths, mouth, _x, _y, _scale, _scale, 0, c_white, 1);
    draw_sprite_ext(spr_micro_nudematch_noses, nose, _x, _y, _scale, _scale, 0, c_white, 1);
}

draw_set_alpha(flash);
draw_rectangle(0, 0, controller.game_width, controller.game_height, false);
draw_set_alpha(1);
