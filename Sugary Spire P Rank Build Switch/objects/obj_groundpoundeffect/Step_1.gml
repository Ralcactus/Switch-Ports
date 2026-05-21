if (playerID.state != states.freefall && !(playerID.state == states.rupertjump))
    instance_destroy();

x = playerID.x;
y = playerID.y + 32;
depth = playerID.depth - 6;
