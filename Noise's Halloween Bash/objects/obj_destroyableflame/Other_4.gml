if (in_saveroom(id, global.respawnroom))
{
    instance_destroy(fireid);
    instance_destroy(id, false);
}
