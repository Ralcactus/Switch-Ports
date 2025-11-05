if (canCollide == -1 || canCollide(obj_player.id, obj_player.x, obj_player.y))
{
    event_perform(ev_destroy, 0);
    gamepadvibrate(0.2, 0, 8);
}
