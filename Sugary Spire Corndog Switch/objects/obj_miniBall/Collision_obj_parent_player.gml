if (grounded)
{
    image_xscale = 4 * sign(image_xscale);
    vsp = -6;
    image_xscale = sign(obj_parent_player.xscale);
    grounded = 0;
}
