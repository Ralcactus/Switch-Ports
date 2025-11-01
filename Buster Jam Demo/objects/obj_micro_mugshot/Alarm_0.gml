with (controller)
    event_set_time(23);

timer[0] = 105;
timer[2] = 90;
char_sep = controller.game_width * 0.745;
xoff = char_sep;
xoff_start = 0;
xoff_to = 0;
percent = 0;
var _choose;

if (room == rm_boomtown_boss)
    _choose = choose(0, 2);
else
    _choose = irandom_range(0, 3);

if (_choose == 0)
    order = [Bu, Br, Zi, Ed, Wi, Bu, Br, Wi, Zi, Ed];
else if (_choose == 1)
    order = [Br, Bu, Wi, Zi, Ed, Br, Wi, Bu, Zi, Ed];
else if (_choose == 2)
    order = [Bu, Ed, Zi, Br, Wi, Bu, Ed, Wi, Zi, Br];
else if (_choose == 3)
    order = [Br, Zi, Bu, Wi, Ed, Bu, Br, Wi, Ed, Zi];

var _x = xoff + (controller.game_width / 2);
var _y = controller.game_height;

for (var i = 0; i < array_length(order); i++)
{
    var _inst = instance_create_layer(_x + (char_sep * i), _y, "Middle", obj_micro_mugshot_char);
    _inst.ID = ID;
    _inst.controller = controller;
    _inst.sprite_index = order[i];
    _inst.xpos = _inst.x;
    
    if (i == 0)
        _inst.start = true;
}
