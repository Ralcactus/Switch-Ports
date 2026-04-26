if (showtext)
    newdraw_y = approach(newdraw_y, 500, 5);
else
    newdraw_y = approach(newdraw_y, 600, 1);

if (instance_exists(obj_parent_player))
{
    if (obj_parent_player.y < (180 + obj_camera.Cam_y) && obj_parent_player.x >= ((obj_camera.Cam_x + (obj_camera.Camera_width / 2)) - 200) && obj_parent_player.x < (obj_camera.Cam_x + (obj_camera.Camera_width / 2) + 200))
        alpha = 0.5;
    else
        alpha = 1;
}
