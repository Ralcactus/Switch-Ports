x = xpos + obj_micro_mugshot.xoff;
var _length = array_length(obj_micro_mugshot.order);
var _width = controller.game_width / 2;

if (x < -_width)
    xpos += (obj_micro_mugshot.char_sep * _length);

if (x < controller.game_width && x > 0)
    inside = true;
else
    inside = false;

image_index += ((sprite_get_speed(sprite_index) / 60) * global.delta_game_factor);
