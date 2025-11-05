event_inherited();

if (in_saveroom(string("{0}_HIT", real(id)), global.respawnroom))
{
    toolong = true;
    hp = 1;
}
