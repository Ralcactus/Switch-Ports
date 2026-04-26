if (sprite_index != sprtaunt)
{
    timer += (15 + (global.panic * 20));
    x = lerp(x, wave(xstart - 60, xstart + 60, flyspd, 0, timer), 0.35);
    y = lerp(y, wave(ystart - 20, ystart + 20, flyspd * 1.1, 0, timer), 0.35);
}

if (x != xprevious)
    image_xscale = sign(x - xprevious);

if (obj_parent_player.sprite_index == obj_parent_player.spr_taunt && bbox_in_camera(id, view_camera[0]))
    sprite_index = sprtaunt;
else if (!global.panic)
    sprite_index = sprfly;
else
    sprite_index = sprescape;
