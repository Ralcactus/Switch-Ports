if (bm != 0)
    gpu_set_blendmode(bm);

if object_get_sprite(self) != -1
	draw_self();

if (bm != 0)
    gpu_set_blendmode(bm_normal);
