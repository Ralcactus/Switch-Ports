if (game_paused())
    exit;

if (state == 0 && obj_player.state != states.levelintro)
    state = 1;

if (state == 1)
{
    var _gW = get_game_width();
    var _gH = get_game_height();
    tweenedrad = tween(0, sqrt((_gW * _gW) + (_gH * _gH)) * 1.25, ++radstep / radend, EASE_OUT_EXPO);
    
    if (radstep >= radend)
    {
        instance_destroy();
        
        with (obj_drawcontroller)
        {
            hpatimer = 140;
            collectatimer = 140;
            comboatimer = 140;
            pumpkinatimer = 140;
            crateatimer = 140;
            gematimer = 140;
        }
    }
}

fmod_studio_event_instance_set_paused(global.music.event, !state);
