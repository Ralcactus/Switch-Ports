if (game_paused())
    exit;

var _target = (place_meeting(x, y, obj_player) * 2) - 1;

if (obj_player.state == states.endplatform)
    _target = 0;

alpha = approach(alpha, _target, 0.025);
