draw_self();
var _amnt = 7;
var _xshake = random_range(-shake[eyes] * _amnt, shake[eyes] * _amnt);
var _yshake = random_range(-shake[eyes] * _amnt, shake[eyes] * _amnt);

if (row == 0)
{
    _xshake += random_range(-1, 1);
    _yshake += random_range(-1, 1);
}

draw_sprite(spr_micro_nudematch_eyes, index[eyes], x + _xshake, y + _yshake);
_xshake = random_range(-shake[mouth] * _amnt, shake[mouth] * _amnt);
_yshake = random_range(-shake[mouth] * _amnt, shake[mouth] * _amnt);

if (row == 2)
{
    _xshake += random_range(-1, 1);
    _yshake += random_range(-1, 1);
}

draw_sprite(spr_micro_nudematch_mouths, index[mouth], x + _xshake, y + _yshake);
_xshake = random_range(-shake[nose] * _amnt, shake[nose] * _amnt);
_yshake = random_range(-shake[nose] * _amnt, shake[nose] * _amnt);

if (row == 1)
{
    _xshake += random_range(-1, 1);
    _yshake += random_range(-1, 1);
}

draw_sprite(spr_micro_nudematch_noses, index[nose], x + _xshake, y + _yshake);

if (!controller.win && object_index == obj_micro_nudematch_head)
{
    arrow_ind += ((sprite_get_speed(spr_micro_nudematch_arrow) / 60) * global.delta_game_factor);
    var _yoff;
    
    if (row == 0)
        _yoff = 307;
    else if (row == 1)
        _yoff = 378;
    else if (row == 2)
        _yoff = 462;
    
    draw_sprite(spr_micro_nudematch_arrow, arrow_ind, x + 61, y + _yoff + arrow_leftoff);
    draw_sprite_ext(spr_micro_nudematch_arrow, arrow_ind, x + 582, y + _yoff + arrow_rightoff, -1, 1, 0, c_white, 1);
}
