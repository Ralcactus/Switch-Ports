testvariablenothing = false;

if (global.spawnID == ID && !spawned)
{
    if (global.spawnID == "save_block")
    {
        if (instance_exists(obj_map_saveblock))
        {
            x = obj_map_saveblock.x;
            y = obj_map_saveblock.y;
        }
        
        if (image_index == 0)
            x -= 72;
        else
            x += 72;
    }
    
    event_user(0);
}

spawned = true;
