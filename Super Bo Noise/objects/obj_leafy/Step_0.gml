
if (dimOpacity > 0)
    dimOpacity = approach(dimOpacity, 0, dimSpeed)
if ((!active) && bbox_in_camera(view_camera[0]))
{
    active = true
    initialDistance = point_distance(x, y, obj_player1.x, obj_player1.y)
    alarm[0] = 30
}
