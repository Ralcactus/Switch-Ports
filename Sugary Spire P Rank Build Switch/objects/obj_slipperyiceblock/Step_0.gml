if (!global.freezeframe)
{
    var _player = instance_nearest(x, y, obj_player);
    
    if (place_meeting(x, y - 1, _player) && _player.grounded && !_player.cutscene && _player.state != states.noclip && _player.state != states.frozen)
    {
        with (_player)
        {
            if (state == states.rupertnormal || state == states.rupertjump || state == states.rupertstick)
            {
                state = states.rupertslide;
                
                if (move != 0)
                    xscale = move;
                else if (hsp != 0)
                    xscale = sign(hsp);
            }
            
            if (state != states.rupertslide)
                state = states.slipnslide;
            
            if (movespeed < 12)
                movespeed = 12;
        }
    }
}
