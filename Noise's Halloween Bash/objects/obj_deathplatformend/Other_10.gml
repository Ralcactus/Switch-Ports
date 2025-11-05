var _size = 40;
gpu_push_state();

if (model != "DeathPlatformWIREFRAME")
    lighting_set(global.worldlightpos.x, global.worldlightpos.y, global.worldlightpos.z * 0.5, lightlevel, c_white, 0, 1, undefined, true);
else
    gpu_set_cullmode(0);

draw_model(model, x, y, z, -_size, -_size, _size / 2, 0, 180, 0);

if (model != "DeathPlatformWIREFRAME")
    lighting_end();

gpu_pop_state();
