if (place_meeting(x + 2, y, obj_donutShitted) || place_meeting(x - 2, y, obj_donutShitted))
    instance_destroy();

var tplay = get_nearestPlayer(x, y);

with (tplay)
{
    if (place_meeting(x + hsp, y + vsp, other.id) && state == UnknownEnum.Value_46)
        instance_destroy(other.id);
}
