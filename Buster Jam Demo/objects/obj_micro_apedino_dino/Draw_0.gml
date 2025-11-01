var _amnt;

if (state == state_crouch)
    _amnt = 0;
else
    _amnt = -5;

draw_sprite(anim_sprite, anim_index, x, y - (_amnt * bounce));
