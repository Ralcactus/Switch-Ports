cur_jewel = 0;
active = 0;
alarm[0] = 1;
skippable = 1;
free = 0;
zurasu = 0;
zurasucon = 0;
xxx = __view_get(e__VW.XView, 0);
yyy = __view_get(e__VW.YView, 0);
writer = 432432;
side = 1;
remfacex = 0;
remfacey = 0;
remwriterx = 0;
remwritery = 0;
myface = -4;
jpspecial = 0;

if (instance_exists(obj_player))
{
	if (obj_player.y > (yyy + 130))
		side = 0;
}

f = 1;

drawdebug = 0;
drawdebugdialoguer = 0;
