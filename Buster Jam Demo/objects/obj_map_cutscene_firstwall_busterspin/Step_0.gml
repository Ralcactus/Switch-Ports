anim_logic();
physics_apply_3d();
event_user(state);
timer_logic(0);
timer_logic(1);
anim_speed = approach(anim_speed, 1, 0.015);
