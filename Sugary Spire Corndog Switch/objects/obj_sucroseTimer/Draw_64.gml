draw_set_font(global.timerfont);

var xx = 960 / 2;
var yy = timer_y;

if (obj_player1.y > (room_height - 139))
    draw_set_alpha(0.3);
else
    draw_set_alpha(1);

var b = false;

if (minutes <= 0 && seconds <= 10)
    b = true;

if (addseconds != seconds)
    draw_sprite(spr_timer_gain, image_index, xx, yy);
else
    draw_sprite(spr_timer, image_index, xx, yy);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
var t = string(minutes);

if (string_length(t) < 2)
    t = concat("0", minutes);

var q = string(floor(seconds));

if (string_length(q) < 2)
    q = concat("0", floor(seconds));

var x2 = xx - 65;
var y2 = yy - 40;

if (addseconds != seconds)
	draw_set_colour(c_green)
else
	draw_set_colour(c_red)

for (var i = 0; i < string_length(t); i++)
    draw_text(x2 + (i * 33), y2, string_char_at(t, i + 1));

x2 = xx + 20;

for (var i = 0; i < string_length(q); i++)
    draw_text(x2 + (i * 33), y2, string_char_at(q, i + 1));

draw_set_colour(c_white)
draw_set_alpha(1);