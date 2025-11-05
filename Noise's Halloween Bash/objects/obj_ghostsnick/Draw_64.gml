if (jumpscare)
{
    var _sprite = spr_ghostsnick_jumpscare;
    var _ind = get_cycleind(_sprite, 0.35);
    var _gw = get_game_width();
    var _gh = get_game_height();
    var _scale = tween(0, 3, 1 - (jumpscaretimer / 60), EASE_IN_CUBIC);
    draw_sprite_ext(_sprite, _ind, _gw / 2, _gh / 2, _scale, _scale, 0, c_white, 1);
}
