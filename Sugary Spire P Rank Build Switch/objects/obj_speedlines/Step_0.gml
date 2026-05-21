x = playerID.x;
y = playerID.y;
image_xscale = playerID.xscale;

if (!(playerID.state == states.mach2 && playerID.sprite_index != playerID.spr_mach1) && playerID.state != states.mach3)
    instance_destroy();
