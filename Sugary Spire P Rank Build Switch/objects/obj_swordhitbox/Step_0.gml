image_xscale = obj_player.xscale;
x = obj_player.x;
y = obj_player.y;

if (!global.freezeframe && obj_player.state != states.knightpepattack && obj_player.state != states.frozen && obj_player.state != states.finishingblow)
    instance_destroy();
