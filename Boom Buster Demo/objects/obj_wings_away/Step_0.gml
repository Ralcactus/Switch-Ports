if (exit_freeze())
    exit;

wing_ind += anim_speed;
anim_speed = approach(anim_speed, 0.6, 0.012);
hspd += (0.1 * dir);
vspd -= 0.2;
hspd = clamp(hspd, -3, 3);

if (vspd < -20)
    vspd = -20;

x += hspd;
y += vspd;

if (y < -90)
    instance_destroy();
