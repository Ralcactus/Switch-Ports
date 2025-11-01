if (global.texfilter)
    gpu_set_texfilter(true);

gpu_set_blendenable(false);
draw_surface(application_surface, -256 * app_resize, 0);
gpu_set_blendenable(true);

if (global.texfilter)
    gpu_set_texfilter(false);
