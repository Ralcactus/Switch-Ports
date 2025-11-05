vsp = 0;
hsp = 0;
zsp = 0;
grav = 0.4;
alarm[0] = 5;

if (x != obj_player.x)
    image_xscale = -sign(x - obj_player.x);

spinout = false;

if (chance(50))
    spinout = true;

offset = false;
