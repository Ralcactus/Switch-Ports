draw_self();
var _xoff;

if (array_length(answer) == 3)
    _xoff = 123;
else
    _xoff = 34;

var _x = (x + _xoff) - sprite_get_xoffset(sprite_index);
var _y = y + 29;

for (var i = 0; i < array_length(puzzle); i++)
    draw_sprite(spr_map_puzzle_sign_icon, puzzle[i], _x + (90 * i), _y);
