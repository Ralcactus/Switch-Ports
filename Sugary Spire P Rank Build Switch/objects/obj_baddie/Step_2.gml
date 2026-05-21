var _state = global.freezeframe ? frozenstate : state;
stuntouch--;
stuntouch = max(0, stuntouch);

if (squashedx == true)
{
    squashvalx = approach(squashvalx, 0.4, 0.15);
    
    if (squashvalx >= 0.4)
        squashedx = false;
}
else if (squashedx == false)
    squashvalx = approach(squashvalx, 0, 0.05);

if (squashedy == true)
{
    squashvaly = approach(squashvaly, 0.4, 0.15);
    
    if (squashvaly >= 0.4)
        squashedy = false;
}
else if (squashedy == false)
    squashvaly = approach(squashvaly, 0, 0.05);

if (state != baddiestate.grabbed && state != baddiestate.panicwait && state != baddiestate.secretwait)
    scr_collide();

if (state == baddiestate.grabbed)
{
    vsp = 0;
    hsp = 0;
    grounded = false;
}

if (secretjumped && grounded && invincible)
{
    invincible = false;
    secretjumped = false;
}
