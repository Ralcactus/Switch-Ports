var _id = instance_create_depth(x, y, z, obj_deadenemy);

with (_id)
{
    sprite_index = other.deadspr;
    hsp = irandom_range(2, 4) * image_xscale;
    vsp = irandom_range(-12, -8);
    zsp = irandom_range(1, -1);
    
    if (wall_behind(other.x, other.y, other.z))
        zsp = -abs(zsp);
}

if (addtosaveroom)
    add_saveroom(id, global.respawnroom);

instance_destroy(id, false);
