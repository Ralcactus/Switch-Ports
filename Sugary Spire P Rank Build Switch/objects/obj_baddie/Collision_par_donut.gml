if (!global.freezeframe)
{
    if (state != baddiestate.cherrywait)
        instance_destroy();
    
    if (other.object_index != obj_donutShitted)
        instance_destroy(other.id);
}
