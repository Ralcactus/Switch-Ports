ready = true;
my_character = instance_place(x, y, obj_map_npc);

if (my_character)
    my_character.interact = id;

width = 64 * image_xscale;
length = 64 * image_yscale;
height = 960;
var _inst = instance_create_layer(x, y, "Collision", obj_solid);
_inst.image_xscale = width / 64;
_inst.image_yscale = length / 64;
_inst.height = height;
_inst.z = z;
my_solid = _inst;
y -= z;
