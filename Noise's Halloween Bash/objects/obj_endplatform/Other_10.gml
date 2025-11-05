lighting_set(global.worldlightpos.x, global.worldlightpos.y, global.worldlightpos.z, lightlevel * 1.35);
draw_model("EndPlatform", x, y, z, -((image_xscale * 83) / 2), -(sprite_height / 2), ((image_xscale * 83) + sprite_height) / 8, 0, 180, 0);
lighting_end();
