/// @function point_in_camera()
/// @description Spits out True if point is in camera's bounds
function point_in_camera(pos_x, pos_y, camera)
{
    var cam_x = camera_get_view_x(camera);
    var cam_y = camera_get_view_y(camera);
    var cam_w = camera_get_view_width(camera);
    var cam_h = camera_get_view_height(camera);
    return point_in_rectangle(pos_x, pos_y, cam_x, cam_y, cam_x + cam_w, cam_y + cam_h);
}

/// @function bbox_in_camera()
/// @description Spits out True if bbox is in camera's bounds
function bbox_in_camera(camera)
{
    var cam_x = camera_get_view_x(camera);
    var cam_y = camera_get_view_y(camera);
    var cam_w = camera_get_view_width(camera);
    var cam_h = camera_get_view_height(camera);
    return rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, cam_x, cam_y, cam_x + cam_w, cam_y + cam_h);
}

/// @function bbox_in_camera_ext()
/// @description Spits out True if bbox plus distance is in camera's bounds
function bbox_in_camera_ext(camera, dist)
{
    var cam_x = camera_get_view_x(camera);
    var cam_y = camera_get_view_y(camera);
    var cam_w = camera_get_view_width(camera);
    var cam_h = camera_get_view_height(camera);
    return rectangle_in_rectangle(bbox_left - dist, bbox_top - dist, bbox_right + dist, bbox_bottom + dist, cam_x, cam_y, cam_x + cam_w, cam_y + cam_h);
}

/// @function camera_shake()
/// @description Shakes the Camera
function camera_shake(shake, shake_acc)
{
    with (obj_camera)
    {
        shake_mag = shake;
        shake_mag_acc = shake_acc / room_speed;
    }
    
    return true;
}

/// @function camera_get_position_struct()
/// @description Spits out struct of Camera Positions
function camera_get_position_struct(cam_id, use_array = noone) constructor
{
    var _cam_x = camera_get_view_x(cam_id);
    var _cam_y = camera_get_view_y(cam_id);
    var _cam_width = camera_get_view_width(cam_id);
    var _cam_height = camera_get_view_height(cam_id);
    centeredcam_x = _cam_x + (_cam_width / 2);
    centeredcam_y = _cam_y + (_cam_height / 2);
    cam_x = _cam_x;
    cam_y = _cam_y;
    
    if (use_array != noone)
    {
        centeredcam_x -= use_array[0];
        centeredcam_y -= use_array[1];
    }
}

function screen_flash(duration)
{
    global.screenflash = duration;
}

// unused
function pummel_dim() { }
