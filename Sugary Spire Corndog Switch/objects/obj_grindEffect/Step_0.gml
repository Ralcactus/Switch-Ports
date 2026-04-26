x = playerID.x;
y = playerID.y;

if ((playerID.state != UnknownEnum.Value_36 && playerID.state != UnknownEnum.Value_100) || !playerID.grounded)
    instance_destroy();
