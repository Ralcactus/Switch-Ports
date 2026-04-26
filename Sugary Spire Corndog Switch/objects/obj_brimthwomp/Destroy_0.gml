if (ds_list_find_index(global.SaveRoom, id) == -1)
{
    create_debris(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), spr_brimstonethwomp);
    create_debris(random_range(bbox_left, bbox_right) - 96, random_range(bbox_top, bbox_bottom), spr_brimstonethwomp_arm1);
    create_debris(random_range(bbox_left, bbox_right) + 96, random_range(bbox_top, bbox_bottom), spr_brimstonethwomp_arm2);
    create_particle(x, y, spr_bangEffect);
    camera_shake_add(20, 40);
    event_play_oneshot("event:/SFX/general/breakmetal");
    ds_list_add(global.SaveRoom, id);
    scr_sleep_ext(5);
}

if (instance_exists(laserID))
    instance_destroy(laserID);

laserID = -4;
