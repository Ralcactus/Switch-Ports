if (place_meeting(x, y, [par_destructible]))
    inblock = true;

if (in_saveroom(id, global.respawnroom))
    instance_destroy(id, false);
