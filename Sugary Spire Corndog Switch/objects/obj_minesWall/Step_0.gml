if (place_meeting(x + 1, y, obj_charcherryOLD) || place_meeting(x - 1, y, obj_charcherryOLD))
{
    instance_destroy();
    instance_destroy(obj_charcherryOLD);
}
