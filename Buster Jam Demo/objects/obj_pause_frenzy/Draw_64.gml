testvariablenothing = false;
draw_set_font(global.font_dialogue);
draw_set_color(c_black);
draw_rectangle(0, 0, 1920, 1080, false);
draw_set_color(c_white);

if (instance_exists(obj_options))
{
    with (obj_options)
        event_user(1);
}

if (unpaused)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(960, 540, text);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    exit;
}

if (deac)
    exit;

var _y = 200;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(960, _y, " - PAUSED -");
draw_set_valign(fa_top);
draw_set_halign(fa_left);
_y = 500;
var _sep = 90;
draw_set_halign(fa_center);

for (var i = 0; i < array_length(options); i++)
{
    if (selected == i)
        draw_set_color(c_yellow);
    else
        draw_set_color(c_white);
    
    draw_text(960, _y + (_sep * i), options[i]);
    
    if (selected != i)
    {
        draw_set_alpha(0.4);
        draw_set_color(c_black);
        draw_text(960, _y + (_sep * i), options[i]);
        draw_set_alpha(1);
    }
    
    draw_set_color(c_white);
}

draw_set_halign(fa_left);
