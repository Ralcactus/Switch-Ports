image_index = 0;
image_speed = 0.35;
depth = 8;
scr_collision_init();
vsp = 1;
grav = 0.4;
terminalVelocity = 25;
x = obj_doorB.x + (obj_doorB.sprite_width / 2);
y = obj_doorB.y + (obj_doorB.sprite_height / 2);

if (!instance_exists(obj_cutsceneManager))
    instance_destroy();
