draw_set_font(global.font_dialogue);
draw_set_halign(fa_center);
draw_text(960, 20, "MULTIPLAYER SETUP");
draw_text(960, 120, string("Connected: {0}", input_player_connected_count()));
draw_set_halign(fa_left);

for (var i = 0; i < 2; i++)
{
    var _x = 20 + (1000 * i);
    var _y = 300;
    var _sep = 100;
    var _str;
    
    if (input_player_connected(i))
        _str = "Connected";
    else
        _str = "Disconnected";
    
    var _input;
    
    if (!input_player_get_gamepad(i))
        _input = "keyboard";
    else
        _input = input_player_get_gamepad_type(i);
    
    draw_text(_x, _y, string("P{0}: {1}", i + 1, _str));
    
    if (input_player_connected(i))
        draw_text(_x, _y + _sep, string("Input: {0}", _input));
}

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(960, 1060, "PRESS START");
draw_set_valign(fa_top);
draw_set_halign(fa_left);
