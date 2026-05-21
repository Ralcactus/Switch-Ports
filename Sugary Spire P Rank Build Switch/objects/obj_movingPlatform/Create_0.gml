canCollide = function(callingObject = obj_player)
{
    switch (callingObject)
    {
        case obj_player:
        case obj_player2:
            var _state = global.freezeframe ? callingObject.frozenstate : callingObject.state;
            return _state != states.ladder;
            break;
        
        default:
            return true;
            break;
    }
};

depth = 5;
image_speed = 0.35;
hsp = 0;
vsp = 0;
stopped = false;
stopid = noone;
stopSpeed = 0;
stopSpeedMax = 4;
stopSpeedAcc = 0.5;
stopSpeedDecc = 0.5;
platformDirection = targetDirection;
TrueX = x;
TrueY = y;
oldx = xstart;
oldy = ystart;
