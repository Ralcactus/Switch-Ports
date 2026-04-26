image_xscale = obj_parent_player.xscale;
sprite_index = obj_parent_player.sprite_index;
image_index = obj_parent_player.image_index;
x = obj_parent_player.x;
y = obj_parent_player.y;

if (obj_parent_player.state != UnknownEnum.Value_105)
    instance_destroy();
