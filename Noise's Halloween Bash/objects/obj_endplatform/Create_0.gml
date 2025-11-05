z = depth;
lightlevel = 1;
canCollide = -1;
flagLx = x - 90;
flagRx = x + 90;
flagLy = fast_ray(flagLx, bbox_top, flagLx, room_height);
flagRy = fast_ray(flagRx, bbox_top, flagRx, room_height);
flagind = 0;
leftshoeind = 0;
rightshoeind = 0;
leftkicktriggered = false;
rightkicktriggered = false;
leftkicked = false;
rightkicked = false;
block = noone;
playeron = false;

if (global.pumpkintotal < 5)
{
    var _blocky = fast_ray(x, bbox_top, x, 0);
    block = instance_create_depth(bbox_left, _blocky, depth, obj_nostickwall);
    block.image_xscale = (bbox_right - bbox_left) / 32;
    block.image_yscale = (bbox_top - _blocky) / 32;
}
