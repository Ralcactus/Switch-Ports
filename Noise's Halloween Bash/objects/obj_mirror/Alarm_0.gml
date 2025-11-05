with (obj_player)
{
    image_xscale = 1;
    dir = image_xscale;
    targetroom = PatchPerilousRoute;
    targetdoor = 0;
    instance_create_depth(0, 0, 0, obj_mirrortransition);
}

alarm[0] = -1;
