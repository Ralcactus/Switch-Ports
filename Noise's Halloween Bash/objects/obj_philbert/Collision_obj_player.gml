if (game_paused() || !player_collideable())
    exit;

if (sprite_index != bouncespr)
{
    with (other.id)
    {
        var _ang = other.image_angle + 90;
        var _sign = sign(lengthdir_x(other.image_xscale, _ang));
        
        if (_sign != 0 && other.image_angle != 0)
        {
            image_xscale = _sign;
            dir = _sign;
        }
        
        canchangedir = 1;
        
        if (!other.freehspeed)
        {
            movespeed = abs(lengthdir_x(other.vforce, _ang));
            momentum = movespeed != 0;
            jumpnum *= (movespeed != 0);
            walljumptimer = 15 * momentum;
        }
        
        if (instance_exists(obj_playercape))
            obj_playercape.sprite_index = spr_player_capeup;
        
        player_bounce(lengthdir_y(other.vforce, _ang));
    }
    
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/philbertoink", x, y);
    gamepadvibrate(0.1, 0, 8);
    sprite_index = bouncespr;
    image_index = 0;
}
