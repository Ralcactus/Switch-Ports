event_inherited();

if (exit_freeze() || inPipe)
    exit;

if (!tossed)
    timer_logic(0);

if (place_meeting(x, y, obj_killbom) && !on_path)
    event_explode();
