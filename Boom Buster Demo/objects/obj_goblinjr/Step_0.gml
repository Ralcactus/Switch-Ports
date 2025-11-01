if (exit_freeze())
    exit;

event_inherited();
timer_logic(0);
hspd_bounce = approach(hspd_bounce, 0, 0.22);
