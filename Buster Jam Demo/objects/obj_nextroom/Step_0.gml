with (obj_map_player)
{
    if (instance_place_3d(x, y, z, other))
    {
        global.spawnID = other.ID;
        room_goto_fade(other.myroom);
        instance_destroy(other);
        auto = true;
        
        if (other.dir == 2)
        {
            xAxis = 1;
            yAxis = 0;
        }
        else if (other.dir == 3)
        {
            xAxis = -1;
            yAxis = 0;
        }
        else if (other.dir == 0)
        {
            xAxis = 0;
            yAxis = -1;
        }
        else if (other.dir == 1)
        {
            xAxis = 0;
            yAxis = 1;
        }
    }
}
