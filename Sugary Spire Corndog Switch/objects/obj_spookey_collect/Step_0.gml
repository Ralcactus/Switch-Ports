if (place_meeting_collision(x, y))
{
    var dir = point_direction(x, y, obj_parent_player.x, obj_parent_player.y);
    x += lengthdir_x(16, dir);
    y += lengthdir_y(16, dir);
}
