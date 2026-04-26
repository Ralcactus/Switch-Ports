if (place_meeting_collision(x + hsp, y + vsp))
    instance_destroy();

afterimage++;

if (afterimage > 6)
{
    afterimage = 0;
    create_afterimage(UnknownEnum.Value_7, other.image_xscale);
}
