vsp = min(vsp + grav, terminalVelocity);
x += hsp;
trueY += vsp;
y = trueY;

if (y > (room_height * 2))
    instance_destroy();
