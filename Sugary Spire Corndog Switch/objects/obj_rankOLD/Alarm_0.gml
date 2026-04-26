scr_hatScript();
scr_levelSet();
global.levelname = "none";
obj_parent_player.targetDoor = "A";
obj_parent_player.targetRoom = hub_w1;
instance_create(x, y, obj_fadeoutTransition);
