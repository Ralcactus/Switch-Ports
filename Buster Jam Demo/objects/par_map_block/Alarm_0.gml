y -= z;
z -= 288;
zstart = z;
my_solid = instance_create_layer(x, y, "GUI", obj_solid);
my_solid.sprite_index = spr_map_block_shadow;
my_solid.z = z;
my_solid.height = 288;
my_solid.reset_y = false;
