image_xscale = playerID.xscale;

if (playerID.state != states.mach3 && playerID.state != states.minecart)
    instance_destroy();

if (playerID.state != states.minecart)
    x = playerID.x + (16 * playerID.xscale);
else if (playerID.state == states.minecart)
    x = playerID.x + (32 * playerID.xscale);

y = playerID.y;
depth = playerID.depth - 6;

if (playerID.state == states.machroll || playerID.sprite_index == playerID.spr_dive || (playerID.state == states.minecart && playerID.movespeed < 12))
    instance_destroy();
