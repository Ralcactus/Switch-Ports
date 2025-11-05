lighting_set(global.worldlightpos.x, global.worldlightpos.y, global.worldlightpos.z, lightlevel, c_white, 0, 1 - firescale, undefined, true);
draw_model("CrateFLAME", x + (sprite_width / 2), y + (sprite_height / 2), z, -(sprite_height / 2), -(sprite_height / 2), (sprite_width + sprite_height) / 8, 0, 180, 0);
lighting_end();
