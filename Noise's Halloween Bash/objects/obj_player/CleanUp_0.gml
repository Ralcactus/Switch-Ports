ds_map_destroy(currcheckpoint.respawnroom);
currcheckpoint.respawnroom = -1;

if (currcheckpoint.saveroom != noone)
{
    ds_map_destroy(currcheckpoint.saveroom);
    currcheckpoint.saveroom = noone;
}
