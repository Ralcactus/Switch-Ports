y -= z;
var _inst = instance_create_layer(x, y, "Collision", obj_solid);
_inst.x = bbox_left;
_inst.y = bbox_top;
_inst.image_xscale = (bbox_right - bbox_left) / 64;
_inst.image_yscale = (bbox_bottom - bbox_top) / 64;
_inst.z = z;
_inst.height = 48;
