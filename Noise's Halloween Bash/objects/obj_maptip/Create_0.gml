text = string_get("tips/tutorial/maptip");
alpha = 0;
fadein = true;
shouldpause = false;
alarm[0] = 220;
depth = -13100;

if (in_saveroom("maptip", global.saveroom))
    instance_destroy();
else
    add_saveroom("maptip", global.saveroom);
