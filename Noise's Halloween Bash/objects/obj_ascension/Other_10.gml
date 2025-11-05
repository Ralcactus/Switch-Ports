var _size = 40;
lighting_set(global.worldlightpos.x, global.worldlightpos.y, global.worldlightpos.z * 0.5, lightlevel, c_white, 0, 1, undefined, false);
draw_model("AscensionPlatform", x, y, z, -_size, -_size, _size / 2, 0, 180, 0);
lighting_end();
