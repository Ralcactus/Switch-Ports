image_speed = 0.35
playerID = -4
state = PlayerState.frozen
hookStopID = instance_nearest(x, y, obj_hookstop)

if (!instance_exists(hookStopID))
{
	show_debug_message(string("Hook ({0}) at ({1}, {2}) didn't find stop", id, x, y))
	alarm[0] = 1
}
