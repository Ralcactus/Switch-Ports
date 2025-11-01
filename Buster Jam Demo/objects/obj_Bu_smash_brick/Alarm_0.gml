var _len;

if (instance_exists(obj_boss_tutorial))
    _len = 750;
else
    _len = 160;

x = controller.game_width + _len + irandom_range(400, 650);
hspd = controller.microgame_hspd;
