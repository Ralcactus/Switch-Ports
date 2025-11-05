var _id = instance_create_depth(x, y, z, obj_deadenemy);

with (_id)
{
    sprite_index = other.deadspr;
    hsp = irandom_range(2, 6) * image_xscale;
    vsp = irandom_range(-12, -6);
    zsp = irandom_range(12, -12);
    
    if (wall_behind(other.x, other.y, other.z))
        zsp = -abs(zsp);
}

if (addtosaveroom)
    add_saveroom(id, global.respawnroom);
