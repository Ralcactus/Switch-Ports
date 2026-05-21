cam_x = camx;
cam_y = camy;
rx = x - cam_x;
ry = y - cam_y;

if (vsp < 20)
    vsp += grav;

x += hsp;
y += floor(vsp);

if (!alarm[0])
    alarm[0] = 5;

drawx = rx;
drawy = ry;
