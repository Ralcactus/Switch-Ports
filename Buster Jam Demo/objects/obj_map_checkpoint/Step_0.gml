with (obj_map_player)
{
    if (instance_place_3d(x, y, z, other))
        global.spawnID = other.ID;
}
