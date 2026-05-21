cam_x = camx;
cam_y = camy;
rx = x - cam_x;
ry = y - cam_y;
initialvsp = random_range(-5, -10);
initialhsp = sign(rx - (obj_player.x - cam_x)) * random_range(5, 10);

if (rx != (obj_player.x - cam_x))
    image_xscale = -sign(obj_player.x - cam_x);

vsp = initialvsp;
hsp = initialhsp;
grav = 0.3;
alarm[0] = 5;
cigar = 0;
stomped = 0;
drawx = rx;
drawy = ry;
canrotate = false;
rotatedirection = choose(-1, 0, 1);
rotatevalue = irandom_range(-20, 20);
pal_sprite = noone;
spr_palette = noone;
paletteselect = noone;
col = 0;
depth = -250;
