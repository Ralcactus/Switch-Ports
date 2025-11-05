if (canCollide == -1 || canCollide(obj_player.id, obj_player.x, obj_player.y))
{
    instance_destroy();
    gamepadvibrate(0.2, 0, 8);
}
