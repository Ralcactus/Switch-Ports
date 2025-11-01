if (exit_freeze())
    exit;

physics_apply();
timer_logic(0);
x += hspd;

if (x < -400 || x > (room_width + 400))
    instance_destroy();
