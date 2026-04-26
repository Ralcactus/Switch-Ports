if (!global.panic)
    image_angle += (abs(sin(current_time / 625) * rotationVariable) * sign(image_xscale));
else
    image_angle += (sign(image_xscale) * 4);

x = xstart + (camera_get_view_x(view_camera[0]) * 0.005);
y = ystart + (camera_get_view_y(view_camera[0]) * 0.005);
