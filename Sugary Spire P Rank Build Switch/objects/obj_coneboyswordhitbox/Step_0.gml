x = obj_player.x;
y = obj_player.y;
image_xscale = obj_player.xscale;

with (obj_player)
{
    if (substate == 1 && state != states.coneboyinhale && state != states.uppercut)
        instance_destroy(other.id);
    
    if (substate == 2 && state != states.coneboykick)
        instance_destroy(other.id);
}
