testvariablenothing = false;
var _effect = false;

if (room == rm_endless)
{
    if (effect_countdown == -1 && obj_frenzy.game >= effect_gamenum_start)
        effect_countdown = irandom_range(1, 3);
    
    if (effect_countdown > 0)
    {
        effect_countdown--;
        
        if (effect_countdown == 0)
        {
            _effect = true;
            
            if (obj_frenzy.game >= 300)
                effect_countdown = 1;
            else if (obj_frenzy.game >= 250)
                effect_countdown = choose(1, 1, 2);
            else if (obj_frenzy.game >= 200)
                effect_countdown = irandom_range(1, 3);
            else if (obj_frenzy.game >= 150)
                effect_countdown = irandom_range(2, 3);
            else if (obj_frenzy.game >= 125)
                effect_countdown = irandom_range(3, 5);
            else if (obj_frenzy.game >= 100)
                effect_countdown = irandom_range(4, 6);
            else
                effect_countdown = irandom_range(5, 7);
        }
    }
}

if (!_effect)
    exit;

var _chance;

if (obj_frenzy.game >= 220)
    _chance = 12;
else if (obj_frenzy.game >= 100)
    _chance = 10;
else if (obj_frenzy.game >= 50)
    _chance = 5;
else
    _chance = 0;

var _upside = irandom_range(1, 100);

if (obj_frenzy.game >= 0 && _upside <= _chance && _chance != 0)
{
    last_game.upside_down = true;
    
    if (obj_frenzy.game < 200)
        exit;
}

var _choose = choose("circle", "bounce", "shake", "scrollX", "jumpcut");
var _bounce = false;

if (_choose == "scrollX")
{
    _chance = irandom_range(1, 100);
    
    if (_chance <= 20)
        _bounce = true;
}

if (_choose == "circle")
{
    last_game.xmove_length = 100;
    last_game.xmove_spd = 0.02;
    last_game.ymove_length = 70;
    last_game.ymove_spd = 0.02;
}

if (_choose == "scrollX")
{
    last_game.tear = true;
    last_game.scroll_xspd = -8 * choose(-1, 1);
}

if (_choose == "bounce" || _bounce)
    last_game.bounce = true;

if (_choose == "jumpcut")
{
    last_game.jumpcut_xrange = 120;
    last_game.jumpcut_yrange = 100;
    last_game.jumpcut_delay = 60;
}

if (_choose == "shake")
{
    if (obj_frenzy.game >= 200)
        last_game.shake = 12;
    else
        last_game.shake = 8;
}
