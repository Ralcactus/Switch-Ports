if (game_paused() || !player_collideable())
    exit;

event_play_oneshot("event:/sfx/player/gemcollect");
obj_drawcontroller.gematimer = 200;
get_gem(gemid);
gamepadvibrate(0.2, 0, 8);
scr_createparticle(true, x, y, z + 4, spr_gemeffect);
var _sp = world_to_screen(x, y, z, obj_drawcontroller.viewMat, obj_drawcontroller.projMat);

with (instance_create_depth(_sp[0], _sp[1], 0, obj_gemcollectparticle))
{
    model = other.model;
    gemid = other.gemid;
    colour = other.colour;
    var _gemsize = 30;
    var _gemwidth = (_gemsize * 2) + 32;
    var _surfacewidth = _gemwidth * 3;
    var _surfaceheight = (_gemsize * 2) + 32;
    var _surfx = (get_game_width() / 2) - (_surfacewidth / 2);
    var _surfy = get_game_height() - _surfaceheight - 10;
    
    switch (gemid)
    {
        case 1:
            xend = _surfx + ((_surfacewidth / 2) - _gemwidth);
            break;
        
        case 2:
            xend = _surfx + (_surfacewidth / 2);
            break;
        
        case 3:
            xend = _surfx + ((_surfacewidth / 2) + _gemwidth);
            break;
    }
    
    yend = _surfy + (_surfaceheight / 2);
}

instance_destroy();
