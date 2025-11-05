if (game_paused())
{
    image_index -= image_speed;
    exit;
}

var drawpoint = point_direction(x, y, targetx, targety);
x += lengthdir_x(spd, drawpoint);
y += lengthdir_y(spd, drawpoint);

if (point_in_circle(x, y, targetx, targety, spd))
{
    x = targetx;
    y = targety;
    instance_destroy();
}
