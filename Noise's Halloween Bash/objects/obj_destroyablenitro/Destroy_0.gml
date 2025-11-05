if (arrowid != noone)
    add_saveroom(string("{0}_NITRO", real(arrowid)), global.respawnroom);
else
    add_saveroom(id, global.respawnroom);

global.destroyedcount++;
crateeffect(#60E878);
combo();
instance_create_depth(x + (sprite_width / 2), y + (sprite_height / 2), z, obj_explosion);
