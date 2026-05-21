x = playerID.x;
y = playerID.y;

if ((playerID.state != states.grind && playerID.state != states.minecart) || !playerID.grounded)
    instance_destroy();
