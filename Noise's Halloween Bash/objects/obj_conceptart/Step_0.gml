if (input_check_pressed("jump"))
    zoomedin = !zoomedin;

if (!zoomedin)
{
    var _dir = input_check_opposing_pressed("up", "down") + input_check_opposing_repeat("up", "down", 0, false, 5, 25);
    var _prevselected = selected;
    selected += _dir;
    selected = clamp(selected, 0, array_length(concepts) - 1);
    
    if (selected != _prevselected)
    {
        zoomtrans = 0;
        zoomxpan = 0;
        zoomypan = 0;
        event_play_oneshot("event:/sfx/pausemenu/move");
    }
    
    if (input_check_pressed("attack"))
    {
        input_verb_consume(["jump", "attack", "inv"]);
        instance_destroy();
    }
}
else
{
    if (input_check_pressed("attack"))
    {
        input_verb_consume("attack");
        zoomedin = false;
    }
    
    var _asset = asset_get_index(concepts[selected]);
    var _xclamp = 0;
    
    if (sprite_get_width(_asset) > get_game_width())
        _xclamp = sprite_get_width(_asset) - get_game_width();
    
    var _yclamp = 0;
    
    if (sprite_get_height(_asset) > get_game_height())
        _yclamp = sprite_get_height(_asset) - get_game_height();
    
    var _movedir = input_direction(noone, "left", "right", "up", "down");
    
    if (_movedir != noone)
    {
        zoomxpan -= lengthdir_x(5 * (1 + input_check("dash")), _movedir);
        zoomypan -= lengthdir_y(5 * (1 + input_check("dash")), _movedir);
    }
    
    zoomxpan = clamp(zoomxpan, -_xclamp / 2, _xclamp / 2);
    zoomypan = clamp(zoomypan, -_yclamp / 2, _yclamp / 2);
}

zoomtrans = approach(zoomtrans, zoomedin, 0.1);
