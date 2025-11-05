if (game_paused() || !player_collideable())
    exit;

if (touchbuff <= 0)
{
    with (other.id)
    {
        if (state != states.rope)
        {
            var _prevx = x;
            var _prevy = y;
            ropexstartpos = _prevx;
            ropeystartpos = _prevy;
            ropel = 0;
            state = states.rope;
            ropeID = other.id;
            obj_drawcontroller.interpplaypos = true;
            other.wavespd = hsp * ((1 / other.image_yscale) * 0.6);
            
            if (event_isplaying(tornadosnd))
                event_stop(tornadosnd, 1);
            
            scr_fmod_soundeffect(ropegrabsnd, x, y);
        }
    }
}
