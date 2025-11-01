view_visible[view] = false;
camera_set_view_pos(view_camera[view], 0, 0);

if (texture_group != -4)
    texture_flush(texture_group);
