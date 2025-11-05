x = obj_player.x;
y = obj_player.y;
image_xscale = obj_player.image_xscale;
image_angle = obj_player.angle;
y += (40 * abs(angle_difference(0, image_angle) / 180));
x += ((64 * angle_difference(0, image_angle)) / 180);
