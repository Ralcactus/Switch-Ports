if (obj_parent_player.state == UnknownEnum.Value_106 || obj_parent_player.state == UnknownEnum.Value_0)
    fadealpha = approach(fadealpha, 0.75, 0.05);
else
    fadealpha = approach(fadealpha, -0.0000001, 0.05);

if (fadealpha <= -0.0000001)
    instance_destroy();
