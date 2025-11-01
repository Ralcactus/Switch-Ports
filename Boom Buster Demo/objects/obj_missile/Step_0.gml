event_inherited();

if (exit_freeze())
    exit;

if (abs(hspd) > 1)
{
    if (place_meeting(x, y, obj_megaball) || place_meeting(x, y, par_enemy))
        event_explode();
}
