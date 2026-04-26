canCollide = function(arg0 = obj_parent_player)
{
    switch (arg0)
    {
        case obj_parent_player:
        case obj_player1:
        case obj_player2:
            var _state = global.freezeframe ? arg0.frozenState : arg0.state;
            return _state != UnknownEnum.Value_54;
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
stopid = -4;
stopSpeed = 0;
stopSpeedMax = 4;
stopSpeedAcc = 0.5;
stopSpeedDecc = 0.5;
platformDirection = targetDirection;
TrueX = x;
TrueY = y;
hasMove = false;

moveCode = function()
{
    if (hasMove)
        exit;
    
    xprevious = x;
    yprevious = y;
    
    if (!active)
        exit;
    
    hsp = round(lengthdir_x(movespeed - stopSpeed, targetDirection));
    vsp = round(lengthdir_y(movespeed - stopSpeed, targetDirection));
    TrueX += hsp;
    TrueY += vsp;
    x = round(TrueX);
    y = round(TrueY);
    
    if (place_meeting(x + sign(hsp), y + sign(vsp), obj_movingPlatformTrigger) && !stopped)
    {
        with (instance_place(x + sign(hsp), y + sign(vsp), obj_movingPlatformTrigger))
        {
            if (other.stopid != id)
            {
                other.platformDirection = targetAngle;
                other.stopped = true;
                other.stopid = id;
            }
        }
    }
    
    if (stopped)
    {
        stopSpeed = approach(stopSpeed, stopSpeedMax, stopSpeedAcc);
        
        if (stopSpeed >= stopSpeedMax)
        {
            targetDirection = platformDirection;
            stopped = false;
        }
    }
    else
    {
        stopSpeed = approach(stopSpeed, 0, stopSpeedDecc);
    }
    
    hasMove = true;
};
