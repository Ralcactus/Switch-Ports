if (exit_freeze())
    exit;

anim_logic();
image_angle += rotate_spd;
x += hspd;
y += vspd;
vspd += grav;
image_alpha = approach(image_alpha, image_alpha_to, image_alpha_spd);

if ((destroy == 1 && image_alpha == image_alpha_to) || (destroy == 2 && (x < -100 || x > (room_width + 100) || y < -100 || y > (room_height + 100))))
    instance_destroy();
