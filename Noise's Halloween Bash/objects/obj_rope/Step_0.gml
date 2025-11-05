if (game_paused())
    exit;

touchbuff = max(touchbuff - 1, 0);
var _swingdir = sign(dcos(image_angle - 90));
var _swingspeedmul = 10;
var _swingspd = (obj_player.move / image_yscale) * _swingspeedmul;
var _swinging = false;

if (sign(_swingdir) == 0)
    _swingdir = obj_player.move;

if ((obj_player.move == _swingdir && abs(wavespd) < abs(_swingspd)) || sign(wavespd) != obj_player.move)
    _swinging = true;

if (obj_player.move == _swingdir && abs(wavespd) > abs(_swingspd))
    _swinging = false;

if (obj_player.move != _swingdir && abs(wavespd) < abs(_swingspd))
    _swinging = true;

if (obj_player.move != sign(wavespd))
    _swinging = true;

if (obj_player.move != 0 && obj_player.state == states.rope && obj_player.ropeID == id)
{
    if (_swinging)
    {
        var _diff = abs(angle_difference(image_angle, 74 * obj_player.move)) * 0.02;
        
        if (_diff > 1)
            _diff = 1;
        
        wavespd = approach(wavespd, _swingspd * _diff, 0.2);
        image_angle += wavespd;
        exit;
    }
}

wavespd += (-0.4 * dcos(image_angle - 90));
image_angle += wavespd;
wavespd *= 0.98;
