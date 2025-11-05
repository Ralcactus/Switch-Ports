lighting_set(global.worldlightpos.x, global.worldlightpos.y, global.worldlightpos.z, lightlevel);
draw_model("Outhouse", x, y, z + 16, -34, -34, 12, 0, 180, 0);
draw_model("OuthouseDOOR", x - 30, y - 30, z + 7, 34, -34, -12, 0, tween(0, 150, doorswing, EASE_INOUT_BACK), 0);
lighting_end();
