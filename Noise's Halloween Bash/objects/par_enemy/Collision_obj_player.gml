if (game_paused() || hitstuntime > 0 || !player_collideable())
    exit;

var _playerbbh = 0;

with (other.id)
    _playerbbh = bbox_bottom - bbox_top;

var _bouncecond = other.bbox_bottom < (bbox_bottom - ((bbox_bottom - bbox_top) * bboxhmul)) || (other.vsp >= 0 && bbox_bottom > (other.bbox_bottom - (_playerbbh / 2)));

if (other.state == states.hurt)
    _bouncecond = other.bbox_bottom < (bbox_bottom - ((bbox_bottom - bbox_top) * bboxhmul)) && other.vsp >= 0;

if (_bouncecond && !(other.state == states.downslide && other.sprite_index == spr_player_downslidedive && !nohit) && !other.grounded && !nobounce)
{
    with (other.id)
    {
        if (state != states.groundpound)
            player_bounce(input_check("jump") ? -15 : -11);
    }
    
    scr_createparticle(true, bbox_left + ((bbox_right - bbox_left) / 2), bbox_top + ((bbox_bottom - bbox_top) / 2), other.z + 1, spr_bangeffect, 1, 1, 0, 0.35, 0, 0, 0, 0, 0);
    killed = true;
    scr_fmod_soundeffectONESHOT("event:/sfx/enemy/enemykill", x, y);
    gamepadvibrate(0.3, 0, 12);
    exit;
}

if ((other.state == states.cartwheel || other.state == states.downslide) && !nohit)
{
    shakecam(20, 20);
    hitstun(4);
    gamepadvibrate(0.3, 0, 12);
    scr_createparticle(true, bbox_left + ((bbox_right - bbox_left) / 2), bbox_top + ((bbox_bottom - bbox_top) / 2), other.z + 1, spr_bangeffect, 1, 1, 0, 0.35, 0, 0, 0, 0, 0);
    killed = true;
    scr_fmod_soundeffectONESHOT("event:/sfx/enemy/enemykill", x, y);
    exit;
}

if (hurtplayer)
    scr_hurtplayer();
