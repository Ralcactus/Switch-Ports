var hsep = 10;
var vsep = 4;
x = xstart + shake_x;
y = ystart + shake_y;
draw_sprite(spr_Br_kittymeow_meterback, 0, 1298 + shake_x, 15 + shake_y);

for (var i = 0; i < min(strength, 12); i++)
{
    var x1 = hsep + x;
    var y1 = (-vsep + y + sprite_height) - ((sprite_height / 12) * i);
    var x2 = -hsep + x1 + sprite_width;
    var y2 = (vsep + y1) - (sprite_height / 12);
    
    if (i < 6)
        draw_set_color(c_green);
    else if (i < 10)
        draw_set_color(c_yellow);
    else
        draw_set_color(c_red);
    
    draw_rectangle(x1, y1, x2, y2, false);
    draw_set_color(c_white);
}
